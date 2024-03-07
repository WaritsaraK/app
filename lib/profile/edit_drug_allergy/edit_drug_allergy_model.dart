import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_drug_allergy_widget.dart' show EditDrugAllergyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDrugAllergyModel extends FlutterFlowModel<EditDrugAllergyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  final nameKey = GlobalKey();
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? nameSelectedOption;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();

    detailFocusNode?.dispose();
    detailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
