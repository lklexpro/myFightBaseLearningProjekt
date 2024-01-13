import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chats/comp_create_new_chat/comp_create_new_chat_widget.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_chat_overview_model.dart';
export 'page_chat_overview_model.dart';

class PageChatOverviewWidget extends StatefulWidget {
  const PageChatOverviewWidget({Key? key}) : super(key: key);

  @override
  _PageChatOverviewWidgetState createState() => _PageChatOverviewWidgetState();
}

class _PageChatOverviewWidgetState extends State<PageChatOverviewWidget>
    with TickerProviderStateMixin {
  late PageChatOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => PageChatOverviewModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: CompCreateNewChatWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).alternate,
          size: 24.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where(
                    'users',
                    arrayContains: currentUserReference,
                  )
                  .where(
                    'last_message_sent_by',
                    isNotEqualTo: null,
                  ),
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
              List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
              if (listViewChatsRecordList.isEmpty) {
                return CompEmptyPageWidget();
              }
              return ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.0,
                          color: Color(0x32171717),
                          offset: Offset(0.0, 3.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Stack(
                      children: [
                        StreamBuilder<AllUsersRecord>(
                          stream: AllUsersRecord.getDocument(
                              listViewChatsRecord.userA!),
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
                            final userAQueryContainerAllUsersRecord =
                                snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(),
                              child: StreamBuilder<AllUsersRecord>(
                                stream: AllUsersRecord.getDocument(
                                    listViewChatsRecord.userB!),
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
                                  final userBQueryContainerAllUsersRecord =
                                      snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'ChatNew',
                                          queryParameters: {
                                            'chatReference': serializeParam(
                                              listViewChatsRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'otherChatUser': serializeParam(
                                              listViewChatsRecord.userA ==
                                                      currentUserReference
                                                  ? userBQueryContainerAllUsersRecord
                                                  : userAQueryContainerAllUsersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'otherChatUser': listViewChatsRecord
                                                        .userA ==
                                                    currentUserReference
                                                ? userBQueryContainerAllUsersRecord
                                                : userAQueryContainerAllUsersRecord,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          if (listViewChatsRecord
                                                                  .lastMessageSeenBy
                                                                  .contains(
                                                                      currentUserReference) ==
                                                              false)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 46.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            listViewChatsRecord
                                                                        .groupChatName ==
                                                                    null ||
                                                                listViewChatsRecord
                                                                        .groupChatName ==
                                                                    '',
                                                            false,
                                                          ))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Hero(
                                                                tag:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  () {
                                                                    if (listViewChatsRecord
                                                                            .userA ==
                                                                        currentUserReference) {
                                                                      return userBQueryContainerAllUsersRecord
                                                                          .photoUrl;
                                                                    } else if (listViewChatsRecord
                                                                            .userB ==
                                                                        currentUserReference) {
                                                                      return userAQueryContainerAllUsersRecord
                                                                          .photoUrl;
                                                                    } else {
                                                                      return 'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg';
                                                                    }
                                                                  }(),
                                                                  'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg' +
                                                                      '$listViewIndex',
                                                                ),
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      () {
                                                                        if (listViewChatsRecord.userA ==
                                                                            currentUserReference) {
                                                                          return userBQueryContainerAllUsersRecord
                                                                              .photoUrl;
                                                                        } else if (listViewChatsRecord.userB ==
                                                                            currentUserReference) {
                                                                          return userAQueryContainerAllUsersRecord
                                                                              .photoUrl;
                                                                        } else {
                                                                          return 'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg';
                                                                        }
                                                                      }(),
                                                                      'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                                                    ),
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            listViewChatsRecord
                                                                        .groupChatName !=
                                                                    null &&
                                                                listViewChatsRecord
                                                                        .groupChatName !=
                                                                    '',
                                                            false,
                                                          ))
                                                            Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray200,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              child: Icon(
                                                                Icons.group,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
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
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (listViewChatsRecord
                                                                          .groupChatName !=
                                                                      null &&
                                                                  listViewChatsRecord
                                                                          .groupChatName !=
                                                                      '') {
                                                                return listViewChatsRecord
                                                                    .groupChatName;
                                                              } else if (listViewChatsRecord
                                                                      .userA ==
                                                                  currentUserReference) {
                                                                return userBQueryContainerAllUsersRecord
                                                                    .displayName;
                                                              } else {
                                                                return userAQueryContainerAllUsersRecord
                                                                    .displayName;
                                                              }
                                                            }(),
                                                            'chatpartner',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 30),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          'd/M H:mm',
                                                                          listViewChatsRecord
                                                                              .lastMessageTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        null ||
                                                                    dateTimeFormat(
                                                                          'd/M H:mm',
                                                                          listViewChatsRecord
                                                                              .lastMessageTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? '...'
                                                                : dateTimeFormat(
                                                                    'd/M H:mm',
                                                                    listViewChatsRecord
                                                                        .lastMessageTime,
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  ),
                                                            '...',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewChatsRecord
                                                            .lastMessage,
                                                        '...',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  if (listViewChatsRecord
                                                          .users.length >
                                                      2)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.groups,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            listViewChatsRecord
                                                                .users.length
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ]
                                                    .addToStart(
                                                        SizedBox(height: 8.0))
                                                    .addToEnd(
                                                        SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8.0))
                                            .addToStart(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
