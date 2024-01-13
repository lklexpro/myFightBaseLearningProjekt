import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_member_invitation_response/comp_member_invitation_response_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'page_user_profile_copy_widget.dart' show PageUserProfileCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PageUserProfileCopyModel
    extends FlutterFlowModel<PageUserProfileCopyWidget> {
  ///  Local state fields for this page.

  bool showMemberOfContainer = false;

  bool userRelationLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfileCopy widget.
  UserFollowsRecord? actionOutputUserFollows;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfileCopy widget.
  UserFollowersRecord? actionOutputUserFollowers;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfileCopy widget.
  UserMembersRecord? actionOutputUserMembers;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // Stores action output result for [Backend Call - API (followUser)] action in btn_createFollowing widget.
  ApiCallResponse? followerUserResult;
  // Stores action output result for [Backend Call - API (inviteUserToOrganization)] action in btn_inviteToOrganization widget.
  ApiCallResponse? inviteUserToOrganizationResult;
  // Stores action output result for [Backend Call - API (blockUser)] action in btn_block widget.
  ApiCallResponse? blockUserResult;
  // Stores action output result for [Backend Call - API (unblockUser)] action in btn_unblock widget.
  ApiCallResponse? unblockUserResult;
  // Stores action output result for [Backend Call - API (unfollowUser)] action in btn_removeFollowing widget.
  ApiCallResponse? unfollowUserResult;
  // Stores action output result for [Backend Call - API (leaveOrganization)] action in btn_LeaveFromOrganization widget.
  ApiCallResponse? leaveOrganizationResult;
  // Stores action output result for [Backend Call - API (removeUserFromOrganization)] action in btn_RemoveFromOrganization widget.
  ApiCallResponse? removeFromOrganizationResult;
  // Stores action output result for [Backend Call - API (withdrawOrganizationInvite)] action in btn_withdrawOrgInvite widget.
  ApiCallResponse? withdrawOrganizationInviteResult;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  AllUsersRecord? userProfileMemberOfOrganization;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
