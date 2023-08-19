import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_lists/comp_user_list/comp_user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
              'v9z674th' /* Mitglieder finden */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Hammersmith One',
                  color: FlutterFlowTheme.of(context).alternate,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
              StreamBuilder<List<AllUsersRecord>>(
                stream: queryAllUsersRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitThreeBounce(
                          color: Color(0xFFCF2E2E),
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<AllUsersRecord> listViewAllUsersRecordList = snapshot
                      .data!
                      .where((u) => u.uid != currentUserUid)
                      .toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAllUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAllUsersRecord =
                          listViewAllUsersRecordList[listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
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
                          model: _model.compUserListModels.getModel(
                            listViewAllUsersRecord.uid,
                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: CompUserListWidget(
                            key: Key(
                              'Keyb2l_${listViewAllUsersRecord.uid}',
                            ),
                            documentUser: listViewAllUsersRecord,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
