import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/events/comp_create_event/comp_create_event_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'page_event_organization_list_widget.dart'
    show PageEventOrganizationListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageEventOrganizationListModel
    extends FlutterFlowModel<PageEventOrganizationListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels1;
  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compEventModels1 = FlutterFlowDynamicModels(() => CompEventModel());
    compEventModels2 = FlutterFlowDynamicModels(() => CompEventModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    compEventModels1.dispose();
    compEventModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
