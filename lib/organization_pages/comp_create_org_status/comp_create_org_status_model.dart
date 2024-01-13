import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'comp_create_org_status_widget.dart' show CompCreateOrgStatusWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompCreateOrgStatusModel
    extends FlutterFlowModel<CompCreateOrgStatusWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputField_message widget.
  FocusNode? inputFieldMessageFocusNode;
  TextEditingController? inputFieldMessageController;
  String? Function(BuildContext, String?)? inputFieldMessageControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputFieldMessageFocusNode?.dispose();
    inputFieldMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
