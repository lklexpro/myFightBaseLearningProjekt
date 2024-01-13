import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'page_user_profile_edit_widget.dart' show PageUserProfileEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageUserProfileEditModel
    extends FlutterFlowModel<PageUserProfileEditWidget> {
  ///  Local state fields for this page.

  bool deleteProfilePhoto = false;

  bool deleteBannerImage = false;

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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for textField_email widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for textField_aboutMe widget.
  FocusNode? textFieldAboutMeFocusNode;
  TextEditingController? textFieldAboutMeController;
  String? Function(BuildContext, String?)? textFieldAboutMeControllerValidator;
  // State field(s) for textField_adressStreet widget.
  FocusNode? textFieldAdressStreetFocusNode;
  TextEditingController? textFieldAdressStreetController;
  String? Function(BuildContext, String?)?
      textFieldAdressStreetControllerValidator;
  // State field(s) for textField_adressPostalCode widget.
  FocusNode? textFieldAdressPostalCodeFocusNode;
  TextEditingController? textFieldAdressPostalCodeController;
  String? Function(BuildContext, String?)?
      textFieldAdressPostalCodeControllerValidator;
  // State field(s) for textField_adressCity widget.
  FocusNode? textFieldAdressCityFocusNode;
  TextEditingController? textFieldAdressCityController;
  String? Function(BuildContext, String?)?
      textFieldAdressCityControllerValidator;
  // State field(s) for textField_phoneNumber widget.
  FocusNode? textFieldPhoneNumberFocusNode;
  TextEditingController? textFieldPhoneNumberController;
  String? Function(BuildContext, String?)?
      textFieldPhoneNumberControllerValidator;
  // State field(s) for textField_contactMail widget.
  FocusNode? textFieldContactMailFocusNode;
  TextEditingController? textFieldContactMailController;
  String? Function(BuildContext, String?)?
      textFieldContactMailControllerValidator;
  // State field(s) for textField_firstName widget.
  FocusNode? textFieldFirstNameFocusNode;
  TextEditingController? textFieldFirstNameController;
  String? Function(BuildContext, String?)?
      textFieldFirstNameControllerValidator;
  // State field(s) for textField_lastName widget.
  FocusNode? textFieldLastNameFocusNode;
  TextEditingController? textFieldLastNameController;
  String? Function(BuildContext, String?)? textFieldLastNameControllerValidator;
  // State field(s) for input_sportsType widget.
  String? inputSportsTypeValue;
  FormFieldController<String>? inputSportsTypeValueController;
  // State field(s) for input_weightClass widget.
  String? inputWeightClassValue;
  FormFieldController<String>? inputWeightClassValueController;
  // State field(s) for textField_height widget.
  FocusNode? textFieldHeightFocusNode;
  TextEditingController? textFieldHeightController;
  String? Function(BuildContext, String?)? textFieldHeightControllerValidator;
  // State field(s) for textField_weight widget.
  FocusNode? textFieldWeightFocusNode;
  TextEditingController? textFieldWeightController;
  String? Function(BuildContext, String?)? textFieldWeightControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailController?.dispose();

    textFieldAboutMeFocusNode?.dispose();
    textFieldAboutMeController?.dispose();

    textFieldAdressStreetFocusNode?.dispose();
    textFieldAdressStreetController?.dispose();

    textFieldAdressPostalCodeFocusNode?.dispose();
    textFieldAdressPostalCodeController?.dispose();

    textFieldAdressCityFocusNode?.dispose();
    textFieldAdressCityController?.dispose();

    textFieldPhoneNumberFocusNode?.dispose();
    textFieldPhoneNumberController?.dispose();

    textFieldContactMailFocusNode?.dispose();
    textFieldContactMailController?.dispose();

    textFieldFirstNameFocusNode?.dispose();
    textFieldFirstNameController?.dispose();

    textFieldLastNameFocusNode?.dispose();
    textFieldLastNameController?.dispose();

    textFieldHeightFocusNode?.dispose();
    textFieldHeightController?.dispose();

    textFieldWeightFocusNode?.dispose();
    textFieldWeightController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
