import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'page_register_account_widget.dart' show PageRegisterAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageRegisterAccountModel
    extends FlutterFlowModel<PageRegisterAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressUser widget.
  FocusNode? emailAddressUserFocusNode;
  TextEditingController? emailAddressUserController;
  String? Function(BuildContext, String?)? emailAddressUserControllerValidator;
  String? _emailAddressUserControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k9x6uh1w' /* Bitte eine gültige E-Mail Adre... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'glsml2nr' /* E-Mail ungültig */,
      );
    }
    return null;
  }

  // State field(s) for passwordUser widget.
  FocusNode? passwordUserFocusNode;
  TextEditingController? passwordUserController;
  late bool passwordUserVisibility;
  String? Function(BuildContext, String?)? passwordUserControllerValidator;
  String? _passwordUserControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ct53351h' /* Passwort benötigt. */,
      );
    }

    return null;
  }

  // State field(s) for confirmPasswordUser widget.
  FocusNode? confirmPasswordUserFocusNode;
  TextEditingController? confirmPasswordUserController;
  late bool confirmPasswordUserVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordUserControllerValidator;
  String? _confirmPasswordUserControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2j1r9fvg' /* Bitte Passwort wiederholen. */,
      );
    }

    return null;
  }

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameController;
  String? Function(BuildContext, String?)? surnameControllerValidator;
  String? _surnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vkt3emd0' /* Bitte Vornamen eintragen. */,
      );
    }

    return null;
  }

  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  String? _lastnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'am05gf4i' /* Bitte Nachnamen eintragen. */,
      );
    }

    return null;
  }

  // State field(s) for input_sportsType widget.
  String? inputSportsTypeValue;
  FormFieldController<String>? inputSportsTypeValueController;
  // State field(s) for checkbox_agb widget.
  bool? checkboxAgbValue;
  // State field(s) for checkbox_dvo widget.
  bool? checkboxDvoValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressUserControllerValidator = _emailAddressUserControllerValidator;
    passwordUserVisibility = false;
    passwordUserControllerValidator = _passwordUserControllerValidator;
    confirmPasswordUserVisibility = false;
    confirmPasswordUserControllerValidator =
        _confirmPasswordUserControllerValidator;
    surnameControllerValidator = _surnameControllerValidator;
    lastnameControllerValidator = _lastnameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressUserFocusNode?.dispose();
    emailAddressUserController?.dispose();

    passwordUserFocusNode?.dispose();
    passwordUserController?.dispose();

    confirmPasswordUserFocusNode?.dispose();
    confirmPasswordUserController?.dispose();

    surnameFocusNode?.dispose();
    surnameController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
