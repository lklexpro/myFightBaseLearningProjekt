import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_filter_facet_search/comp_filter_facet_search_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_select_user_list_model.dart';
export 'comp_select_user_list_model.dart';

class CompSelectUserListWidget extends StatefulWidget {
  const CompSelectUserListWidget({
    Key? key,
    this.tabIndexToOpen,
    required this.showFollowerSelection,
    this.listUserIDsToExcludeFromList,
  }) : super(key: key);

  final int? tabIndexToOpen;
  final bool? showFollowerSelection;
  final List<String>? listUserIDsToExcludeFromList;

  @override
  _CompSelectUserListWidgetState createState() =>
      _CompSelectUserListWidgetState();
}

class _CompSelectUserListWidgetState extends State<CompSelectUserListWidget>
    with TickerProviderStateMixin {
  late CompSelectUserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompSelectUserListModel());

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
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabIndexToOpen == null ? 0 : widget.tabIndexToOpen,
            0,
          ),
          1),
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

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 4.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
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
                                  '9xxyhs2s' /* Personen auswählen */,
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
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (widget.showFollowerSelection ?? false) {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).titleMedium,
                                  unselectedLabelStyle: TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  padding: EdgeInsets.all(4.0),
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'ip2udd9s' /* Mitglieder */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '8uumpu6p' /* Follower */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) =>
                                          SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        icon: Icon(
                                                          Icons.filter_list,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CompFilterFacetSearchWidget(),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.filterParameterMembers =
                                                                      value));

                                                          setState(() {});
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'eud0251e' /* Alle Mitglieder auswählen */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Hammersmith One',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Switch.adaptive(
                                                        value: _model
                                                                .switchSelectAllMembersValue1 ??=
                                                            FFAppState()
                                                                .listSearchSelectAllMembers,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchSelectAllMembersValue1 =
                                                              newValue!);
                                                          if (newValue!) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .listSearchSelectAllMembers =
                                                                  true;
                                                            });
                                                            await _model
                                                                .refreshQuery(
                                                                    context);
                                                            setState(() {});
                                                          } else {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .listSearchSelectAllMembers =
                                                                  false;
                                                            });
                                                            setState(() {
                                                              _model.returnSelectedMembers =
                                                                  [];
                                                            });
                                                            await _model
                                                                .refreshQuery(
                                                                    context);
                                                            setState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              content: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final memberUserRelationData = _model
                                                                  .queryResultMembers
                                                                  .where((e) =>
                                                                      !valueOrDefault<
                                                                          bool>(
                                                                        widget
                                                                            .listUserIDsToExcludeFromList
                                                                            ?.contains(e.userID),
                                                                        false,
                                                                      ))
                                                                  .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  8.0,
                                                                  0,
                                                                  8.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    memberUserRelationData
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        memberUserRelationDataIndex) {
                                                                  final memberUserRelationDataItem =
                                                                      memberUserRelationData[
                                                                          memberUserRelationDataIndex];
                                                                  return Container(
                                                                    height:
                                                                        100.0,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .compUserListDynamicChildrenMemberModels1
                                                                              .getModel(
                                                                            memberUserRelationDataItem.userDocRef!.id,
                                                                            memberUserRelationDataIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CompUserListRelationDataWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyci4_${memberUserRelationDataItem.userDocRef!.id}',
                                                                            ),
                                                                            userRelationData:
                                                                                memberUserRelationDataItem,
                                                                            userDocReference:
                                                                                memberUserRelationDataItem.userDocRef,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.3,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      child: CheckboxListTile(
                                                                                        value: _model.checkboxListTileMemberValueMap1[memberUserRelationDataItem] ??= FFAppState().listSearchSelectAllMembers || functions.checkIfUserIDisInUserRelationDataStructList(_model.returnSelectedMembers.toList(), memberUserRelationDataItem.userID),
                                                                                        onChanged: (newValue) async {
                                                                                          setState(() => _model.checkboxListTileMemberValueMap1[memberUserRelationDataItem] = newValue!);
                                                                                          if (newValue!) {
                                                                                            _model.updatePage(() {
                                                                                              _model.addToReturnSelectedMembers(memberUserRelationDataItem);
                                                                                            });
                                                                                          } else {
                                                                                            if (_model.switchSelectAllMembersValue1!) {
                                                                                              setState(() {
                                                                                                _model.switchSelectAllMembersValue1 = false;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().listSearchSelectAllMembers = false;
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.returnSelectedMembers = _model.queryResultMembers.toList().cast<UserRelationDataStruct>();
                                                                                              });
                                                                                            }
                                                                                            setState(() {
                                                                                              _model.removeFromReturnSelectedMembers(memberUserRelationDataItem);
                                                                                            });
                                                                                          }
                                                                                        },
                                                                                        title: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'l8d2vwah' /*   */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                fontFamily: 'Hammersmith One',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                        ),
                                                                                        subtitle: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'u5xhir9m' /*   */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                        ),
                                                                                        tileColor: FlutterFlowTheme.of(context).tertiary,
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FlutterFlowTheme.of(context).info,
                                                                                        dense: false,
                                                                                        controlAffinity: ListTileControlAffinity.trailing,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) =>
                                          SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'iymh9ci9' /* Alle Follower auswählen */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Hammersmith One',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                                  .switchSelectAllFollowersValue ??=
                                                              FFAppState()
                                                                  .listSearchSelectAllFollowers,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .switchSelectAllFollowersValue =
                                                                newValue!);
                                                            if (newValue!) {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .listSearchSelectAllFollowers =
                                                                    true;
                                                              });
                                                              await _model
                                                                  .refreshQuery(
                                                                      context);
                                                              setState(() {});
                                                            } else {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .listSearchSelectAllFollowers =
                                                                    false;
                                                              });
                                                              setState(() {
                                                                _model.returnSelectedFollowers =
                                                                    [];
                                                              });
                                                              await _model
                                                                  .refreshQuery(
                                                                      context);
                                                              setState(() {});
                                                            }
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              content: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final followerUserRelationData =
                                                                  _model
                                                                      .queryResultFollowers
                                                                      .toList();
                                                              if (followerUserRelationData
                                                                  .isEmpty) {
                                                                return CompEmptyPageWidget();
                                                              }
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  8.0,
                                                                  0,
                                                                  8.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    followerUserRelationData
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        followerUserRelationDataIndex) {
                                                                  final followerUserRelationDataItem =
                                                                      followerUserRelationData[
                                                                          followerUserRelationDataIndex];
                                                                  return Container(
                                                                    height:
                                                                        100.0,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .compUserListDynamicChildrenFollowerModels
                                                                              .getModel(
                                                                            followerUserRelationDataItem.userDocRef!.id,
                                                                            followerUserRelationDataIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CompUserListRelationDataWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyftk_${followerUserRelationDataItem.userDocRef!.id}',
                                                                            ),
                                                                            userRelationData:
                                                                                followerUserRelationDataItem,
                                                                            userDocReference:
                                                                                followerUserRelationDataItem.userDocRef,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.3,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      child: CheckboxListTile(
                                                                                        value: _model.checkboxListTileFollowerValueMap[followerUserRelationDataItem] ??= FFAppState().listSearchSelectAllFollowers || functions.checkIfUserIDisInUserRelationDataStructList(_model.returnSelectedFollowers.toList(), followerUserRelationDataItem.userID),
                                                                                        onChanged: (newValue) async {
                                                                                          setState(() => _model.checkboxListTileFollowerValueMap[followerUserRelationDataItem] = newValue!);
                                                                                          if (newValue!) {
                                                                                            setState(() {
                                                                                              _model.addToReturnSelectedFollowers(followerUserRelationDataItem);
                                                                                            });
                                                                                          } else {
                                                                                            if (_model.switchSelectAllFollowersValue!) {
                                                                                              setState(() {
                                                                                                _model.switchSelectAllFollowersValue = false;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().listSearchSelectAllFollowers = false;
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.returnSelectedFollowers = [];
                                                                                              });
                                                                                            }
                                                                                            setState(() {
                                                                                              _model.removeFromReturnSelectedFollowers(followerUserRelationDataItem);
                                                                                            });
                                                                                          }
                                                                                        },
                                                                                        title: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'lb8hgbuk' /*   */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                fontFamily: 'Hammersmith One',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                        ),
                                                                                        subtitle: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'zqljgtlj' /*   */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                        ),
                                                                                        tileColor: FlutterFlowTheme.of(context).tertiary,
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FlutterFlowTheme.of(context).info,
                                                                                        dense: false,
                                                                                        controlAffinity: ListTileControlAffinity.trailing,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StickyHeader(
                                  overlapHeaders: false,
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 46.0,
                                              icon: Icon(
                                                Icons.filter_list,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CompFilterFacetSearchWidget(),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model
                                                            .filterParameterMembers2 =
                                                        value));

                                                setState(() {});
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'flteqd4t' /* Alle Mitglieder auswählen */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Hammersmith One',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Switch.adaptive(
                                              value: _model
                                                      .switchSelectAllMembersValue2 ??=
                                                  FFAppState()
                                                      .listSearchSelectAllMembers,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                        .switchSelectAllMembersValue2 =
                                                    newValue!);
                                                if (newValue!) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .listSearchSelectAllMembers =
                                                        true;
                                                  });
                                                  await _model
                                                      .refreshQuery(context);
                                                  setState(() {});
                                                } else {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .listSearchSelectAllMembers =
                                                        false;
                                                  });
                                                  setState(() {
                                                    _model.returnSelectedMembers =
                                                        [];
                                                  });
                                                  await _model
                                                      .refreshQuery(context);
                                                  setState(() {});
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  content: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final memberUserRelationData =
                                                        _model
                                                            .queryResultMembers
                                                            .toList();
                                                    if (memberUserRelationData
                                                        .isEmpty) {
                                                      return CompEmptyPageWidget();
                                                    }
                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
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
                                                          memberUserRelationData
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 4.0),
                                                      itemBuilder: (context,
                                                          memberUserRelationDataIndex) {
                                                        final memberUserRelationDataItem =
                                                            memberUserRelationData[
                                                                memberUserRelationDataIndex];
                                                        return Container(
                                                          height: 100.0,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              wrapWithModel(
                                                                model: _model
                                                                    .compUserListDynamicChildrenMemberModels2
                                                                    .getModel(
                                                                  memberUserRelationDataItem
                                                                      .userDocRef!
                                                                      .id,
                                                                  memberUserRelationDataIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    CompUserListRelationDataWidget(
                                                                  key: Key(
                                                                    'Key1ub_${memberUserRelationDataItem.userDocRef!.id}',
                                                                  ),
                                                                  userRelationData:
                                                                      memberUserRelationDataItem,
                                                                  userDocReference:
                                                                      memberUserRelationDataItem
                                                                          .userDocRef,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(25),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                CheckboxListTile(
                                                                              value: _model.checkboxListTileMemberValueMap2[memberUserRelationDataItem] ??= FFAppState().listSearchSelectAllMembers || functions.checkIfUserIDisInUserRelationDataStructList(_model.returnSelectedMembers.toList(), memberUserRelationDataItem.userID),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.checkboxListTileMemberValueMap2[memberUserRelationDataItem] = newValue!);
                                                                                if (newValue!) {
                                                                                  _model.updatePage(() {
                                                                                    _model.addToReturnSelectedMembers(memberUserRelationDataItem);
                                                                                  });
                                                                                } else {
                                                                                  if (_model.switchSelectAllMembersValue2!) {
                                                                                    setState(() {
                                                                                      _model.switchSelectAllMembersValue1 = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().listSearchSelectAllMembers = false;
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.returnSelectedMembers = _model.queryResultMembers.toList().cast<UserRelationDataStruct>();
                                                                                    });
                                                                                  }
                                                                                  setState(() {
                                                                                    _model.removeFromReturnSelectedMembers(memberUserRelationDataItem);
                                                                                  });
                                                                                }
                                                                              },
                                                                              title: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'spx18rsv' /*   */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: 'Hammersmith One',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                              ),
                                                                              subtitle: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'l3y60xjb' /*   */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).tertiary,
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                              dense: false,
                                                                              controlAffinity: ListTileControlAffinity.trailing,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.returnSelectedMembers =
                                  FFAppState().listSearchSelectAllMembers
                                      ? _model.queryResultMembers
                                      : _model.returnSelectedMembers
                                          .toList()
                                          .cast<UserRelationDataStruct>();
                              _model.returnSelectedFollowers =
                                  FFAppState().listSearchSelectAllFollowers
                                      ? _model.queryResultFollowers
                                      : _model.returnSelectedFollowers
                                          .toList()
                                          .cast<UserRelationDataStruct>();
                              FFAppState().listUserRelationDataTempStorage =
                                  _model.returnSelectedMembers
                                      .toList()
                                      .cast<UserRelationDataStruct>();
                              FFAppState().listUserRelationDataTempStorage2 =
                                  _model.returnSelectedFollowers
                                      .toList()
                                      .cast<UserRelationDataStruct>();
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'ji8l5nvq' /* Bestätigen */,
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                              hoverColor: FlutterFlowTheme.of(context).accent2,
                              hoverElevation: 2.0,
                            ),
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
    );
  }
}
