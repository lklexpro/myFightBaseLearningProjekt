import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_member_management_menu/comp_member_management_menu_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_invitation_data/comp_user_list_invitation_data_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'page_manage_members_widget.dart' show PageManageMembersWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageManageMembersModel extends FlutterFlowModel<PageManageMembersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for searchBar component.
  late SearchBarModel searchBarModel;
  // Models for CompUserListRelationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListRelationDataModel>
      compUserListRelationDataModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Models for CompUserListInvitationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListInvitationDataModel>
      compUserListInvitationDataModels;
  // Stores action output result for [Backend Call - API (withdrawOrganizationInvite)] action in CompUserListInvitationData widget.
  ApiCallResponse? withdrawOrganizationInviteResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    compUserListRelationDataModels =
        FlutterFlowDynamicModels(() => CompUserListRelationDataModel());
    compUserListInvitationDataModels =
        FlutterFlowDynamicModels(() => CompUserListInvitationDataModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBarModel.dispose();
    compUserListRelationDataModels.dispose();
    expandableController.dispose();
    compUserListInvitationDataModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
