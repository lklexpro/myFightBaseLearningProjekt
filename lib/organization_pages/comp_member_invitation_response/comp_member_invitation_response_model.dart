import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'comp_member_invitation_response_widget.dart'
    show CompMemberInvitationResponseWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompMemberInvitationResponseModel
    extends FlutterFlowModel<CompMemberInvitationResponseWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (acceptOrganizationInvite)] action in btn_accept widget.
  ApiCallResponse? acceptOrganizationInvite;
  // Stores action output result for [Backend Call - API (declineOrganizationInvite)] action in btn_decline widget.
  ApiCallResponse? declineOrganizationInvite;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
