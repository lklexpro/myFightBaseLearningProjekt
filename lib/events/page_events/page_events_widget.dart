import '/backend/backend.dart';
import '/common_widgets/comp_empty_list/comp_empty_list_widget.dart';
import '/events/comp_create_event/comp_create_event_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_events_model.dart';
export 'page_events_model.dart';

class PageEventsWidget extends StatefulWidget {
  const PageEventsWidget({Key? key}) : super(key: key);

  @override
  _PageEventsWidgetState createState() => _PageEventsWidgetState();
}

class _PageEventsWidgetState extends State<PageEventsWidget>
    with TickerProviderStateMixin {
  late PageEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'compEventOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageEventsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_model.unfocusNode),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CompCreateEventWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).alternate,
            size: 30.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: StreamBuilder<List<EventsRecord>>(
                  stream: queryEventsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return CompEmptyListWidget();
                    }
                    List<EventsRecord> listViewEventsRecordList =
                        snapshot.data!;
                    if (listViewEventsRecordList.isEmpty) {
                      return CompEmptyListWidget();
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewEventsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewEventsRecord =
                            listViewEventsRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'PageEventDetails',
                              queryParameters: {
                                'documentEvent': serializeParam(
                                  listViewEventsRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'documentEvent': listViewEventsRecord,
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.compEventModels.getModel(
                              listViewEventsRecord.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: CompEventWidget(
                              key: Key(
                                'Key0de_${listViewEventsRecord.reference.id}',
                              ),
                              parEventDoc: listViewEventsRecord,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['compEventOnPageLoadAnimation']!);
                      },
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
