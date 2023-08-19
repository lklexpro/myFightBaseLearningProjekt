import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/common_widgets/comp_empty_list/comp_empty_list_widget.dart';
import '/feed/comp_create_post/comp_create_post_widget.dart';
import '/feed/comp_social_post/comp_social_post_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_social_posts_recent_posts_model.dart';
export 'page_social_posts_recent_posts_model.dart';

class PageSocialPostsRecentPostsWidget extends StatefulWidget {
  const PageSocialPostsRecentPostsWidget({Key? key}) : super(key: key);

  @override
  _PageSocialPostsRecentPostsWidgetState createState() =>
      _PageSocialPostsRecentPostsWidgetState();
}

class _PageSocialPostsRecentPostsWidgetState
    extends State<PageSocialPostsRecentPostsWidget>
    with TickerProviderStateMixin {
  late PageSocialPostsRecentPostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'compSocialPostOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => PageSocialPostsRecentPostsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.postsFeed?.toList() ?? []).length == 0) {
        _model.apiResultihq = await CreateSocialPostTimelineCall.call(
          userId: currentUserUid,
        );
        if ((_model.apiResultihq?.succeeded ?? true)) {
          return;
        }

        return;
      } else {
        return;
      }
    });
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
                    child: CompCreatePostWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final socialPostList =
                      (currentUserDocument?.postsFeed?.toList() ?? [])
                          .take(25)
                          .toList()
                          .take(25)
                          .toList();
                  if (socialPostList.isEmpty) {
                    return CompEmptyListWidget();
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Aktualisiere Timeline',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      _model.apiResultnnl =
                          await CreateSocialPostTimelineCall.call(
                        userId: currentUserUid,
                      );
                      if ((_model.apiResultnnl?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Tut uns leid.'),
                              content: Text(
                                  'Etwas ist schief gelaufen. Bitte versuche es später noch einmal.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemCount: socialPostList.length,
                      itemBuilder: (context, socialPostListIndex) {
                        final socialPostListItem =
                            socialPostList[socialPostListIndex];
                        return StreamBuilder<PostsRecord>(
                          stream: PostsRecord.getDocument(
                              socialPostListItem.postID!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final compSocialPostPostsRecord = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'PageSocialPostDetails',
                                  queryParameters: {
                                    'postDocument': serializeParam(
                                      compSocialPostPostsRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'postDocument': compSocialPostPostsRecord,
                                  },
                                );
                              },
                              child: CompSocialPostWidget(
                                key: Key(
                                    'Keykr6_${socialPostListIndex}_of_${socialPostList.length}'),
                                parPostDoc: compSocialPostPostsRecord,
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'compSocialPostOnPageLoadAnimation']!);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
