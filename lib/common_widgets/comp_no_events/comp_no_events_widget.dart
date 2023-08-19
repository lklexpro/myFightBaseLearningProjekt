import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_no_events_model.dart';
export 'comp_no_events_model.dart';

class CompNoEventsWidget extends StatefulWidget {
  const CompNoEventsWidget({Key? key}) : super(key: key);

  @override
  _CompNoEventsWidgetState createState() => _CompNoEventsWidgetState();
}

class _CompNoEventsWidgetState extends State<CompNoEventsWidget> {
  late CompNoEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompNoEventsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.event_busy_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              Expanded(
                child: AutoSizeText(
                  FFLocalizations.of(context).getText(
                    '6xo9l5ih' /* Du hast keine anstehenden Vera... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
