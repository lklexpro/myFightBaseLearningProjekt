import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/common_widgets/empty_list_widgets/comp_no_events_found/comp_no_events_found_widget.dart';
import '/events/comp_event/comp_event_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_event_list_widget.dart' show PageEventListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PageEventListModel extends FlutterFlowModel<PageEventListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels1;
  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels2;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, EventsRecord>? listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // Models for CompEvent dynamic component.
  late FlutterFlowDynamicModels<CompEventModel> compEventModels3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compEventModels1 = FlutterFlowDynamicModels(() => CompEventModel());
    compEventModels2 = FlutterFlowDynamicModels(() => CompEventModel());
    compEventModels3 = FlutterFlowDynamicModels(() => CompEventModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    compEventModels1.dispose();
    compEventModels2.dispose();
    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    compEventModels3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EventsRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
