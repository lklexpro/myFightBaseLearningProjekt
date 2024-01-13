import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_no_memberships_model.dart';
export 'comp_no_memberships_model.dart';

class CompNoMembershipsWidget extends StatefulWidget {
  const CompNoMembershipsWidget({Key? key}) : super(key: key);

  @override
  _CompNoMembershipsWidgetState createState() =>
      _CompNoMembershipsWidgetState();
}

class _CompNoMembershipsWidgetState extends State<CompNoMembershipsWidget> {
  late CompNoMembershipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompNoMembershipsModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group_off,
              color: FlutterFlowTheme.of(context).secondary,
              size: 24.0,
            ),
            AutoSizeText(
              FFLocalizations.of(context).getText(
                's8y3c54y' /* Du hast keine aktiven Vereinsm... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
