import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_notification_card_model.dart';
export 'comp_notification_card_model.dart';

class CompNotificationCardWidget extends StatefulWidget {
  const CompNotificationCardWidget({
    Key? key,
    required this.notificationDocument,
  }) : super(key: key);

  final UserNotificationInboxRecord? notificationDocument;

  @override
  _CompNotificationCardWidgetState createState() =>
      _CompNotificationCardWidgetState();
}

class _CompNotificationCardWidgetState
    extends State<CompNotificationCardWidget> {
  late CompNotificationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompNotificationCardModel());

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
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: _model.mouseRegionHovered!
                    ? FlutterFlowTheme.of(context).secondary
                    : Color(0x00000000),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              'EEEE, dd.MM.yyyy HH:mm',
                              widget.notificationDocument?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '---',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: Stack(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            children: [
                              if (widget.notificationDocument?.requestState ==
                                  'read')
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.mark_as_unread,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.selectionClick();

                                    await widget.notificationDocument!.reference
                                        .update(
                                            createUserNotificationInboxRecordData(
                                      requestState: 'pending',
                                    ));
                                    _model.updatePage(() {});
                                  },
                                ),
                              if (widget.notificationDocument?.requestState !=
                                  'read')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  hoverIconColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.check_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.selectionClick();

                                    await widget.notificationDocument!.reference
                                        .update(
                                            createUserNotificationInboxRecordData(
                                      requestState: 'read',
                                    ));
                                    _model.updatePage(() {});
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.notificationDocument?.requestType ==
                      'organizationInvite')
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.selectionClick();
                          _model.queryResultUserRefDoc =
                              await queryAllUsersRecordOnce(
                            queryBuilder: (allUsersRecord) =>
                                allUsersRecord.where(
                              'uid',
                              isEqualTo: widget
                                  .notificationDocument?.requestReferenceId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          unawaited(
                            () async {
                              await widget.notificationDocument!.reference
                                  .update(createUserNotificationInboxRecordData(
                                requestState: 'read',
                              ));
                            }(),
                          );

                          context.pushNamed(
                            'PageUserProfile',
                            queryParameters: {
                              'userProfileDoc': serializeParam(
                                _model.queryResultUserRefDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'userProfileDoc': _model.queryResultUserRefDoc,
                            },
                          );

                          setState(() {});
                        },
                        child: Container(
                          height: 80.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.domain_add_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 16.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wyc30xtv' /* Du wurdest eingeladen einem Ve... */,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                        child: Image.network(
                                          widget.notificationDocument!
                                              .senderAvatar,
                                          width: 35.0,
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.senderDisplayName,
                                              'Absender',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.requestType,
                                              'Unbekannter Zustand',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
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
                  if (widget.notificationDocument?.requestType == 'eventInvite')
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.selectionClick();
                          _model.queryResultEventRefDoc =
                              await queryEventsRecordOnce(
                            queryBuilder: (eventsRecord) => eventsRecord.where(
                              'uid',
                              isEqualTo: widget
                                  .notificationDocument?.requestReferenceId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          unawaited(
                            () async {
                              await widget.notificationDocument!.reference
                                  .update(createUserNotificationInboxRecordData(
                                requestState: 'read',
                              ));
                            }(),
                          );
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'PageEventDetailPage',
                            queryParameters: {
                              'documentEvent': serializeParam(
                                _model.queryResultEventRefDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'documentEvent': _model.queryResultEventRefDoc,
                            },
                          );

                          setState(() {});
                        },
                        child: Container(
                          height: 80.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 16.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mw5p196s' /* Du wurdest zu einer Veranstalt... */,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                        child: Image.network(
                                          widget.notificationDocument!
                                              .requestImage,
                                          width: 35.0,
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.requestHeadline,
                                              'Event Name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.requestContent,
                                              'Beschreibung des Events',
                                            ).maybeHandleOverflow(
                                              maxChars: 45,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
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
                  if (widget.notificationDocument?.requestType == 'broadcast')
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.selectionClick();
                          _model.queryResultBroadcastRefDoc =
                              await queryBroadcastsRecordOnce(
                            queryBuilder: (broadcastsRecord) =>
                                broadcastsRecord.where(
                              'uid',
                              isEqualTo: widget
                                  .notificationDocument?.requestReferenceId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          unawaited(
                            () async {
                              await widget.notificationDocument!.reference
                                  .update(createUserNotificationInboxRecordData(
                                requestState: 'read',
                              ));
                            }(),
                          );
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'PageBroadcastDetailPage',
                            queryParameters: {
                              'documentBroadcast': serializeParam(
                                _model.queryResultBroadcastRefDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'documentBroadcast':
                                  _model.queryResultBroadcastRefDoc,
                            },
                          );

                          setState(() {});
                        },
                        child: Container(
                          height: 80.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.maps_ugc,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 16.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gairfzq6' /* Du hast einen Broadcast erhalt... */,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                        child: Image.network(
                                          widget.notificationDocument!
                                              .senderAvatar,
                                          width: 35.0,
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.senderDisplayName,
                                              'Absender',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.notificationDocument
                                                  ?.requestHeadline,
                                              'Unbekannter Broadcast',
                                            ).maybeHandleOverflow(
                                              maxChars: 45,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
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
                ],
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          setState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          setState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
