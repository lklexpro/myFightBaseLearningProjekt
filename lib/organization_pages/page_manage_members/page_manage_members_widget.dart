import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_member_management_menu/comp_member_management_menu_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_invitation_data/comp_user_list_invitation_data_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_manage_members_model.dart';
export 'page_manage_members_model.dart';

class PageManageMembersWidget extends StatefulWidget {
  const PageManageMembersWidget({Key? key}) : super(key: key);

  @override
  _PageManageMembersWidgetState createState() =>
      _PageManageMembersWidgetState();
}

class _PageManageMembersWidgetState extends State<PageManageMembersWidget> {
  late PageManageMembersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageManageMembersModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 58.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 28.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'lcpavpb4' /* Mitglieder verwalten */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).accent4,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<UserMembersRecord>>(
            stream: queryUserMembersRecord(
              parent: currentUserReference,
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: SpinKitChasingDots(
                      color: Color(0xFFCF2E2E),
                      size: 20.0,
                    ),
                  ),
                );
              }
              List<UserMembersRecord> columnUserMembersRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnUserMembersRecord =
                  columnUserMembersRecordList.isNotEmpty
                      ? columnUserMembersRecordList.first
                      : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: wrapWithModel(
                                model: _model.searchBarModel,
                                updateCallback: () => setState(() {}),
                                child: SearchBarWidget(
                                  userSearchAction: () async {},
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AlignedTooltip(
                                  content: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'yol2hgui' /* Halte den Eintrag gedrückt um ... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      )),
                                  offset: 4.0,
                                  preferredDirection: AxisDirection.down,
                                  borderRadius: BorderRadius.circular(8.0),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  tailBaseWidth: 24.0,
                                  tailLength: 12.0,
                                  waitDuration: Duration(milliseconds: 100),
                                  showDuration: Duration(milliseconds: 1500),
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: Icon(
                                    Icons.info_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'h6vqavjz' /* Mitglieder in deinem Verein:  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          columnUserMembersRecord
                                              ?.userData?.length
                                              ?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 12.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final usersMembers = functions
                                          .sortListOfUserDataStructByLabel(
                                              columnUserMembersRecord!.userData
                                                  .toList())
                                          .toList();
                                      if (usersMembers.isEmpty) {
                                        return Center(
                                          child: CompEmptyPageWidget(),
                                        );
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: usersMembers.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 4.0),
                                        itemBuilder:
                                            (context, usersMembersIndex) {
                                          final usersMembersItem =
                                              usersMembers[usersMembersIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onLongPress: () async {
                                              HapticFeedback.selectionClick();
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CompMemberManagementMenuWidget(
                                                        userRelationData:
                                                            usersMembersItem,
                                                        authUserMemberListDoc:
                                                            columnUserMembersRecord!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .compUserListRelationDataModels
                                                  .getModel(
                                                usersMembersItem.userID,
                                                usersMembersIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  CompUserListRelationDataWidget(
                                                key: Key(
                                                  'Key83s_${usersMembersItem.userID}',
                                                ),
                                                userDocReference:
                                                    usersMembersItem.userDocRef,
                                                userRelationData:
                                                    usersMembersItem,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible:
                            columnUserMembersRecord!.invitedUserData.length > 0,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController,
                              child: ExpandablePanel(
                                header: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'p4vip3xa' /* Ausstehende Einladung */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Builder(
                                  builder: (context) {
                                    final userInvitedMembers =
                                        columnUserMembersRecord?.invitedUserData
                                                ?.toList() ??
                                            [];
                                    if (userInvitedMembers.isEmpty) {
                                      return CompEmptyPageWidget();
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        8.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: userInvitedMembers.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 4.0),
                                      itemBuilder:
                                          (context, userInvitedMembersIndex) {
                                        final userInvitedMembersItem =
                                            userInvitedMembers[
                                                userInvitedMembersIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onLongPress: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Einladung zurückziehen'),
                                                          content: Text(
                                                              'Möchtest du diese Einladung zurückziehen?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Abbrechen'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Bestätigen'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              _model.withdrawOrganizationInviteResult =
                                                  await WithdrawOrganizationInviteCall
                                                      .call(
                                                authenticatedUserId:
                                                    currentUserUid,
                                                requestedUserId:
                                                    userInvitedMembersItem
                                                        .user?.id,
                                              );
                                              if ((_model
                                                      .withdrawOrganizationInviteResult
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Du hast die Einladung an ${userInvitedMembersItem.userDisplayName} zurückgezogen.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF39D2C0),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Tut uns leid, etwas ist schiefgelaufen.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            }

                                            setState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model
                                                .compUserListInvitationDataModels
                                                .getModel(
                                              userInvitedMembersItem.userID,
                                              userInvitedMembersIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child:
                                                CompUserListInvitationDataWidget(
                                              key: Key(
                                                'Keyo74_${userInvitedMembersItem.userID}',
                                              ),
                                              userDocReference:
                                                  userInvitedMembersItem.user,
                                              userInvitationData:
                                                  userInvitedMembersItem,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: Icons.arrow_left_sharp,
                                  collapseIcon: Icons.arrow_drop_down,
                                  iconColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  iconPadding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
