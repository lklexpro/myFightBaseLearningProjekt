import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/events/comp_create_event/comp_create_event_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_event_organization_list_model.dart';
export 'page_event_organization_list_model.dart';

class PageEventOrganizationListWidget extends StatefulWidget {
  const PageEventOrganizationListWidget({Key? key}) : super(key: key);

  @override
  _PageEventOrganizationListWidgetState createState() =>
      _PageEventOrganizationListWidgetState();
}

class _PageEventOrganizationListWidgetState
    extends State<PageEventOrganizationListWidget>
    with TickerProviderStateMixin {
  late PageEventOrganizationListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageEventOrganizationListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CompCreateEventWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 28.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).alternate,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle: FlutterFlowTheme.of(context).titleSmall,
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'x1xi3gsb' /* Anstehend */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'ttjrxzjg' /* Alle */,
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
                            builder: (context) => Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(
                                    queryBuilder: (eventsRecord) => eventsRecord
                                        .where(
                                          'creator',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'event_date',
                                          isGreaterThan: getCurrentTimestamp,
                                        )
                                        .orderBy('event_date',
                                            descending: true),
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
                                    List<EventsRecord>
                                        listViewEventsRecordList =
                                        snapshot.data!;
                                    if (listViewEventsRecordList.isEmpty) {
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
                                      itemCount:
                                          listViewEventsRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewEventsRecord =
                                            listViewEventsRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'PageEventDetailPage',
                                              queryParameters: {
                                                'documentEvent': serializeParam(
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
                                            model: _model.compEventModels1
                                                .getModel(
                                              listViewEventsRecord.uid,
                                              listViewIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CompEventWidget(
                                              key: Key(
                                                'Keyj9r_${listViewEventsRecord.uid}',
                                              ),
                                              parEventDoc: listViewEventsRecord,
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
                              child: StreamBuilder<List<EventsRecord>>(
                                stream: queryEventsRecord(
                                  queryBuilder: (eventsRecord) => eventsRecord
                                      .where(
                                        'creator',
                                        isEqualTo: currentUserReference,
                                      )
                                      .orderBy('event_timeCreated',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return CompEmptyPageWidget();
                                  }
                                  List<EventsRecord> listViewEventsRecordList =
                                      snapshot.data!;
                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      8.0,
                                      0,
                                      8.0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewEventsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 8.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewEventsRecord =
                                          listViewEventsRecordList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'PageEventDetailPage',
                                            queryParameters: {
                                              'documentEvent': serializeParam(
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
                                          model:
                                              _model.compEventModels2.getModel(
                                            listViewEventsRecord.reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          child: CompEventWidget(
                                            key: Key(
                                              'Keypix_${listViewEventsRecord.reference.id}',
                                            ),
                                            parEventDoc: listViewEventsRecord,
                                          ),
                                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
