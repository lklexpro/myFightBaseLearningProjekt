import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/broadcasts/comp_create_broadcast/comp_create_broadcast_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'comp_member_management_menu_widget.dart'
    show CompMemberManagementMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompMemberManagementMenuModel
    extends FlutterFlowModel<CompMemberManagementMenuWidget> {
  ///  Local state fields for this component.

  bool dataChanged = false;

  UserRelationDataStruct? originalUserRelationData;
  void updateOriginalUserRelationDataStruct(
          Function(UserRelationDataStruct) updateFn) =>
      updateFn(originalUserRelationData ??= UserRelationDataStruct());

  UserRelationDataStruct? newUserRelationData;
  void updateNewUserRelationDataStruct(
          Function(UserRelationDataStruct) updateFn) =>
      updateFn(newUserRelationData ??= UserRelationDataStruct());

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  AllUsersRecord? targetUserDocument;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Stores action output result for [Backend Call - Read Document] action in Container_DirectMessage widget.
  AllUsersRecord? targetUserDocumentCopy;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
