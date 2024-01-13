import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_post_list_model.dart';
export 'comp_post_list_model.dart';

class CompPostListWidget extends StatefulWidget {
  const CompPostListWidget({
    Key? key,
    required this.parPostDoc,
  }) : super(key: key);

  final PostsRecord? parPostDoc;

  @override
  _CompPostListWidgetState createState() => _CompPostListWidgetState();
}

class _CompPostListWidgetState extends State<CompPostListWidget>
    with TickerProviderStateMixin {
  late CompPostListModel _model;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
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
    _model = createModel(context, () => CompPostListModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'PageSocialPostDetailPage',
                queryParameters: {
                  'postDocument': serializeParam(
                    widget.parPostDoc,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'postDocument': widget.parPostDoc,
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 4.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.postUserDoc = await AllUsersRecord.getDocumentOnce(
                          widget.parPostDoc!.postUser!);

                      context.pushNamed(
                        'PageUserProfile',
                        queryParameters: {
                          'userProfileDoc': serializeParam(
                            _model.postUserDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'userProfileDoc': _model.postUserDoc,
                        },
                      );

                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: valueOrDefault<String>(
                            widget.parPostDoc?.postUserAvatar,
                            'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                          ),
                          transitionOnUserGestures: true,
                          child: Container(
                            width: 45.0,
                            height: 45.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                widget.parPostDoc?.postUserAvatar,
                                'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 0.0, 4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.parPostDoc?.postUserDisplayName,
                                  'poster name',
                                ),
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        dateTimeFormat(
                                          'relative',
                                          widget.parPostDoc?.timePosted,
                                          locale: FFLocalizations.of(context)
                                                  .languageShortCode ??
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                        ),
                                        'now',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'uakcut7o' /*  •  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        dateTimeFormat(
                                          'EEEE, dd.MM.yyyy HH:mm',
                                          widget.parPostDoc?.timePosted,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '01.01.1990',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                valueOrDefault<bool>(
                                      widget.parPostDoc?.hasPostPostedToUser(),
                                      false,
                                    ) &&
                                    valueOrDefault<bool>(
                                      widget.parPostDoc
                                          ?.hasPostPostedToUserDisplayName(),
                                      false,
                                    ) &&
                                    (widget.parPostDoc?.postType ==
                                        'communityPost'),
                                false,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.targetUserDocument =
                                                  await AllUsersRecord
                                                      .getDocumentOnce(widget
                                                          .parPostDoc!
                                                          .postPostedToUser!);

                                              context.pushNamed(
                                                'PageUserProfile',
                                                queryParameters: {
                                                  'userProfileDoc':
                                                      serializeParam(
                                                    _model.targetUserDocument,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfileDoc':
                                                      _model.targetUserDocument,
                                                },
                                              );

                                              setState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 16.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Icon(
                                                    Icons.group,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 16.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'f7s3z8jp' /* Gepostet in  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget.parPostDoc
                                                        ?.postPostedToUserDisplayName,
                                                    'Unbekannte Gruppe',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(width: 4.0))
                                                  .addToEnd(
                                                      SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 12.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.parPostDoc?.postDescription,
                            'post content',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        widget.parPostDoc?.postPhoto != null &&
                            widget.parPostDoc?.postPhoto != '',
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Hero(
                            tag: widget.parPostDoc!.postPhoto,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                widget.parPostDoc!.postPhoto,
                                width: MediaQuery.sizeOf(context).width * 5.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.mode_comment_outlined,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.parPostDoc?.numComments?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap['iconOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0)
                                    .whenComplete(animationsMap[
                                            'iconOnActionTriggerAnimation']!
                                        .controller
                                        .reverse);
                              }
                              _model.likePostResult =
                                  await SocialPostReactionCall.call(
                                postId: widget.parPostDoc?.reference.id,
                                authUserId: currentUserUid,
                                docType: 'post',
                              );
                              if (!(_model.likePostResult?.succeeded ?? true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tut uns leid, das hat leider nicht funktioniert!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                              setState(() {});

                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: valueOrDefault<Color>(
                                    widget.parPostDoc!.likes
                                            .contains(currentUserReference)
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  size: 24.0,
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation']!,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.parPostDoc?.likes?.length
                                        ?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
