import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future clearTempUserSelections(BuildContext context) async {
  FFAppState().listUserRelationDataTempStorage = [];
  FFAppState().listUserRelationDataTempStorage2 = [];
  FFAppState().listSearchSelectAllMembers = false;
  FFAppState().listSearchSelectAllFollowers = false;
}
