import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'chat_new_model.dart';
export 'chat_new_model.dart';

class ChatNewWidget extends StatefulWidget {
  const ChatNewWidget({
    Key? key,
    this.otherChatUser,
    this.chatReference,
  }) : super(key: key);

  final AllUsersRecord? otherChatUser;
  final DocumentReference? chatReference;

  @override
  _ChatNewWidgetState createState() => _ChatNewWidgetState();
}

class _ChatNewWidgetState extends State<ChatNewWidget> {
  late ChatNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final firestoreBatch = FirebaseFirestore.instance.batch();
      try {
        if (widget.chatReference != null) {
          _model.chatDocumentByRef =
              await ChatsRecord.getDocumentOnce(widget.chatReference!);
          setState(() {
            _model.chatDocumentQueryResult = _model.chatDocumentByRef;
          });
        } else {
          if (widget.otherChatUser != null) {
            _model.queryExistingChats1 = await queryChatsRecordOnce(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where(
                    'user_a',
                    isEqualTo: currentUserReference,
                  )
                  .where(
                    'user_b',
                    isEqualTo: widget.otherChatUser?.reference,
                  )
                  .where(
                    'isGroupChat',
                    isEqualTo: false,
                  ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (_model.queryExistingChats1 != null) {
              setState(() {
                _model.chatDocumentQueryResult = _model.queryExistingChats1;
              });
            } else {
              _model.queryExistingChats2 = await queryChatsRecordOnce(
                queryBuilder: (chatsRecord) => chatsRecord
                    .where(
                      'user_b',
                      isEqualTo: currentUserReference,
                    )
                    .where(
                      'user_a',
                      isEqualTo: widget.otherChatUser?.reference,
                    )
                    .where(
                      'isGroupChat',
                      isEqualTo: false,
                    ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.queryExistingChats1 != null) {
                setState(() {
                  _model.chatDocumentQueryResult = _model.queryExistingChats2;
                });
              } else {
                var chatsRecordReference2 = ChatsRecord.collection.doc();
                firestoreBatch.set(chatsRecordReference2, {
                  ...createChatsRecordData(
                    userA: currentUserReference,
                    userB: widget.otherChatUser?.reference,
                    isGroupChat: false,
                  ),
                  ...mapToFirestore(
                    {
                      'users': [currentUserReference],
                    },
                  ),
                });
                _model.newCreatedChatDoc = ChatsRecord.getDocumentFromData({
                  ...createChatsRecordData(
                    userA: currentUserReference,
                    userB: widget.otherChatUser?.reference,
                    isGroupChat: false,
                  ),
                  ...mapToFirestore(
                    {
                      'users': [currentUserReference],
                    },
                  ),
                }, chatsRecordReference2);

                firestoreBatch.update(_model.newCreatedChatDoc!.reference, {
                  ...mapToFirestore(
                    {
                      'users': FieldValue.arrayUnion(
                          [widget.otherChatUser?.reference]),
                    },
                  ),
                });
                setState(() {
                  _model.chatDocumentQueryResult = _model.newCreatedChatDoc;
                });
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Tut uns leid, Chat konnte nicht gestartet werden.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }

        setState(() {});
      } finally {
        await firestoreBatch.commit();
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 58.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 28.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              _model.chatDocumentQueryResult!.isGroupChat
                  ? valueOrDefault<String>(
                      _model.chatDocumentQueryResult?.groupChatName,
                      'Gruppenchat',
                    )
                  : widget.otherChatUser?.displayName,
              'Chat mit Nutzer',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).accent4,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<DirectMessagesRecord>>(
                    stream: queryDirectMessagesRecord(
                      parent: _model.chatDocumentQueryResult?.reference,
                      queryBuilder: (directMessagesRecord) =>
                          directMessagesRecord.orderBy('timestamp',
                              descending: true),
                      limit: 50,
                    )..listen((snapshot) async {
                        List<DirectMessagesRecord>
                            listViewDirectMessagesRecordList = snapshot;
                        if (_model.listViewPreviousSnapshot != null &&
                            !const ListEquality(
                                    DirectMessagesRecordDocumentEquality())
                                .equals(listViewDirectMessagesRecordList,
                                    _model.listViewPreviousSnapshot)) {
                          HapticFeedback.mediumImpact();

                          setState(() {});
                        }
                        _model.listViewPreviousSnapshot = snapshot;
                      }),
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
                      List<DirectMessagesRecord>
                          listViewDirectMessagesRecordList = snapshot.data!;
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDirectMessagesRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewDirectMessagesRecord =
                              listViewDirectMessagesRecordList[listViewIndex];
                          return Align(
                            alignment: AlignmentDirectional(
                                listViewDirectMessagesRecord.user ==
                                        currentUserReference
                                    ? 1.0
                                    : -1.0,
                                0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          listViewDirectMessagesRecord.user ==
                                                  currentUserReference
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            listViewDirectMessagesRecord.user ==
                                                    currentUserReference
                                                ? 16.0
                                                : 0.0,
                                            0.0,
                                          )),
                                          bottomRight: Radius.circular(
                                              valueOrDefault<double>(
                                            listViewDirectMessagesRecord.user ==
                                                    currentUserReference
                                                ? 0.0
                                                : 16.0,
                                            0.0,
                                          )),
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewDirectMessagesRecord
                                                        .userDisplayName,
                                                    'Unbekannter Nutzer',
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewDirectMessagesRecord
                                                                          .user ==
                                                                      currentUserReference
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                    ' dd.MM - HH:mm',
                                                    listViewDirectMessagesRecord
                                                        .timestamp!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewDirectMessagesRecord
                                                                          .user ==
                                                                      currentUserReference
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontWeight:
                                                                FontWeight.w200,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (valueOrDefault<bool>(
                                            listViewDirectMessagesRecord
                                                        .image !=
                                                    null &&
                                                listViewDirectMessagesRecord
                                                        .image !=
                                                    '',
                                            false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          listViewDirectMessagesRecord
                                                              .image,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag:
                                                            listViewDirectMessagesRecord
                                                                .image,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      listViewDirectMessagesRecord
                                                          .image,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      listViewDirectMessagesRecord
                                                          .image,
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 8.0, 18.0, 8.0),
                                            child: Text(
                                              listViewDirectMessagesRecord.text,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      listViewDirectMessagesRecord
                                                                  .user ==
                                                              currentUserReference
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                        _model.uploadedFileUrl != null &&
                            _model.uploadedFileUrl != '',
                        false,
                      ))
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        _model.uploadedFileUrl,
                                        width: 150.0,
                                        height: 150.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.2, -1.2),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 8.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 45.0,
                                        fillColor: Color(0x7FE0E3E7),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 32.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.isDataUploading = false;
                                            _model.uploadedLocalFile =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl = '';
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 24.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.add_a_photo,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onFieldSubmitted: (_) async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    var directMessagesRecordReference =
                                        DirectMessagesRecord.createDoc(_model
                                            .chatDocumentQueryResult!
                                            .reference);
                                    firestoreBatch.set(
                                        directMessagesRecordReference,
                                        createDirectMessagesRecordData(
                                          user: currentUserReference,
                                          text: (_model.textController.text ==
                                                          null ||
                                                      _model.textController
                                                              .text ==
                                                          '') &&
                                                  (_model.uploadedFileUrl !=
                                                          null &&
                                                      _model.uploadedFileUrl !=
                                                          '')
                                              ? 'Bild gesendet'
                                              : _model.textController.text,
                                          image: _model.uploadedFileUrl,
                                          timestamp: getCurrentTimestamp,
                                          userDisplayName:
                                              currentUserDisplayName,
                                          chatRef: _model
                                              .chatDocumentQueryResult
                                              ?.reference,
                                        ));
                                    _model.creatChatMessage =
                                        DirectMessagesRecord
                                            .getDocumentFromData(
                                                createDirectMessagesRecordData(
                                                  user: currentUserReference,
                                                  text: (_model.textController
                                                                      .text ==
                                                                  null ||
                                                              _model.textController
                                                                      .text ==
                                                                  '') &&
                                                          (_model.uploadedFileUrl !=
                                                                  null &&
                                                              _model.uploadedFileUrl !=
                                                                  '')
                                                      ? 'Bild gesendet'
                                                      : _model
                                                          .textController.text,
                                                  image: _model.uploadedFileUrl,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  userDisplayName:
                                                      currentUserDisplayName,
                                                  chatRef: _model
                                                      .chatDocumentQueryResult
                                                      ?.reference,
                                                ),
                                                directMessagesRecordReference);

                                    firestoreBatch
                                        .update(widget.chatReference!, {
                                      ...createChatsRecordData(
                                        lastMessage: _model.textController.text,
                                        lastMessageTime: getCurrentTimestamp,
                                        lastMessageSentBy: currentUserReference,
                                        lastMessageSentByDisplayName:
                                            currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'last_message_seen_by':
                                              FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                        },
                                      ),
                                    });
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    setState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFile = FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl = '';
                                    });

                                    setState(() {});
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  setState(() {});
                                },
                                textInputAction: TextInputAction.send,
                                obscureText: false,
                                decoration: InputDecoration(
                                  alignLabelWithHint: false,
                                  hintText: FFLocalizations.of(context).getText(
                                    'acbvp8a7' /* Nachricht  */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                                minLines: 1,
                                maxLength: 4000,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                keyboardType: TextInputType.multiline,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.send,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    var directMessagesRecordReference =
                                        DirectMessagesRecord.createDoc(_model
                                            .chatDocumentQueryResult!
                                            .reference);
                                    firestoreBatch.set(
                                        directMessagesRecordReference,
                                        createDirectMessagesRecordData(
                                          user: currentUserReference,
                                          text: (_model.textController.text ==
                                                          null ||
                                                      _model.textController
                                                              .text ==
                                                          '') &&
                                                  (_model.uploadedFileUrl !=
                                                          null &&
                                                      _model.uploadedFileUrl !=
                                                          '')
                                              ? 'Bild gesendet'
                                              : _model.textController.text,
                                          image: _model.uploadedFileUrl,
                                          timestamp: getCurrentTimestamp,
                                          userDisplayName:
                                              currentUserDisplayName,
                                          chatRef: _model
                                              .chatDocumentQueryResult
                                              ?.reference,
                                        ));
                                    _model.createdChatMessageByIcon =
                                        DirectMessagesRecord
                                            .getDocumentFromData(
                                                createDirectMessagesRecordData(
                                                  user: currentUserReference,
                                                  text: (_model.textController
                                                                      .text ==
                                                                  null ||
                                                              _model.textController
                                                                      .text ==
                                                                  '') &&
                                                          (_model.uploadedFileUrl !=
                                                                  null &&
                                                              _model.uploadedFileUrl !=
                                                                  '')
                                                      ? 'Bild gesendet'
                                                      : _model
                                                          .textController.text,
                                                  image: _model.uploadedFileUrl,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  userDisplayName:
                                                      currentUserDisplayName,
                                                  chatRef: _model
                                                      .chatDocumentQueryResult
                                                      ?.reference,
                                                ),
                                                directMessagesRecordReference);

                                    firestoreBatch
                                        .update(widget.chatReference!, {
                                      ...createChatsRecordData(
                                        lastMessage: _model.textController.text,
                                        lastMessageTime: getCurrentTimestamp,
                                        lastMessageSentBy: currentUserReference,
                                        lastMessageSentByDisplayName:
                                            currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'last_message_seen_by':
                                              FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                        },
                                      ),
                                    });
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    setState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFile = FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl = '';
                                    });

                                    setState(() {});
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
