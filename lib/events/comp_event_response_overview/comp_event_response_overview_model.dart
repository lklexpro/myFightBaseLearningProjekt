import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_invitation_data/comp_user_list_invitation_data_widget.dart';
import 'dart:ui';
import 'comp_event_response_overview_widget.dart'
    show CompEventResponseOverviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompEventResponseOverviewModel
    extends FlutterFlowModel<CompEventResponseOverviewWidget> {
  ///  Local state fields for this component.

  List<UserRelationDataStruct> queryResultMembers = [];
  void addToQueryResultMembers(UserRelationDataStruct item) =>
      queryResultMembers.add(item);
  void removeFromQueryResultMembers(UserRelationDataStruct item) =>
      queryResultMembers.remove(item);
  void removeAtIndexFromQueryResultMembers(int index) =>
      queryResultMembers.removeAt(index);
  void insertAtIndexInQueryResultMembers(
          int index, UserRelationDataStruct item) =>
      queryResultMembers.insert(index, item);
  void updateQueryResultMembersAtIndex(
          int index, Function(UserRelationDataStruct) updateFn) =>
      queryResultMembers[index] = updateFn(queryResultMembers[index]);

  List<UserRelationDataStruct> queryResultFollowers = [];
  void addToQueryResultFollowers(UserRelationDataStruct item) =>
      queryResultFollowers.add(item);
  void removeFromQueryResultFollowers(UserRelationDataStruct item) =>
      queryResultFollowers.remove(item);
  void removeAtIndexFromQueryResultFollowers(int index) =>
      queryResultFollowers.removeAt(index);
  void insertAtIndexInQueryResultFollowers(
          int index, UserRelationDataStruct item) =>
      queryResultFollowers.insert(index, item);
  void updateQueryResultFollowersAtIndex(
          int index, Function(UserRelationDataStruct) updateFn) =>
      queryResultFollowers[index] = updateFn(queryResultFollowers[index]);

  List<UserRelationDataStruct> returnSelectedMembers = [];
  void addToReturnSelectedMembers(UserRelationDataStruct item) =>
      returnSelectedMembers.add(item);
  void removeFromReturnSelectedMembers(UserRelationDataStruct item) =>
      returnSelectedMembers.remove(item);
  void removeAtIndexFromReturnSelectedMembers(int index) =>
      returnSelectedMembers.removeAt(index);
  void insertAtIndexInReturnSelectedMembers(
          int index, UserRelationDataStruct item) =>
      returnSelectedMembers.insert(index, item);
  void updateReturnSelectedMembersAtIndex(
          int index, Function(UserRelationDataStruct) updateFn) =>
      returnSelectedMembers[index] = updateFn(returnSelectedMembers[index]);

  List<UserRelationDataStruct> returnSelectedFollowers = [];
  void addToReturnSelectedFollowers(UserRelationDataStruct item) =>
      returnSelectedFollowers.add(item);
  void removeFromReturnSelectedFollowers(UserRelationDataStruct item) =>
      returnSelectedFollowers.remove(item);
  void removeAtIndexFromReturnSelectedFollowers(int index) =>
      returnSelectedFollowers.removeAt(index);
  void insertAtIndexInReturnSelectedFollowers(
          int index, UserRelationDataStruct item) =>
      returnSelectedFollowers.insert(index, item);
  void updateReturnSelectedFollowersAtIndex(
          int index, Function(UserRelationDataStruct) updateFn) =>
      returnSelectedFollowers[index] = updateFn(returnSelectedFollowers[index]);

  ///  State fields for stateful widgets in this component.

  // Model for searchBar component.
  late SearchBarModel searchBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for CompUserListInvitationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListInvitationDataModel>
      compUserListInvitationDataModels1;
  // Models for CompUserListInvitationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListInvitationDataModel>
      compUserListInvitationDataModels2;
  // Models for CompUserListInvitationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListInvitationDataModel>
      compUserListInvitationDataModels3;
  // Models for CompUserListInvitationData dynamic component.
  late FlutterFlowDynamicModels<CompUserListInvitationDataModel>
      compUserListInvitationDataModels4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    compUserListInvitationDataModels1 =
        FlutterFlowDynamicModels(() => CompUserListInvitationDataModel());
    compUserListInvitationDataModels2 =
        FlutterFlowDynamicModels(() => CompUserListInvitationDataModel());
    compUserListInvitationDataModels3 =
        FlutterFlowDynamicModels(() => CompUserListInvitationDataModel());
    compUserListInvitationDataModels4 =
        FlutterFlowDynamicModels(() => CompUserListInvitationDataModel());
  }

  void dispose() {
    searchBarModel.dispose();
    tabBarController?.dispose();
    compUserListInvitationDataModels1.dispose();
    compUserListInvitationDataModels2.dispose();
    compUserListInvitationDataModels3.dispose();
    compUserListInvitationDataModels4.dispose();
  }

  /// Action blocks are added here.

  Future refreshQuery(BuildContext context) async {}

  /// Additional helper methods are added here.
}
