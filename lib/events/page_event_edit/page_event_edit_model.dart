import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'page_event_edit_widget.dart' show PageEventEditWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class PageEventEditModel extends FlutterFlowModel<PageEventEditWidget> {
  ///  Local state fields for this page.

  List<String> listAddedPhotos = [];
  void addToListAddedPhotos(String item) => listAddedPhotos.add(item);
  void removeFromListAddedPhotos(String item) => listAddedPhotos.remove(item);
  void removeAtIndexFromListAddedPhotos(int index) =>
      listAddedPhotos.removeAt(index);
  void insertAtIndexInListAddedPhotos(int index, String item) =>
      listAddedPhotos.insert(index, item);
  void updateListAddedPhotosAtIndex(int index, Function(String) updateFn) =>
      listAddedPhotos[index] = updateFn(listAddedPhotos[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for eventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameController;
  String? Function(BuildContext, String?)? eventNameControllerValidator;
  String? _eventNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oj61uule' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7bqk3cq3' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for eventLocationStreet widget.
  FocusNode? eventLocationStreetFocusNode;
  TextEditingController? eventLocationStreetController;
  String? Function(BuildContext, String?)?
      eventLocationStreetControllerValidator;
  // State field(s) for eventLocation widget.
  FocusNode? eventLocationFocusNode1;
  TextEditingController? eventLocationController1;
  String? Function(BuildContext, String?)? eventLocationController1Validator;
  // State field(s) for eventLocationZip widget.
  FocusNode? eventLocationZipFocusNode;
  TextEditingController? eventLocationZipController;
  String? Function(BuildContext, String?)? eventLocationZipControllerValidator;
  // State field(s) for eventLocation widget.
  FocusNode? eventLocationFocusNode2;
  TextEditingController? eventLocationController2;
  String? Function(BuildContext, String?)? eventLocationController2Validator;
  // State field(s) for attendeeLimit widget.
  FocusNode? attendeeLimitFocusNode;
  TextEditingController? attendeeLimitController;
  String? Function(BuildContext, String?)? attendeeLimitControllerValidator;
  // State field(s) for eventPartFee widget.
  FocusNode? eventPartFeeFocusNode;
  TextEditingController? eventPartFeeController;
  String? Function(BuildContext, String?)? eventPartFeeControllerValidator;
  // State field(s) for eventRegistriationReq widget.
  bool? eventRegistriationReqValue;
  // State field(s) for eventIsPrivate widget.
  bool? eventIsPrivateValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eventNameControllerValidator = _eventNameControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    eventNameFocusNode?.dispose();
    eventNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    eventLocationStreetFocusNode?.dispose();
    eventLocationStreetController?.dispose();

    eventLocationFocusNode1?.dispose();
    eventLocationController1?.dispose();

    eventLocationZipFocusNode?.dispose();
    eventLocationZipController?.dispose();

    eventLocationFocusNode2?.dispose();
    eventLocationController2?.dispose();

    attendeeLimitFocusNode?.dispose();
    attendeeLimitController?.dispose();

    eventPartFeeFocusNode?.dispose();
    eventPartFeeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
