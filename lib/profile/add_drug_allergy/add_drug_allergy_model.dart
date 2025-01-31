import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_drug_allergy_widget.dart' show AddDrugAllergyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDrugAllergyModel extends FlutterFlowModel<AddDrugAllergyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  final projectNameKey = GlobalKey();
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameController;
  String? projectNameSelectedOption;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    projectNameFocusNode?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
