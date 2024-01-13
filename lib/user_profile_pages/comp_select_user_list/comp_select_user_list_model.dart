import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_filter_facet_search/comp_filter_facet_search_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'comp_select_user_list_widget.dart' show CompSelectUserListWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompSelectUserListModel
    extends FlutterFlowModel<CompSelectUserListWidget> {
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

  final formKey = GlobalKey<FormState>();
  // Model for searchBar component.
  late SearchBarModel searchBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Bottom Sheet - CompFilterFacetSearch] action in IconButton widget.
  String? filterParameterMembers;
  // State field(s) for switchSelectAllMembers widget.
  bool? switchSelectAllMembersValue1;
  // Models for CompUserListDynamicChildrenMember.
  late FlutterFlowDynamicModels<CompUserListRelationDataModel>
      compUserListDynamicChildrenMemberModels1;
  // State field(s) for CheckboxListTileMember widget.

  Map<UserRelationDataStruct, bool> checkboxListTileMemberValueMap1 = {};
  List<UserRelationDataStruct> get checkboxListTileMemberCheckedItems1 =>
      checkboxListTileMemberValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for switchSelectAllFollowers widget.
  bool? switchSelectAllFollowersValue;
  // Models for CompUserListDynamicChildrenFollower.
  late FlutterFlowDynamicModels<CompUserListRelationDataModel>
      compUserListDynamicChildrenFollowerModels;
  // State field(s) for CheckboxListTileFollower widget.

  Map<UserRelationDataStruct, bool> checkboxListTileFollowerValueMap = {};
  List<UserRelationDataStruct> get checkboxListTileFollowerCheckedItems =>
      checkboxListTileFollowerValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Bottom Sheet - CompFilterFacetSearch] action in IconButton widget.
  String? filterParameterMembers2;
  // State field(s) for switchSelectAllMembers widget.
  bool? switchSelectAllMembersValue2;
  // Models for CompUserListDynamicChildrenMember.
  late FlutterFlowDynamicModels<CompUserListRelationDataModel>
      compUserListDynamicChildrenMemberModels2;
  // State field(s) for CheckboxListTileMember widget.

  Map<UserRelationDataStruct, bool> checkboxListTileMemberValueMap2 = {};
  List<UserRelationDataStruct> get checkboxListTileMemberCheckedItems2 =>
      checkboxListTileMemberValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    compUserListDynamicChildrenMemberModels1 =
        FlutterFlowDynamicModels(() => CompUserListRelationDataModel());
    compUserListDynamicChildrenFollowerModels =
        FlutterFlowDynamicModels(() => CompUserListRelationDataModel());
    compUserListDynamicChildrenMemberModels2 =
        FlutterFlowDynamicModels(() => CompUserListRelationDataModel());
  }

  void dispose() {
    searchBarModel.dispose();
    tabBarController?.dispose();
    compUserListDynamicChildrenMemberModels1.dispose();
    compUserListDynamicChildrenFollowerModels.dispose();
    compUserListDynamicChildrenMemberModels2.dispose();
  }

  /// Action blocks are added here.

  Future refreshQuery(BuildContext context) async {
    UserFollowersRecord? queryFollowersDocument;
    UserMembersRecord? queryMemberDocument;

    queryFollowersDocument = await queryUserFollowersRecordOnce(
      parent: currentUserReference,
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    queryMemberDocument = await queryUserMembersRecordOnce(
      parent: currentUserReference,
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    queryResultMembers =
        queryMemberDocument!.userData.toList().cast<UserRelationDataStruct>();
    queryResultFollowers = queryFollowersDocument!.userData
        .where((e) => !functions.checkIfUserIDisInUserRelationDataStructList(
            queryResultMembers.toList(), e.userID))
        .toList()
        .toList()
        .cast<UserRelationDataStruct>();
  }

  /// Additional helper methods are added here.
}
