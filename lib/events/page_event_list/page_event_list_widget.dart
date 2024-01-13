import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/empty_list_widgets/comp_no_events_found/comp_no_events_found_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'page_event_list_model.dart';
export 'page_event_list_model.dart';

class PageEventListWidget extends StatefulWidget {
  const PageEventListWidget({Key? key}) : super(key: key);

  @override
  _PageEventListWidgetState createState() => _PageEventListWidgetState();
}

class _PageEventListWidgetState extends State<PageEventListWidget>
    with TickerProviderStateMixin {
  late PageEventListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageEventListModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (valueOrDefault<bool>(
                valueOrDefault<bool>(
                    currentUserDocument?.isOrganization, false),
                false,
              ))
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('PageEventOrganizationList');
                      },
                      text: FFLocalizations.of(context).getText(
                        '3v0n6jke' /* Eigene Veranstaltungen verwalt... */,
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                        hoverColor: FlutterFlowTheme.of(context).tertiary,
                        hoverElevation: 2.0,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: StreamBuilder<List<EventsRecord>>(
                  stream: queryEventsRecord(
                    queryBuilder: (eventsRecord) => eventsRecord
                        .where(
                          'userList',
                          arrayContains: currentUserReference,
                        )
                        .orderBy('event_date'),
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
                    List<EventsRecord> tabBarEventsRecordList = snapshot.data!;
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).alternate,
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
                                  '3g6ayvin' /* Anstehend */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '4nkesi6u' /* Eingeladen */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '1asl6y88' /* Öffentliche */,
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
                                builder: (context) => Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final acceptedEventList =
                                            tabBarEventsRecordList
                                                .where((e) =>
                                                    valueOrDefault<bool>(
                                                      valueOrDefault<bool>(
                                                            e.eventDate! >
                                                                getCurrentTimestamp,
                                                            false,
                                                          ) &&
                                                          valueOrDefault<bool>(
                                                            functions.returnUserResponseFromInvitationDataStructList(
                                                                    e.userInvitationData
                                                                        .toList(),
                                                                    currentUserUid) ==
                                                                'accepted',
                                                            false,
                                                          ),
                                                      false,
                                                    ))
                                                .toList();
                                        if (acceptedEventList.isEmpty) {
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
                                          scrollDirection: Axis.vertical,
                                          itemCount: acceptedEventList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder: (context,
                                              acceptedEventListIndex) {
                                            final acceptedEventListItem =
                                                acceptedEventList[
                                                    acceptedEventListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'PageEventDetailPage',
                                                  queryParameters: {
                                                    'documentEvent':
                                                        serializeParam(
                                                      acceptedEventListItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'documentEvent':
                                                        acceptedEventListItem,
                                                  },
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.compEventModels1
                                                    .getModel(
                                                  acceptedEventListItem.uid,
                                                  acceptedEventListIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CompEventWidget(
                                                  key: Key(
                                                    'Keyqf4_${acceptedEventListItem.uid}',
                                                  ),
                                                  parEventDoc:
                                                      acceptedEventListItem,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final invitedEventList =
                                            tabBarEventsRecordList
                                                .where((e) =>
                                                    valueOrDefault<bool>(
                                                      valueOrDefault<bool>(
                                                            e.eventDate! >
                                                                getCurrentTimestamp,
                                                            false,
                                                          ) &&
                                                          valueOrDefault<bool>(
                                                            functions.returnUserResponseFromInvitationDataStructList(
                                                                    e.userInvitationData
                                                                        .toList(),
                                                                    currentUserUid) ==
                                                                'pending',
                                                            false,
                                                          ),
                                                      false,
                                                    ))
                                                .toList();
                                        if (invitedEventList.isEmpty) {
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
                                          scrollDirection: Axis.vertical,
                                          itemCount: invitedEventList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, invitedEventListIndex) {
                                            final invitedEventListItem =
                                                invitedEventList[
                                                    invitedEventListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'PageEventDetailPage',
                                                  queryParameters: {
                                                    'documentEvent':
                                                        serializeParam(
                                                      invitedEventListItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'documentEvent':
                                                        invitedEventListItem,
                                                  },
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.compEventModels2
                                                    .getModel(
                                                  invitedEventListItem.uid,
                                                  invitedEventListIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CompEventWidget(
                                                  key: Key(
                                                    'Keysqk_${invitedEventListItem.uid}',
                                                  ),
                                                  parEventDoc:
                                                      invitedEventListItem,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        EventsRecord>.separated(
                                      pagingController:
                                          _model.setListViewController3(
                                        EventsRecord.collection
                                            .where(
                                              'event_isPrivate',
                                              isEqualTo: false,
                                            )
                                            .where(
                                              'event_locationPostalCode',
                                              isEqualTo: valueOrDefault(
                                                  currentUserDocument
                                                      ?.contactAdressPostalCode,
                                                  ''),
                                            )
                                            .where(
                                              'event_date',
                                              isGreaterThanOrEqualTo:
                                                  getCurrentTimestamp,
                                            ),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        8.0,
                                      ),
                                      primary: false,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              EventsRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => CompEmptyPageWidget(),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            CompEmptyPageWidget(),
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            CompNoEventsFoundWidget(),
                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewEventsRecord = _model
                                              .listViewPagingController3!
                                              .itemList![listViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'PageEventDetailPage',
                                                queryParameters: {
                                                  'documentEvent':
                                                      serializeParam(
                                                    listViewEventsRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'documentEvent':
                                                      listViewEventsRecord,
                                                },
                                              );
                                            },
                                            child: wrapWithModel(
                                              model: _model.compEventModels3
                                                  .getModel(
                                                listViewEventsRecord.uid,
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CompEventWidget(
                                                key: Key(
                                                  'Key237_${listViewEventsRecord.uid}',
                                                ),
                                                parEventDoc:
                                                    listViewEventsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
