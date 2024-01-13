import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'comp_filter_facet_search_widget.dart' show CompFilterFacetSearchWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompFilterFacetSearchModel
    extends FlutterFlowModel<CompFilterFacetSearchWidget> {
  ///  Local state fields for this component.

  List<String> listOfFilterFacetParamStrings = [];
  void addToListOfFilterFacetParamStrings(String item) =>
      listOfFilterFacetParamStrings.add(item);
  void removeFromListOfFilterFacetParamStrings(String item) =>
      listOfFilterFacetParamStrings.remove(item);
  void removeAtIndexFromListOfFilterFacetParamStrings(int index) =>
      listOfFilterFacetParamStrings.removeAt(index);
  void insertAtIndexInListOfFilterFacetParamStrings(int index, String item) =>
      listOfFilterFacetParamStrings.insert(index, item);
  void updateListOfFilterFacetParamStringsAtIndex(
          int index, Function(String) updateFn) =>
      listOfFilterFacetParamStrings[index] =
          updateFn(listOfFilterFacetParamStrings[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown_sportsType widget.
  String? dropDownSportsTypeValue;
  FormFieldController<String>? dropDownSportsTypeValueController;
  // State field(s) for DropDown_weightClass widget.
  String? dropDownWeightClassValue;
  FormFieldController<String>? dropDownWeightClassValueController;
  // State field(s) for textInput_postalCode widget.
  FocusNode? textInputPostalCodeFocusNode;
  TextEditingController? textInputPostalCodeController;
  String? Function(BuildContext, String?)?
      textInputPostalCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textInputPostalCodeFocusNode?.dispose();
    textInputPostalCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
