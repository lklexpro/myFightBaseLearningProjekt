import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_no_result/comp_no_result_widget.dart';
import '/common_widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_filter_facet_search/comp_filter_facet_search_widget.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_user_document/comp_user_list_user_document_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'page_user_search_widget.dart' show PageUserSearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageUserSearchModel extends FlutterFlowModel<PageUserSearchWidget> {
  ///  Local state fields for this page.

  bool showSearchResult = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - CompFilterFacetSearch] action in IconButton widget.
  String? searchFacetParams;
  // Model for searchBar component.
  late SearchBarModel searchBarModel;
  // Algolia Search Results from action on searchBar
  List<AllUsersRecord>? algoliaSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for CompUserListUserDocument dynamic component.
  late FlutterFlowDynamicModels<CompUserListUserDocumentModel>
      compUserListUserDocumentModels4;

  /// Query cache managers for this widget.

  final _queryCacheRecentlyVisitedProfilesManager =
      StreamRequestManager<AllUsersRecord>();
  Stream<AllUsersRecord> queryCacheRecentlyVisitedProfiles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<AllUsersRecord> Function() requestFn,
  }) =>
      _queryCacheRecentlyVisitedProfilesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryCacheRecentlyVisitedProfilesCache() =>
      _queryCacheRecentlyVisitedProfilesManager.clear();
  void clearQueryCacheRecentlyVisitedProfilesCacheKey(String? uniqueKey) =>
      _queryCacheRecentlyVisitedProfilesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    compUserListUserDocumentModels4 =
        FlutterFlowDynamicModels(() => CompUserListUserDocumentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBarModel.dispose();
    tabBarController?.dispose();
    compUserListUserDocumentModels4.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryCacheRecentlyVisitedProfilesCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
