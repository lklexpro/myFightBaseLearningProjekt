import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import 'comp_user_list_dynamic_children_checkbox_copy_widget.dart'
    show CompUserListDynamicChildrenCheckboxCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompUserListDynamicChildrenCheckboxCopyModel
    extends FlutterFlowModel<CompUserListDynamicChildrenCheckboxCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CompUserListRelationData component.
  late CompUserListRelationDataModel compUserListRelationDataModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compUserListRelationDataModel =
        createModel(context, () => CompUserListRelationDataModel());
  }

  void dispose() {
    compUserListRelationDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
