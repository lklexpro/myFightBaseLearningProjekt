import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_user_list_dynamic_children_checkbox_model.dart';
export 'comp_user_list_dynamic_children_checkbox_model.dart';

class CompUserListDynamicChildrenCheckboxWidget extends StatefulWidget {
  const CompUserListDynamicChildrenCheckboxWidget({
    Key? key,
    String? userDisplayName,
    String? userAvatar,
    String? memberStatus,
    bool? selectedByAllButton,
  })  : this.userDisplayName = userDisplayName ?? 'Unbekanntes Mitglied',
        this.userAvatar = userAvatar ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/my-fight-base-learning-projekt-4tl2i9/assets/o2ivyky84d1a/avatar_placeholder.png',
        this.memberStatus = memberStatus ?? 'Unbekannter Status',
        this.selectedByAllButton = selectedByAllButton ?? true,
        super(key: key);

  final String userDisplayName;
  final String userAvatar;
  final String memberStatus;
  final bool selectedByAllButton;

  @override
  _CompUserListDynamicChildrenCheckboxWidgetState createState() =>
      _CompUserListDynamicChildrenCheckboxWidgetState();
}

class _CompUserListDynamicChildrenCheckboxWidgetState
    extends State<CompUserListDynamicChildrenCheckboxWidget> {
  late CompUserListDynamicChildrenCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CompUserListDynamicChildrenCheckboxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        height: 80.0,
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.userAvatar,
                      'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                    ),
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue ??=
                        widget.selectedByAllButton,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue = newValue!);
                    },
                    title: Text(
                      widget.userDisplayName,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Hammersmith One',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                    subtitle: Text(
                      widget.memberStatus,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).tertiary,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
