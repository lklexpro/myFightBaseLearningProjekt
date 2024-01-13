import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/posts/comp_create_post/comp_create_post_widget.dart';
import '/posts/comp_post_list/comp_post_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_social_posts_feed_model.dart';
export 'page_social_posts_feed_model.dart';

class PageSocialPostsFeedWidget extends StatefulWidget {
  const PageSocialPostsFeedWidget({Key? key}) : super(key: key);

  @override
  _PageSocialPostsFeedWidgetState createState() =>
      _PageSocialPostsFeedWidgetState();
}

class _PageSocialPostsFeedWidgetState extends State<PageSocialPostsFeedWidget>
    with TickerProviderStateMixin {
  late PageSocialPostsFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'compPostListOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => PageSocialPostsFeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.postsFeed?.toList() ?? []).length == 0) {
        _model.userFollowsDoc = await queryUserFollowsRecordOnce(
          parent: currentUserReference,
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.userFollowsDoc!.userData.length <= 0) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Bloß nichts verpassen!'),
                content: Text(
                    'Folge anderen Nutzern oder trete einem Verein bei, um die Posts dieser Nutzer in deiner Timeline sehen zu können. '),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Alles klar.'),
                  ),
                ],
              );
            },
          );
        }
        _model.createSocialPostTimelineAPIResult =
            await CreateSocialPostTimelineCall.call(
          userId: currentUserUid,
        );
        if ((_model.createSocialPostTimelineAPIResult?.succeeded ?? true)) {
          return;
        }

        return;
      } else {
        return;
      }
    });

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
                    child: CompCreatePostWidget(
                      visibilityPreselect: 'public',
                      postToUserRef: currentUserReference!,
                      postTypePreselect: 'socialPost',
                      postToUserRefDisplayName: currentUserDisplayName,
                    ),
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
            size: 30.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: AuthUserStreamWidget(
            builder: (context) => Builder(
              builder: (context) {
                final socialPostList =
                    (currentUserDocument?.postsFeed?.toList() ?? [])
                        .toList()
                        .take(100)
                        .toList();
                if (socialPostList.isEmpty) {
                  return CompEmptyPageWidget();
                }
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(socialPostList.length,
                            (socialPostListIndex) {
                      final socialPostListItem =
                          socialPostList[socialPostListIndex];
                      return StreamBuilder<PostsRecord>(
                        stream:
                            PostsRecord.getDocument(socialPostListItem.postID!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitCircle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 0.0,
                                ),
                              ),
                            );
                          }
                          final containerPostsRecord = snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: valueOrDefault<bool>(
                                containerPostsRecord != null,
                                false,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
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
                                          containerPostsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'postDocument': containerPostsRecord,
                                      },
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.compPostListModels.getModel(
                                      socialPostListItem.postID!.id,
                                      socialPostListIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: CompPostListWidget(
                                      key: Key(
                                        'Keyyro_${socialPostListItem.postID!.id}',
                                      ),
                                      parPostDoc: containerPostsRecord,
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'compPostListOnPageLoadAnimation']!),
                              ),
                            ),
                          );
                        },
                      );
                    })
                        .divide(SizedBox(height: 8.0))
                        .addToStart(SizedBox(height: 8.0))
                        .addToEnd(SizedBox(height: 8.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
