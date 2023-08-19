import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageUserProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isFollowing = false;

  bool isMember = false;

  bool isBlocked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserFollowsRecord? actionOutputUserFollows;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserFollowersRecord? actionOutputUserFollowers;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserMembersRecord? actionOutputUserMembers;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserRequestsReceivedRecord? actionOutputUserRequestsReceived;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserFollowsRecord? actionOutputMyUserFollows;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserRequestsReceivedRecord? actionOutputMyRequestsReceived;
  // Stores action output result for [Firestore Query - Query a collection] action in PageUserProfile widget.
  UserMembersRecord? actionOutputMyUserMembers;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
