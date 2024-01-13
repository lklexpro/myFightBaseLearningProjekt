import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_sent_event_response_model.dart';
export 'comp_sent_event_response_model.dart';

class CompSentEventResponseWidget extends StatefulWidget {
  const CompSentEventResponseWidget({
    Key? key,
    required this.eventId,
    bool? eventIsPrivate,
  })  : this.eventIsPrivate = eventIsPrivate ?? true,
        super(key: key);

  final String? eventId;
  final bool eventIsPrivate;

  @override
  _CompSentEventResponseWidgetState createState() =>
      _CompSentEventResponseWidgetState();
}

class _CompSentEventResponseWidgetState
    extends State<CompSentEventResponseWidget> {
  late CompSentEventResponseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompSentEventResponseModel());

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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3B1D2429),
                        offset: Offset(0.0, -3.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            if (widget.eventIsPrivate) {
                              _model.acceptEventInvite =
                                  await AcceptEventInviteCall.call(
                                eventId: widget.eventId,
                                authenticatedUserId: currentUserUid,
                              );
                              if ((_model.acceptEventInvite?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Zusage wurde gesendet!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid. Etwas ist schiefgelaufen.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              _model.publicEventEnroll =
                                  await PublicEventEnrollCall.call(
                                eventId: widget.eventId,
                                authenticatedUserId: currentUserReference?.id,
                              );
                              if ((_model.publicEventEnroll?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Teilnahme wurde gesendet!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid. Etwas ist schiefgelaufen.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            }

                            setState(() {});
                          },
                          text:
                              widget.eventIsPrivate ? 'Zusagen' : 'Teilnehmen',
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
                        FFButtonWidget(
                          onPressed: () async {
                            if (widget.eventIsPrivate) {
                              _model.declineEventInvite =
                                  await DeclineEventInviteCall.call(
                                eventId: widget.eventId,
                                authenticatedUserId: currentUserUid,
                              );
                              if ((_model.declineEventInvite?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Absage wurde gesendet!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid. Etwas ist schiefgelaufen.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              _model.publicEventDisenroll =
                                  await PublicEventDisenrollCall.call(
                                eventId: widget.eventId,
                                authenticatedUserId: currentUserReference?.id,
                              );
                              if ((_model.publicEventDisenroll?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Absage wurde gesendet!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid. Etwas ist schiefgelaufen.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            }

                            setState(() {});
                          },
                          text: widget.eventIsPrivate
                              ? 'Absagen'
                              : 'Nicht Teilnehmen / Zurückziehen',
                          icon: Icon(
                            Icons.close,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
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
                            hoverColor: FlutterFlowTheme.of(context).primary,
                            hoverElevation: 2.0,
                          ),
                        ),
                        if (widget.eventIsPrivate)
                          FFButtonWidget(
                            onPressed: () async {
                              _model.indecisiveEventInvite =
                                  await PostponeEventInviteCall.call(
                                eventId: widget.eventId,
                                authenticatedUserId: currentUserUid,
                              );
                              if ((_model.indecisiveEventInvite?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Zusage wurde gesendet!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid. Etwas ist schiefgelaufen.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                Navigator.pop(context);
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '88ikv97m' /* Unsicher */,
                            ),
                            icon: Icon(
                              Icons.question_mark_outlined,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                              hoverColor: FlutterFlowTheme.of(context).tertiary,
                              hoverElevation: 2.0,
                            ),
                          ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'ik8a2vp8' /* Abbrechen */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                            hoverColor: FlutterFlowTheme.of(context).alternate,
                            hoverElevation: 2.0,
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
