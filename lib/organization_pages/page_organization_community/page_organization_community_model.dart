import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_no_memberships/comp_no_memberships_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_create_org_status/comp_create_org_status_widget.dart';
import '/posts/comp_create_post/comp_create_post_widget.dart';
import '/posts/comp_post_list/comp_post_list_widget.dart';
import 'page_organization_community_widget.dart'
    show PageOrganizationCommunityWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PageOrganizationCommunityModel
    extends FlutterFlowModel<PageOrganizationCommunityWidget> {
  ///  Local state fields for this page.

  bool selectedPostingsTab = true;

  bool selectedEventsTab = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for CompPostList dynamic component.
  late FlutterFlowDynamicModels<CompPostListModel> compPostListModels;
  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compPostListModels = FlutterFlowDynamicModels(() => CompPostListModel());
    compEventModels = FlutterFlowDynamicModels(() => CompEventModel());
  }

  void dispose() {
    unfocusNode.dispose();
    compPostListModels.dispose();
    compEventModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
