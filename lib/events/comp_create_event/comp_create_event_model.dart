import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/events/comp_user_selection/comp_user_selection_widget.dart';
import '/events/comp_user_selection_members/comp_user_selection_members_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class CompCreateEventModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int countInvitedMembers = 0;

  int countInvitedFollowers = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for eventName widget.
  TextEditingController? eventNameController;
  String? Function(BuildContext, String?)? eventNameControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  DateTime? datePicked;
  // State field(s) for eventLocation widget.
  TextEditingController? eventLocationController;
  String? Function(BuildContext, String?)? eventLocationControllerValidator;
  // State field(s) for eventIsPrivate widget.
  bool? eventIsPrivateValue;
  // State field(s) for eventRegistriationReq widget.
  bool? eventRegistriationReqValue;
  // State field(s) for eventPartFee widget.
  TextEditingController? eventPartFeeController;
  final eventPartFeeMask = MaskTextInputFormatter(mask: '####,## €');
  String? Function(BuildContext, String?)? eventPartFeeControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsRecord? createdEventDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    eventNameController?.dispose();
    descriptionController?.dispose();
    eventLocationController?.dispose();
    eventPartFeeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
