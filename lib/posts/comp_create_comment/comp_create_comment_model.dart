import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'comp_create_comment_widget.dart' show CompCreateCommentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompCreateCommentModel extends FlutterFlowModel<CompCreateCommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for input_TextField widget.
  FocusNode? inputTextFieldFocusNode;
  TextEditingController? inputTextFieldController;
  String? Function(BuildContext, String?)? inputTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputTextFieldFocusNode?.dispose();
    inputTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
