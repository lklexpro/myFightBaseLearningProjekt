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
import 'page_social_posts_feed_widget.dart' show PageSocialPostsFeedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageSocialPostsFeedModel
    extends FlutterFlowModel<PageSocialPostsFeedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PageSocialPostsFeed widget.
  UserFollowsRecord? userFollowsDoc;
  // Stores action output result for [Backend Call - API (createSocialPostTimeline)] action in PageSocialPostsFeed widget.
  ApiCallResponse? createSocialPostTimelineAPIResult;
  // Models for CompPostList dynamic component.
  late FlutterFlowDynamicModels<CompPostListModel> compPostListModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compPostListModels = FlutterFlowDynamicModels(() => CompPostListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    compPostListModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
