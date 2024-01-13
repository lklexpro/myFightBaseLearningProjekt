import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notifications/comp_notification_card/comp_notification_card_widget.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_notifications_model.dart';
export 'page_notifications_model.dart';

class PageNotificationsWidget extends StatefulWidget {
  const PageNotificationsWidget({Key? key}) : super(key: key);

  @override
  _PageNotificationsWidgetState createState() =>
      _PageNotificationsWidgetState();
}

class _PageNotificationsWidgetState extends State<PageNotificationsWidget> {
  late PageNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageNotificationsModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<UserNotificationInboxRecord>>(
      stream: queryUserNotificationInboxRecord(
        parent: currentUserReference,
        queryBuilder: (userNotificationInboxRecord) =>
            userNotificationInboxRecord.orderBy('createdAt', descending: true),
      )..listen((snapshot) async {
          List<UserNotificationInboxRecord>
              pageNotificationsUserNotificationInboxRecordList = snapshot;
          if (_model.pageNotificationsPreviousSnapshot != null &&
              !const ListEquality(UserNotificationInboxRecordDocumentEquality())
                  .equals(pageNotificationsUserNotificationInboxRecordList,
                      _model.pageNotificationsPreviousSnapshot)) {
            setState(() {});

            setState(() {});
          }
          _model.pageNotificationsPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitChasingDots(
                  color: Color(0xFFCF2E2E),
                  size: 20.0,
                ),
              ),
            ),
          );
        }
        List<UserNotificationInboxRecord>
            pageNotificationsUserNotificationInboxRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'p9dwnpan' /* Benachrichtigungen */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (context) {
                      final notificationElement =
                          pageNotificationsUserNotificationInboxRecordList
                              .where((e) => e.requestState != 'read')
                              .toList();
                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          8.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: notificationElement.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, notificationElementIndex) {
                          final notificationElementItem =
                              notificationElement[notificationElementIndex];
                          return Container(
                            height: 116.0,
                            decoration: BoxDecoration(),
                            child: CompNotificationCardWidget(
                              key: Key(
                                  'Key9x8_${notificationElementIndex}_of_${notificationElement.length}'),
                              notificationDocument: notificationElementItem,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 16.0,
                  endIndent: 16.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableController,
                      child: ExpandablePanel(
                        header: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'xuqz01zf' /* Benachrichtigungsverlauf */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Builder(
                          builder: (context) {
                            final notificationElement =
                                pageNotificationsUserNotificationInboxRecordList
                                    .where((e) => e.requestState == 'read')
                                    .toList()
                                    .take(15)
                                    .toList();
                            if (notificationElement.isEmpty) {
                              return CompEmptyPageWidget();
                            }
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                8.0,
                                0,
                                8.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: notificationElement.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, notificationElementIndex) {
                                final notificationElementItem =
                                    notificationElement[
                                        notificationElementIndex];
                                return Container(
                                  height: 116.0,
                                  decoration: BoxDecoration(),
                                  child: CompNotificationCardWidget(
                                    key: Key(
                                        'Keyz1s_${notificationElementIndex}_of_${notificationElement.length}'),
                                    notificationDocument:
                                        notificationElementItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          expandIcon: Icons.arrow_left_sharp,
                          collapseIcon: Icons.arrow_drop_down,
                          iconColor: FlutterFlowTheme.of(context).accent4,
                          iconPadding: EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
