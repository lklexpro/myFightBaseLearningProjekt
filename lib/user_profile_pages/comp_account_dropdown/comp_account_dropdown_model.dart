import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_profile_pages/comp_profile_q_r_code/comp_profile_q_r_code_widget.dart';
import 'dart:ui';
import 'comp_account_dropdown_widget.dart' show CompAccountDropdownWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompAccountDropdownModel
    extends FlutterFlowModel<CompAccountDropdownWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Stores action output result for [Backend Call - Read Document] action in replaceWidget widget.
  AllUsersRecord? authUserDoc;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  var barcode = '';
  // Stores action output result for [Firestore Query - Query a collection] action in editAccWidget widget.
  AllUsersRecord? foundProfileByQR;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
