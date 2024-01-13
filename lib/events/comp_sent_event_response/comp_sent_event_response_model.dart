import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'comp_sent_event_response_widget.dart' show CompSentEventResponseWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompSentEventResponseModel
    extends FlutterFlowModel<CompSentEventResponseWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (acceptEventInvite)] action in btn_accept widget.
  ApiCallResponse? acceptEventInvite;
  // Stores action output result for [Backend Call - API (publicEventEnroll)] action in btn_accept widget.
  ApiCallResponse? publicEventEnroll;
  // Stores action output result for [Backend Call - API (declineEventInvite)] action in btn_decline widget.
  ApiCallResponse? declineEventInvite;
  // Stores action output result for [Backend Call - API (publicEventDisenroll)] action in btn_decline widget.
  ApiCallResponse? publicEventDisenroll;
  // Stores action output result for [Backend Call - API (postponeEventInvite)] action in btn_indecisive widget.
  ApiCallResponse? indecisiveEventInvite;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
