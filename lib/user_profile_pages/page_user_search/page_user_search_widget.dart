import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_no_result/comp_no_result_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_filter_facet_search/comp_filter_facet_search_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_user_document/comp_user_list_user_document_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_user_search_model.dart';
export 'page_user_search_model.dart';

class PageUserSearchWidget extends StatefulWidget {
  const PageUserSearchWidget({Key? key}) : super(key: key);

  @override
  _PageUserSearchWidgetState createState() => _PageUserSearchWidgetState();
}

class _PageUserSearchWidgetState extends State<PageUserSearchWidget>
    with TickerProviderStateMixin {
  late PageUserSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageUserSearchModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            true ? 0 : 2,
            0,
          ),
          2),
    )..addListener(() => setState(() {}));
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.filter_list,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CompFilterFacetSearchWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.searchFacetParams = value));

                              setState(() {});
                            },
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                              ),
                              child: wrapWithModel(
                                model: _model.searchBarModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: SearchBarWidget(
                                  userSearchAction: () async {
                                    if (_model.searchBarModel.textController
                                                .text !=
                                            null &&
                                        _model.searchBarModel.textController
                                                .text !=
                                            '') {
                                      safeSetState(() =>
                                          _model.algoliaSearchResults = null);
                                      await AllUsersRecord.search(
                                        term: _model.searchFacetParams !=
                                                    null &&
                                                _model.searchFacetParams != ''
                                            ? '${_model.searchFacetParams} ${_model.searchBarModel.textController.text}'
                                            : _model.searchBarModel
                                                .textController.text,
                                        maxResults: 25,
                                      )
                                          .then((r) =>
                                              _model.algoliaSearchResults = r)
                                          .onError((_, __) =>
                                              _model.algoliaSearchResults = [])
                                          .whenComplete(() => setState(() {}));

                                      setState(() {
                                        _model.showSearchResult = true;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                  if (_model.showSearchResult)
                    Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.sizeOf(context).height * 0.5,
                        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).alternate,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              unselectedLabelStyle: TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'hgkr4tbz' /* Alle */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '7gj0kf85' /* Personen */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'hgcpq8y4' /* Vereine */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'b52u355u' /* Suchergebnisse: */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.algoliaSearchResults ==
                                                  null) {
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
                                              final usersFound = _model
                                                      .algoliaSearchResults
                                                      ?.toList() ??
                                                  [];
                                              if (usersFound.isEmpty) {
                                                return CompNoResultWidget();
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: usersFound.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 4.0),
                                                itemBuilder:
                                                    (context, usersFoundIndex) {
                                                  final usersFoundItem =
                                                      usersFound[
                                                          usersFoundIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'PageUserProfile',
                                                        queryParameters: {
                                                          'userProfileDoc':
                                                              serializeParam(
                                                            usersFoundItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userProfileDoc':
                                                              usersFoundItem,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                          ),
                                                        },
                                                      );

                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .addToRecentlyVisitedUserProfiles(
                                                                usersFoundItem
                                                                    .reference);
                                                      });
                                                    },
                                                    child:
                                                        CompUserListUserDocumentWidget(
                                                      key: Key(
                                                          'Key8tf_${usersFoundIndex}_of_${usersFound.length}'),
                                                      documentUser:
                                                          usersFoundItem,
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
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              's1jwb05n' /* Suchergebnisse: */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.algoliaSearchResults
                                                      ?.where((e) =>
                                                          _model.tabBarCurrentIndex ==
                                                                  1
                                                              ? !e.isOrganization
                                                              : false)
                                                      .toList() ==
                                                  null) {
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
                                              final usersFound = _model
                                                      .algoliaSearchResults
                                                      ?.where((e) =>
                                                          _model.tabBarCurrentIndex ==
                                                                  1
                                                              ? !e.isOrganization
                                                              : false)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                              if (usersFound.isEmpty) {
                                                return CompNoResultWidget();
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: usersFound.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 4.0),
                                                itemBuilder:
                                                    (context, usersFoundIndex) {
                                                  final usersFoundItem =
                                                      usersFound[
                                                          usersFoundIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        FFAppState()
                                                            .addToRecentlyVisitedUserProfiles(
                                                                usersFoundItem
                                                                    .reference);
                                                      });

                                                      context.pushNamed(
                                                        'PageUserProfile',
                                                        queryParameters: {
                                                          'userProfileDoc':
                                                              serializeParam(
                                                            usersFoundItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userProfileDoc':
                                                              usersFoundItem,
                                                        },
                                                      );
                                                    },
                                                    child:
                                                        CompUserListUserDocumentWidget(
                                                      key: Key(
                                                          'Keyzml_${usersFoundIndex}_of_${usersFound.length}'),
                                                      documentUser:
                                                          usersFoundItem,
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
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '3ao9lrww' /* Suchergebnisse: */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.algoliaSearchResults
                                                      ?.where((e) =>
                                                          _model.tabBarCurrentIndex ==
                                                                  2
                                                              ? e.isOrganization
                                                              : false)
                                                      .toList() ==
                                                  null) {
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
                                              final usersFound = _model
                                                      .algoliaSearchResults
                                                      ?.where((e) =>
                                                          _model.tabBarCurrentIndex ==
                                                                  2
                                                              ? e.isOrganization
                                                              : false)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                              if (usersFound.isEmpty) {
                                                return CompNoResultWidget();
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: usersFound.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 4.0),
                                                itemBuilder:
                                                    (context, usersFoundIndex) {
                                                  final usersFoundItem =
                                                      usersFound[
                                                          usersFoundIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .addToRecentlyVisitedUserProfiles(
                                                                usersFoundItem
                                                                    .reference);
                                                      });

                                                      context.pushNamed(
                                                        'PageUserProfile',
                                                        queryParameters: {
                                                          'userProfileDoc':
                                                              serializeParam(
                                                            usersFoundItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userProfileDoc':
                                                              usersFoundItem,
                                                        },
                                                      );
                                                    },
                                                    child:
                                                        CompUserListUserDocumentWidget(
                                                      key: Key(
                                                          'Keyrhl_${usersFoundIndex}_of_${usersFound.length}'),
                                                      documentUser:
                                                          usersFoundItem,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (valueOrDefault<bool>(
                    valueOrDefault<bool>(
                          FFAppState().recentlyVisitedUserProfiles.length !=
                              null,
                          false,
                        ) &&
                        !_model.showSearchResult,
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'n19smbpw' /* Zuletzt angesehen: */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final userSuggestedProfiles = FFAppState()
                                          .recentlyVisitedUserProfiles
                                          .toList()
                                          .take(5)
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: userSuggestedProfiles.length,
                                        itemBuilder: (context,
                                            userSuggestedProfilesIndex) {
                                          final userSuggestedProfilesItem =
                                              userSuggestedProfiles[
                                                  userSuggestedProfilesIndex];
                                          return StreamBuilder<AllUsersRecord>(
                                            stream: _model
                                                .queryCacheRecentlyVisitedProfiles(
                                              uniqueQueryKey:
                                                  userSuggestedProfilesItem.id,
                                              requestFn: () =>
                                                  AllUsersRecord.getDocument(
                                                      userSuggestedProfilesItem),
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
                                              final compUserListUserDocumentAllUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'PageUserProfile',
                                                    queryParameters: {
                                                      'userProfileDoc':
                                                          serializeParam(
                                                        compUserListUserDocumentAllUsersRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'userProfileDoc':
                                                          compUserListUserDocumentAllUsersRecord,
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .compUserListUserDocumentModels4
                                                      .getModel(
                                                    userSuggestedProfilesItem
                                                        .id,
                                                    userSuggestedProfilesIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      CompUserListUserDocumentWidget(
                                                    key: Key(
                                                      'Keyhpb_${userSuggestedProfilesItem.id}',
                                                    ),
                                                    documentUser:
                                                        compUserListUserDocumentAllUsersRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onLongPress: () async {
                          context.pushNamed(
                            'PageAllUsers',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                        child: FFButtonWidget(
                          onPressed: () {
                            print('SHOWALLUSERSDEBUG pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            '9ycfjhl5' /*     */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
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
