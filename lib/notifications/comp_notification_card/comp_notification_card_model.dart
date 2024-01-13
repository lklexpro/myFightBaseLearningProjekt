import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'comp_notification_card_widget.dart' show CompNotificationCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompNotificationCardModel
    extends FlutterFlowModel<CompNotificationCardWidget> {
  ///  Local state fields for this component.

  bool userActionExecuted = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Firestore Query - Query a collection] action in organizationInvite widget.
  AllUsersRecord? queryResultUserRefDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in eventInvite widget.
  EventsRecord? queryResultEventRefDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Announcement widget.
  BroadcastsRecord? queryResultBroadcastRefDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
