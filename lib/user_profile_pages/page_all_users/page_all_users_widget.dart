import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_user_document/comp_user_list_user_document_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'page_all_users_model.dart';
export 'page_all_users_model.dart';

class PageAllUsersWidget extends StatefulWidget {
  const PageAllUsersWidget({Key? key}) : super(key: key);

  @override
  _PageAllUsersWidgetState createState() => _PageAllUsersWidgetState();
}

class _PageAllUsersWidgetState extends State<PageAllUsersWidget> {
  late PageAllUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageAllUsersModel());

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
              size: 28.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'v9z674th' /* Alle aktuellen Nutzer */,
            ),
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Hammersmith One',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'jjuwwrv3' /* Aktuelle Nutzer */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      AllUsersRecord>.separated(
                    pagingController: _model.setListViewController(
                      AllUsersRecord.collection,
                    ),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
                    builderDelegate: PagedChildBuilderDelegate<AllUsersRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: SpinKitChasingDots(
                            color: Color(0xFFCF2E2E),
                            size: 20.0,
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: SpinKitChasingDots(
                            color: Color(0xFFCF2E2E),
                            size: 20.0,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewAllUsersRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'PageUserProfile',
                              queryParameters: {
                                'userProfileDoc': serializeParam(
                                  listViewAllUsersRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'userProfileDoc': listViewAllUsersRecord,
                              },
                            );
                          },
                          child: wrapWithModel(
                            model:
                                _model.compUserListUserDocumentModels.getModel(
                              listViewAllUsersRecord.uid,
                              listViewIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: CompUserListUserDocumentWidget(
                              key: Key(
                                'Keyb2l_${listViewAllUsersRecord.uid}',
                              ),
                              documentUser: listViewAllUsersRecord,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
