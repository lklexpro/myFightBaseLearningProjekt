import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'comp_group_chat_assign_name_widget.dart'
    show CompGroupChatAssignNameWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompGroupChatAssignNameModel
    extends FlutterFlowModel<CompGroupChatAssignNameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputField_groupName widget.
  FocusNode? inputFieldGroupNameFocusNode;
  TextEditingController? inputFieldGroupNameController;
  String? Function(BuildContext, String?)?
      inputFieldGroupNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputFieldGroupNameFocusNode?.dispose();
    inputFieldGroupNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
