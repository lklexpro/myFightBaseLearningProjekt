import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_lists/comp_user_list/comp_user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageAllUsersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for CompUserList dynamic component.
  late FlutterFlowDynamicModels<CompUserListModel> compUserListModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compUserListModels = FlutterFlowDynamicModels(() => CompUserListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    compUserListModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
