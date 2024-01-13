import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/comp_select_user_list/comp_select_user_list_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_create_broadcast_model.dart';
export 'comp_create_broadcast_model.dart';

class CompCreateBroadcastWidget extends StatefulWidget {
  const CompCreateBroadcastWidget({Key? key}) : super(key: key);

  @override
  _CompCreateBroadcastWidgetState createState() =>
      _CompCreateBroadcastWidgetState();
}

class _CompCreateBroadcastWidgetState extends State<CompCreateBroadcastWidget>
    with TickerProviderStateMixin {
  late CompCreateBroadcastModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompCreateBroadcastModel());

    _model.inputFieldHeadlineController ??= TextEditingController();
    _model.inputFieldHeadlineFocusNode ??= FocusNode();

    _model.inputFieldMessageController ??= TextEditingController();
    _model.inputFieldMessageFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        child: Container(
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '1uk2x8kc' /* Broadcast versenden */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 45.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Möchtest du wirklich abbrechen?'),
                                                    content: Text(
                                                        'Alle deine Eingaben gehen verloren.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text(
                                                            'Weiter bearbeiten'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text(
                                                            'Ja, abbrechen'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: TextFormField(
                                  controller:
                                      _model.inputFieldHeadlineController,
                                  focusNode: _model.inputFieldHeadlineFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'wtauou1s' /* Betreff */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    alignLabelWithHint: false,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'z5s3z6g9' /* Betreff */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  validator: _model
                                      .inputFieldHeadlineControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _model.inputFieldMessageController,
                              focusNode: _model.inputFieldMessageFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'deqlugce' /* Beschreibung */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                alignLabelWithHint: false,
                                hintText: FFLocalizations.of(context).getText(
                                  '1knht36v' /* Deine Nachricht... */,
                                ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              maxLines: null,
                              minLines: 5,
                              keyboardType: TextInputType.multiline,
                              validator: _model
                                  .inputFieldMessageControllerValidator
                                  .asValidator(context),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2kckd96s' /* Mitglieder auswählen:  */,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 4.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CompSelectUserListWidget(
                                                showFollowerSelection: false,
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: valueOrDefault<String>(
                                        '(${valueOrDefault<String>(
                                          FFAppState()
                                              .listUserRelationDataTempStorage
                                              .length
                                              .toString(),
                                          '0',
                                        )})',
                                        '(?)',
                                      ),
                                      icon: Icon(
                                        Icons.person_add_alt_1,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var broadcastsRecordReference =
                                            BroadcastsRecord.collection.doc();
                                        await broadcastsRecordReference.set({
                                          ...createBroadcastsRecordData(
                                            creator: currentUserReference,
                                            creatorDisplayName:
                                                valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Unbekannter Absender',
                                            ),
                                            creatorAvatar: currentUserPhoto,
                                            broadcastHeadline: _model
                                                .inputFieldHeadlineController
                                                .text,
                                            broadcastMessage: _model
                                                .inputFieldMessageController
                                                .text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'createdAt':
                                                  FieldValue.serverTimestamp(),
                                              'user_data':
                                                  getUserRelationDataListFirestoreData(
                                                FFAppState()
                                                    .listUserRelationDataTempStorage,
                                              ),
                                            },
                                          ),
                                        });
                                        _model.createdBroadcastDoc =
                                            BroadcastsRecord
                                                .getDocumentFromData({
                                          ...createBroadcastsRecordData(
                                            creator: currentUserReference,
                                            creatorDisplayName:
                                                valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Unbekannter Absender',
                                            ),
                                            creatorAvatar: currentUserPhoto,
                                            broadcastHeadline: _model
                                                .inputFieldHeadlineController
                                                .text,
                                            broadcastMessage: _model
                                                .inputFieldMessageController
                                                .text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'createdAt': DateTime.now(),
                                              'user_data':
                                                  getUserRelationDataListFirestoreData(
                                                FFAppState()
                                                    .listUserRelationDataTempStorage,
                                              ),
                                            },
                                          ),
                                        }, broadcastsRecordReference);

                                        await _model
                                            .createdBroadcastDoc!.reference
                                            .update(createBroadcastsRecordData(
                                          uid: _model.createdBroadcastDoc
                                              ?.reference.id,
                                        ));
                                        while (_model.loopCounter <
                                            valueOrDefault<int>(
                                              FFAppState()
                                                  .listUserRelationDataTempStorage
                                                  .length,
                                              0,
                                            )) {
                                          _model.loopCounter =
                                              _model.loopCounter + 1;
                                          _model.addToUserRelationDocRefsList(
                                              FFAppState()
                                                  .listUserRelationDataTempStorage[
                                                      _model.loopCounter]
                                                  .userDocRef!);
                                        }
                                        triggerPushNotification(
                                          notificationTitle: _model
                                              .inputFieldHeadlineController
                                              .text,
                                          notificationText: _model
                                              .inputFieldMessageController.text,
                                          notificationSound: 'default',
                                          userRefs: _model
                                              .userRelationDocRefsList
                                              .toList(),
                                          initialPageName:
                                              'PageBroadcastDetailPage',
                                          parameterData: {
                                            'documentBroadcast':
                                                _model.createdBroadcastDoc,
                                          },
                                        );
                                        Navigator.pop(context);
                                        await action_blocks
                                            .clearTempUserSelections(context);

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'kioczvht' /* Bestätigen */,
                                      ),
                                      icon: Icon(
                                        Icons.send,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .accent2,
                                        hoverElevation: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
