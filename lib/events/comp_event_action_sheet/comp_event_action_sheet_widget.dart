import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/events/comp_event_response_overview/comp_event_response_overview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/comp_select_user_list/comp_select_user_list_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_event_action_sheet_model.dart';
export 'comp_event_action_sheet_model.dart';

class CompEventActionSheetWidget extends StatefulWidget {
  const CompEventActionSheetWidget({
    Key? key,
    this.eventDocument,
  }) : super(key: key);

  final EventsRecord? eventDocument;

  @override
  _CompEventActionSheetWidgetState createState() =>
      _CompEventActionSheetWidgetState();
}

class _CompEventActionSheetWidgetState
    extends State<CompEventActionSheetWidget> {
  late CompEventActionSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompEventActionSheetModel());

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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if ((valueOrDefault<int>(
                    FFAppState().listUserRelationDataTempStorage.length,
                    0,
                  ) >
                  0) ||
              (FFAppState().listUserRelationDataTempStorage2.length > 0)) {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Änderung verwerfen?'),
                      content: Text(
                          'Du hast Nutzer ausgewählt. Möchtest du diese auswahl wirklich verwerfen?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Confirm'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              Navigator.pop(context);
              await action_blocks.clearTempUserSelections(context);
            }
          } else {
            Navigator.pop(context);
            await action_blocks.clearTempUserSelections(context);
          }
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CompEventResponseOverviewWidget(
                                    eventDoc: widget.eventDocument!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: FFLocalizations.of(context).getText(
                            'idxicswk' /* Antworten ansehen */,
                          ),
                          icon: Icon(
                            Icons.reply_all_sharp,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
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
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CompSelectUserListWidget(
                                    showFollowerSelection: true,
                                    listUserIDsToExcludeFromList: functions
                                        .convertRelationDataStructsToListOfIDs(
                                            widget.eventDocument!
                                                .userInvitationData
                                                .toList()),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: FFLocalizations.of(context).getText(
                            'vwbpjxo9' /* Personen Einladen */,
                          ),
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
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
                            context.pushNamed(
                              'PageEventEdit',
                              queryParameters: {
                                'documentEvent': serializeParam(
                                  widget.eventDocument,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'documentEvent': widget.eventDocument,
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '740m7npl' /* Veranstaltung bearbeiten */,
                          ),
                          icon: Icon(
                            Icons.edit,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
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
                        Flexible(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Bist du sicher?'),
                                            content: Text(
                                                'Möchtest du dieses Event wirklich löschen?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Abbrechen'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Bestätigen'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              await widget.eventDocument!.reference.delete();
                            },
                            text: FFLocalizations.of(context).getText(
                              'm8f4nu3x' /* Veranstaltung absagen & lösche... */,
                            ),
                            icon: Icon(
                              Icons.delete_forever,
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
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if ((valueOrDefault<int>(
                                      FFAppState()
                                          .listUserRelationDataTempStorage
                                          .length,
                                      0,
                                    ) >
                                    0) ||
                                (FFAppState()
                                        .listUserRelationDataTempStorage2
                                        .length >
                                    0)) {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Änderung verwerfen?'),
                                            content: Text(
                                                'Du hast Nutzer ausgewählt. Möchtest du diese auswahl wirklich verwerfen?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                Navigator.pop(context);
                                await action_blocks
                                    .clearTempUserSelections(context);
                              }
                            } else {
                              Navigator.pop(context);
                              await action_blocks
                                  .clearTempUserSelections(context);
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'sp2vv6ne' /* Abbrechen */,
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
                        if ((valueOrDefault<int>(
                                  FFAppState()
                                      .listUserRelationDataTempStorage
                                      .length,
                                  0,
                                ) >
                                0) ||
                            (FFAppState()
                                    .listUserRelationDataTempStorage2
                                    .length >
                                0))
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.inviteUsersToEvent =
                                        await InviteToEventCall.call(
                                      eventId: widget.eventDocument?.uid,
                                      userListList: functions
                                          .convertUserDataStructsToListOfIDs(
                                              FFAppState()
                                                  .listUserRelationDataTempStorage
                                                  .toList(),
                                              FFAppState()
                                                  .listUserRelationDataTempStorage2
                                                  .toList()),
                                    );
                                    if ((_model.inviteUsersToEvent?.succeeded ??
                                        true)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Alles klar!'),
                                            content: Text(
                                                'Einladungen wurden verschickt!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      Navigator.pop(context);
                                      triggerPushNotification(
                                        notificationTitle:
                                            'Neue Einladung erhalten!',
                                        notificationText:
                                            'Du wurdest von ${currentUserDisplayName} zu einem Event eingeladen. Sieh es dir an!',
                                        notificationSound: 'default',
                                        userRefs: functions
                                            .aggregateUserDataStructLists(
                                                FFAppState()
                                                    .listUserRelationDataTempStorage
                                                    .toList(),
                                                FFAppState()
                                                    .listUserRelationDataTempStorage2
                                                    .toList())!
                                            .map((e) => e.userDocRef)
                                            .withoutNulls
                                            .toList(),
                                        initialPageName: 'PageEventDetailPage',
                                        parameterData: {
                                          'documentEvent': widget.eventDocument,
                                        },
                                      );
                                      await action_blocks
                                          .clearTempUserSelections(context);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Sorry'),
                                            content: Text(
                                                'Tut uns leid, etwas ist schiefgelaufen.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      Navigator.pop(context);
                                      await action_blocks
                                          .clearTempUserSelections(context);
                                    }

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'xs29p4cl' /* Einladung senden */,
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
                                    hoverColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    hoverElevation: 2.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 120.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'gpba3jy3' /* Mitglieder:  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    FFAppState()
                                                        .listUserRelationDataTempStorage
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0xlg6ad4' /* Follower:  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    FFAppState()
                                                        .listUserRelationDataTempStorage2
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
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
