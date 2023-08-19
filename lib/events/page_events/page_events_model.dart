import '/backend/backend.dart';
import '/common_widgets/comp_empty_list/comp_empty_list_widget.dart';
import '/events/comp_create_event/comp_create_event_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageEventsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compEventModels = FlutterFlowDynamicModels(() => CompEventModel());
  }

  void dispose() {
    unfocusNode.dispose();
    compEventModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
