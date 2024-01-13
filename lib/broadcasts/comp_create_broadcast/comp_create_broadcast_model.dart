import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/comp_select_user_list/comp_select_user_list_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'comp_create_broadcast_widget.dart' show CompCreateBroadcastWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompCreateBroadcastModel
    extends FlutterFlowModel<CompCreateBroadcastWidget> {
  ///  Local state fields for this component.

  int loopCounter = 0;

  List<DocumentReference> userRelationDocRefsList = [];
  void addToUserRelationDocRefsList(DocumentReference item) =>
      userRelationDocRefsList.add(item);
  void removeFromUserRelationDocRefsList(DocumentReference item) =>
      userRelationDocRefsList.remove(item);
  void removeAtIndexFromUserRelationDocRefsList(int index) =>
      userRelationDocRefsList.removeAt(index);
  void insertAtIndexInUserRelationDocRefsList(
          int index, DocumentReference item) =>
      userRelationDocRefsList.insert(index, item);
  void updateUserRelationDocRefsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userRelationDocRefsList[index] = updateFn(userRelationDocRefsList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputField_headline widget.
  FocusNode? inputFieldHeadlineFocusNode;
  TextEditingController? inputFieldHeadlineController;
  String? Function(BuildContext, String?)?
      inputFieldHeadlineControllerValidator;
  // State field(s) for inputField_message widget.
  FocusNode? inputFieldMessageFocusNode;
  TextEditingController? inputFieldMessageController;
  String? Function(BuildContext, String?)? inputFieldMessageControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BroadcastsRecord? createdBroadcastDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputFieldHeadlineFocusNode?.dispose();
    inputFieldHeadlineController?.dispose();

    inputFieldMessageFocusNode?.dispose();
    inputFieldMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
