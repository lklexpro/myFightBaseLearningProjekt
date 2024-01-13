import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_profile_pages/user_lists_and_overview/comp_user_list_relation_data/comp_user_list_relation_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_user_list_dynamic_children_checkbox_copy_model.dart';
export 'comp_user_list_dynamic_children_checkbox_copy_model.dart';

class CompUserListDynamicChildrenCheckboxCopyWidget extends StatefulWidget {
  const CompUserListDynamicChildrenCheckboxCopyWidget({
    Key? key,
    bool? selectedByAllButton,
    required this.userRelationData,
    required this.userDocReference,
  })  : this.selectedByAllButton = selectedByAllButton ?? true,
        super(key: key);

  final bool selectedByAllButton;
  final UserRelationDataStruct? userRelationData;
  final AllUsersRecord? userDocReference;

  @override
  _CompUserListDynamicChildrenCheckboxCopyWidgetState createState() =>
      _CompUserListDynamicChildrenCheckboxCopyWidgetState();
}

class _CompUserListDynamicChildrenCheckboxCopyWidgetState
    extends State<CompUserListDynamicChildrenCheckboxCopyWidget> {
  late CompUserListDynamicChildrenCheckboxCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CompUserListDynamicChildrenCheckboxCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        wrapWithModel(
          model: _model.compUserListRelationDataModel,
          updateCallback: () => setState(() {}),
          child: CompUserListRelationDataWidget(
            userRelationData: widget.userRelationData,
            userDocReference: widget.userDocReference?.reference,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
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
                    FFLocalizations.of(context).getText(
                      't4stoiu2' /*   */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Hammersmith One',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'lzwq7mxe' /*   */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
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
        ),
      ],
    );
  }
}
