import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comp_no_events_found_model.dart';
export 'comp_no_events_found_model.dart';

class CompNoEventsFoundWidget extends StatefulWidget {
  const CompNoEventsFoundWidget({Key? key}) : super(key: key);

  @override
  _CompNoEventsFoundWidgetState createState() =>
      _CompNoEventsFoundWidgetState();
}

class _CompNoEventsFoundWidgetState extends State<CompNoEventsFoundWidget> {
  late CompNoEventsFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompNoEventsFoundModel());

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
              Icons.event_busy_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 24.0,
            ),
            AutoSizeText(
              FFLocalizations.of(context).getText(
                '5xwhf9np' /* Aktuell keine Veranstaltungen ... */,
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
