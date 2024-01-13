import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'page_add_users_to_chat_widget.dart' show PageAddUsersToChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageAddUsersToChatModel
    extends FlutterFlowModel<PageAddUsersToChatWidget> {
  ///  Local state fields for this page.

  int countUserToInviteToGroupchat = 0;

  ///  State fields for stateful widgets in this page.

  // Model for searchBar component.
  late SearchBarModel searchBarModel;
  // State field(s) for CheckboxListTile widget.

  Map<UserRelationDataStruct, bool> checkboxListTileValueMap = {};
  List<UserRelationDataStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AllUsersRecord? followerUserDocRef;
  // Stores action output result for [Group Chat Action] action in Button widget.
  ChatsRecord? groupChat;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
  }

  void dispose() {
    searchBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
