import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import 'page_users_member_widget.dart' show PageUsersMemberWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageUsersMemberModel extends FlutterFlowModel<PageUsersMemberWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for searchBar component.
  late SearchBarModel searchBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
