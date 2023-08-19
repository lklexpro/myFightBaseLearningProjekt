import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/comp_empty_list/comp_empty_list_widget.dart';
import '/events/comp_user_selection/comp_user_selection_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CompUserSelectionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // State field(s) for switchSelectAllFollowers widget.
  bool? switchSelectAllFollowersValue;
  // State field(s) for CheckboxListTile widget.

  Map<UserRelationDataStruct, bool> checkboxListTileValueMap = {};
  List<UserRelationDataStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Query cache managers for this widget.

  final _authUserFollowersDocManager =
      StreamRequestManager<List<UserFollowersRecord>>();
  Stream<List<UserFollowersRecord>> authUserFollowersDoc({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserFollowersRecord>> Function() requestFn,
  }) =>
      _authUserFollowersDocManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAuthUserFollowersDocCache() => _authUserFollowersDocManager.clear();
  void clearAuthUserFollowersDocCacheKey(String? uniqueKey) =>
      _authUserFollowersDocManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearAuthUserFollowersDocCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
