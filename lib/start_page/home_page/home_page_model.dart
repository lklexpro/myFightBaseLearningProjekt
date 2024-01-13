import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_no_events/comp_no_events_widget.dart';
import '/common_widgets/empty_list_widgets/comp_no_memberships/comp_no_memberships_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_create_org_status/comp_create_org_status_widget.dart';
import '/start_page/changelog/changelog_widget.dart';
import '/start_page/comp_beta_response/comp_beta_response_widget.dart';
import '/user_profile_pages/comp_account_dropdown/comp_account_dropdown_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (createSocialPostTimeline)] action in HomePage widget.
  ApiCallResponse? userSocialPostTimelineResponse;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  AllUsersRecord? authUserDoc;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  AllUsersRecord? userProfileMemberOfProfile;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
