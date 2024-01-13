import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'chat_new_widget.dart' show ChatNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ChatNewModel extends FlutterFlowModel<ChatNewWidget> {
  ///  Local state fields for this page.

  ChatsRecord? chatDocumentQueryResult;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in ChatNew widget.
  ChatsRecord? chatDocumentByRef;
  // Stores action output result for [Firestore Query - Query a collection] action in ChatNew widget.
  ChatsRecord? queryExistingChats1;
  // Stores action output result for [Firestore Query - Query a collection] action in ChatNew widget.
  ChatsRecord? queryExistingChats2;
  // Stores action output result for [Backend Call - Create Document] action in ChatNew widget.
  ChatsRecord? newCreatedChatDoc;
  List<DirectMessagesRecord>? listViewPreviousSnapshot;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  DirectMessagesRecord? creatChatMessage;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  DirectMessagesRecord? createdChatMessageByIcon;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
