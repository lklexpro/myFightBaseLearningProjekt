import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_invitation_data/comp_user_list_invitation_data_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_event_response_overview_model.dart';
export 'comp_event_response_overview_model.dart';

class CompEventResponseOverviewWidget extends StatefulWidget {
  const CompEventResponseOverviewWidget({
    Key? key,
    this.tabIndexToOpen,
    required this.eventDoc,
  }) : super(key: key);

  final int? tabIndexToOpen;
  final EventsRecord? eventDoc;

  @override
  _CompEventResponseOverviewWidgetState createState() =>
      _CompEventResponseOverviewWidgetState();
}

class _CompEventResponseOverviewWidgetState
    extends State<CompEventResponseOverviewWidget>
    with TickerProviderStateMixin {
  late CompEventResponseOverviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompEventResponseOverviewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.returnSelectedMembers = FFAppState()
            .listUserRelationDataTempStorage
            .toList()
            .cast<UserRelationDataStruct>();
        _model.returnSelectedFollowers = FFAppState()
            .listUserRelationDataTempStorage2
            .toList()
            .cast<UserRelationDataStruct>();
      });
      await _model.refreshQuery(context);
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabIndexToOpen == null ? 0 : widget.tabIndexToOpen,
            0,
          ),
          3),
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 4.0,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'fhhdgozy' /* Personen auswählen */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.searchBarModel,
                      updateCallback: () => setState(() {}),
                      child: SearchBarWidget(
                        userSearchAction: () async {},
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              unselectedLabelStyle: TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '5qk69dk9' /* Ja */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'yumzvwhm' /* Nein */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'dprfoqn2' /* Unsicher */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'gu3s8ajl' /* Offen */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {},
                                  () async {},
                                  () async {},
                                  () async {}
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final userListAccepted = widget
                                                    .eventDoc
                                                    ?.userInvitationData
                                                    ?.where((e) =>
                                                        valueOrDefault<bool>(
                                                          e.userInvitationResponse ==
                                                              'accepted',
                                                          false,
                                                        ))
                                                    .toList()
                                                    ?.toList() ??
                                                [];
                                            if (userListAccepted.isEmpty) {
                                              return CompEmptyPageWidget();
                                            }
                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                8.0,
                                                0,
                                                8.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  userListAccepted.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 4.0),
                                              itemBuilder: (context,
                                                  userListAcceptedIndex) {
                                                final userListAcceptedItem =
                                                    userListAccepted[
                                                        userListAcceptedIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .compUserListInvitationDataModels1
                                                      .getModel(
                                                    userListAcceptedItem.userID,
                                                    userListAcceptedIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      CompUserListInvitationDataWidget(
                                                    key: Key(
                                                      'Keywyq_${userListAcceptedItem.userID}',
                                                    ),
                                                    userDocReference:
                                                        userListAcceptedItem
                                                            .user,
                                                    userInvitationData:
                                                        userListAcceptedItem,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final userListDeclined = widget
                                                                .eventDoc
                                                                ?.userInvitationData
                                                                ?.where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      e.userInvitationResponse ==
                                                                          'declined',
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                ?.toList() ??
                                                            [];
                                                        if (userListDeclined
                                                            .isEmpty) {
                                                          return CompEmptyPageWidget();
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            8.0,
                                                            0,
                                                            8.0,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              userListDeclined
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              userListDeclinedIndex) {
                                                            final userListDeclinedItem =
                                                                userListDeclined[
                                                                    userListDeclinedIndex];
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .compUserListInvitationDataModels2
                                                                  .getModel(
                                                                userListDeclinedItem
                                                                    .userID,
                                                                userListDeclinedIndex,
                                                              ),
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  CompUserListInvitationDataWidget(
                                                                key: Key(
                                                                  'Key7v9_${userListDeclinedItem.userID}',
                                                                ),
                                                                userDocReference:
                                                                    userListDeclinedItem
                                                                        .user,
                                                                userInvitationData:
                                                                    userListDeclinedItem,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final userListIndecesive = widget
                                                                .eventDoc
                                                                ?.userInvitationData
                                                                ?.where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      e.userInvitationResponse ==
                                                                          'indecisive',
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                ?.toList() ??
                                                            [];
                                                        if (userListIndecesive
                                                            .isEmpty) {
                                                          return CompEmptyPageWidget();
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            8.0,
                                                            0,
                                                            8.0,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              userListIndecesive
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              userListIndecesiveIndex) {
                                                            final userListIndecesiveItem =
                                                                userListIndecesive[
                                                                    userListIndecesiveIndex];
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .compUserListInvitationDataModels3
                                                                  .getModel(
                                                                userListIndecesiveItem
                                                                    .userID,
                                                                userListIndecesiveIndex,
                                                              ),
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  CompUserListInvitationDataWidget(
                                                                key: Key(
                                                                  'Key2ky_${userListIndecesiveItem.userID}',
                                                                ),
                                                                userDocReference:
                                                                    userListIndecesiveItem
                                                                        .user,
                                                                userInvitationData:
                                                                    userListIndecesiveItem,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final userListPending = widget
                                                                .eventDoc
                                                                ?.userInvitationData
                                                                ?.where((e) =>
                                                                    e.userInvitationResponse ==
                                                                    'pending')
                                                                .toList()
                                                                ?.toList() ??
                                                            [];
                                                        if (userListPending
                                                            .isEmpty) {
                                                          return CompEmptyPageWidget();
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            8.0,
                                                            0,
                                                            8.0,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              userListPending
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              userListPendingIndex) {
                                                            final userListPendingItem =
                                                                userListPending[
                                                                    userListPendingIndex];
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .compUserListInvitationDataModels4
                                                                  .getModel(
                                                                userListPendingItem
                                                                    .userID,
                                                                userListPendingIndex,
                                                              ),
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  CompUserListInvitationDataWidget(
                                                                key: Key(
                                                                  'Keyj7w_${userListPendingItem.userID}',
                                                                ),
                                                                userDocReference:
                                                                    userListPendingItem
                                                                        .user,
                                                                userInvitationData:
                                                                    userListPendingItem,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
