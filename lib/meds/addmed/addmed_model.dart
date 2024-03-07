import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'addmed_widget.dart' show AddmedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddmedModel extends FlutterFlowModel<AddmedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for id widget.
  FocusNode? idFocusNode;
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for nameDrug widget.
  final nameDrugKey = GlobalKey();
  FocusNode? nameDrugFocusNode;
  TextEditingController? nameDrugController;
  String? nameDrugSelectedOption;
  String? Function(BuildContext, String?)? nameDrugControllerValidator;
  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  // State field(s) for typeDrug widget.
  String? typeDrugValue;
  FormFieldController<String>? typeDrugValueController;
  // State field(s) for dosage widget.
  int? dosageValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for morning widget.
  bool? morningValue;
  DateTime? datePicked1;
  // State field(s) for noon widget.
  bool? noonValue;
  DateTime? datePicked2;
  // State field(s) for evening widget.
  bool? eveningValue;
  DateTime? datePicked3;
  // State field(s) for night widget.
  bool? nightValue;
  DateTime? datePicked4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    idFocusNode?.dispose();
    idController?.dispose();

    nameDrugFocusNode?.dispose();

    detailFocusNode?.dispose();
    detailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
