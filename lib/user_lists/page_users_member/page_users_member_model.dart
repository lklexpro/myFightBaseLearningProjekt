import '/backend/backend.dart';
import '/common_widgets/comp_empty_list/comp_empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_lists/comp_user_list_dynamic_children/comp_user_list_dynamic_children_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageUsersMemberModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for CompUserListDynamicChildren dynamic component.
  late FlutterFlowDynamicModels<CompUserListDynamicChildrenModel>
      compUserListDynamicChildrenModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compUserListDynamicChildrenModels =
        FlutterFlowDynamicModels(() => CompUserListDynamicChildrenModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    compUserListDynamicChildrenModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
