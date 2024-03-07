import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_med_model.dart';
export 'edit_med_model.dart';

class EditMedWidget extends StatefulWidget {
  const EditMedWidget({
    super.key,
    required this.meds,
    required this.notiTime,
  });

  final MedicationsRecord? meds;
  final List<NotiRecord>? notiTime;

  @override
  State<EditMedWidget> createState() => _EditMedWidgetState();
}

class _EditMedWidgetState extends State<EditMedWidget>
    with TickerProviderStateMixin {
  late EditMedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMedModel());

    _model.idController ??= TextEditingController(text: widget.meds?.id);
    _model.idFocusNode ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.meds?.nameDrug);

    _model.textController3 ??=
        TextEditingController(text: widget.meds?.detailDrug);
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: 'ยกเลิก',
                            options: FFButtonOptions(
                              width: 90.0,
                              height: 40.0,
                              padding: EdgeInsets.all(0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Text(
                            'แก้ไขยา',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  fontSize: 20.0,
                                ),
                          ),
                          StreamBuilder<List<NotiRecord>>(
                            stream: queryNotiRecord(
                              parent: currentUserReference,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<NotiRecord> buttonNotiRecordList =
                                  snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await widget.meds!.reference.update({
                                    ...createMedicationsRecordData(
                                      nameDrug: _model.textController2.text,
                                      detailDrug: _model.textController3.text,
                                      typeDrug: _model.dropDownValue,
                                      dosage: _model.countControllerValue,
                                      takeDrug: _model.choiceChipsValue1,
                                      useDrug: _model.choiceChipsValue2,
                                      morning: _model.morningValue,
                                      morningTime: _model.datePicked1,
                                      noon: _model.noonValue,
                                      noonTime: _model.datePicked2,
                                      evening: _model.eveningValue,
                                      eveningTime: _model.datePicked3,
                                      night: _model.nightValue,
                                      nightTime: _model.datePicked4,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'image_drug':
                                            _model.uploadedFileUrls.length >= 1
                                                ? _model.uploadedFileUrls
                                                    .map((e) => e)
                                                    .toList()
                                                : widget.meds?.imageDrug,
                                      },
                                    ),
                                  });
                                  if ((_model.morningValue == true) &&
                                      (widget.meds?.morning == true) &&
                                      (dateTimeFormat(
                                                  'jm', _model.datePicked1) !=
                                              null &&
                                          dateTimeFormat(
                                                  'jm', _model.datePicked1) !=
                                              '')) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.morningTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked1!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked1!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked1),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked1,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  } else if ((_model.morningValue == false) &&
                                      (widget.meds?.morning == true)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.morningTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                  } else if ((_model.morningValue == true) &&
                                      (widget.meds?.morning == false)) {
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked1!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked1!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked1),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked1,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  }

                                  if ((_model.noonValue == true) &&
                                      (widget.meds?.noon == true) &&
                                      (_model.datePicked2 != null)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.noonTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked2!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked2!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked2),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked2,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  } else if ((_model.noonValue == false) &&
                                      (widget.meds?.noon == true)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.noonTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                  } else if ((_model.noonValue == true) &&
                                      (widget.meds?.noon == false)) {
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked2!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked2!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked2),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked2,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  }

                                  if ((_model.eveningValue == true) &&
                                      (widget.meds?.evening == true) &&
                                      (_model.datePicked3 != null)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.eveningTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked3!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked3!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked3),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked3,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  } else if ((_model.eveningValue == false) &&
                                      (widget.meds?.evening == true)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.eveningTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                  } else if ((_model.eveningValue == true) &&
                                      (widget.meds?.evening == false)) {
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked3!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked3!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked3),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked3,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  }

                                  if ((_model.nightValue == true) &&
                                      (widget.meds?.night == true) &&
                                      (_model.datePicked4 != null)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.nightTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked4!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked4!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked4),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked4,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  } else if ((_model.nightValue == false) &&
                                      (widget.meds?.night == true)) {
                                    // Action morning
                                    await actions.deleteID(
                                      widget.meds?.id,
                                      functions.findDocumentInNotiCollection(
                                          widget.meds!.nightTime!,
                                          widget.notiTime!
                                              .map((e) => e.reference)
                                              .toList()),
                                    );
                                  } else if ((_model.nightValue == true) &&
                                      (widget.meds?.night == false)) {
                                    if (functions.checkDocumentInNotiCollection(
                                        _model.datePicked4!,
                                        widget.notiTime!
                                            .map((e) => e.reference)
                                            .toList())) {
                                      await functions
                                          .findDocumentInNotiCollection(
                                              _model.datePicked4!,
                                              buttonNotiRecordList
                                                  .map((e) => e.reference)
                                                  .toList())!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'id': FieldValue.arrayUnion(
                                                [_model.idController.text]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await NotiRecord.createDoc(
                                        currentUserReference!,
                                        id: dateTimeFormat(
                                            'HHmm', _model.datePicked4),
                                      ).set({
                                        ...createNotiRecordData(
                                          time: _model.datePicked4,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'id': [_model.idController.text],
                                          },
                                        ),
                                      });
                                    }
                                  }

                                  await actions.deleteTime(
                                    _model.morningValue!,
                                    _model.noonValue!,
                                    _model.eveningValue!,
                                    _model.eveningValue!,
                                    widget.meds?.reference,
                                  );
                                  context.safePop();
                                },
                                text: 'อัปเดท',
                                options: FFButtonOptions(
                                  width: 90.0,
                                  height: 40.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.idController,
                                    focusNode: _model.idFocusNode,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.idControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.15,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          if ((widget.meds!.imageDrug.length >=
                                                  1) &&
                                              (_model.uploadedFileUrls.length <
                                                  1))
                                            Builder(
                                              builder: (context) {
                                                final pic = widget
                                                        .meds?.imageDrug
                                                        ?.map((e) => e)
                                                        .toList()
                                                        ?.toList() ??
                                                    [];
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        pic.length, (picIndex) {
                                                      final picItem =
                                                          pic[picIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  picItem,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.15,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (widget.meds?.imageDrug?.length !=
                                              null)
                                            Builder(
                                              builder: (context) {
                                                final newPic = _model
                                                    .uploadedFileUrls
                                                    .map((e) => e)
                                                    .toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        newPic.length,
                                                        (newPicIndex) {
                                                      final newPicItem =
                                                          newPic[newPicIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  newPicItem,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.15,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFiles =
                                                          selectedUploadedFiles;
                                                      _model.uploadedFileUrls =
                                                          downloadUrls;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }
                                              },
                                              text: 'เลือกรูปภาพ',
                                              icon: Icon(
                                                Icons.image,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: StreamBuilder<List<MedInfoRecord>>(
                                  stream: queryMedInfoRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MedInfoRecord>
                                        textFieldMedInfoRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final textFieldMedInfoRecord =
                                        textFieldMedInfoRecordList.isNotEmpty
                                            ? textFieldMedInfoRecordList.first
                                            : null;
                                    return Autocomplete<String>(
                                      initialValue: TextEditingValue(
                                          text: widget.meds!.nameDrug),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return textFieldMedInfoRecord!.data
                                            .where((option) {
                                          final lowercaseOption =
                                              option.toLowerCase();
                                          return lowercaseOption.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) {
                                        return AutocompleteOptionsList(
                                          textFieldKey: _model.textFieldKey1,
                                          textController:
                                              _model.textController2!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textHighlightStyle: TextStyle(),
                                          elevation: 4.0,
                                          optionBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          optionHighlightColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        setState(() =>
                                            _model.textFieldSelectedOption1 =
                                                selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.textFieldFocusNode1 = focusNode;

                                        _model.textController2 =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.textFieldKey1,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: 'ชื่อยา',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 16.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        );
                                      },
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation1']!);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController3,
                                  focusNode: _model.textFieldFocusNode2,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'สรรพคุณ',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          fontSize: 16.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ).animateOnPageLoad(animationsMap[
                                    'textFieldOnPageLoadAnimation2']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        'ชนิดของยา',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue ??=
                                              widget.meds?.typeDrug,
                                        ),
                                        options: ['เม็ด', 'แคปซูล', 'น้ำ'],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue = val),
                                        width: 300.0,
                                        height: 45.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'เลือกชนิดของยา',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 20.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation1']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        'ปริมาณต่อครั้ง',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 160.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                          count: _model.countControllerValue ??=
                                              widget.meds!.dosage,
                                          updateCount: (count) => setState(() =>
                                              _model.countControllerValue =
                                                  count),
                                          stepSize: 1,
                                          minimum: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation2']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 0.0),
                                        child: Text(
                                          'ประเภทการกิน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('ก่อนอาหาร'),
                                            ChipData('หลังอาหาร')
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValue1 =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 25.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue1 != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController1 ??=
                                              FormFieldController<List<String>>(
                                            [widget.meds!.takeDrug],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation1']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 0.0),
                                        child: Text(
                                          'ลักษณะการใช้ยา',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('ทานจนหมด'),
                                            ChipData('เมื่อมีอาการ')
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValue2 =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 20.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue2 != null,
                                          alignment: WrapAlignment.spaceAround,
                                          controller: _model
                                                  .choiceChipsValueController2 ??=
                                              FormFieldController<List<String>>(
                                            [widget.meds!.useDrug],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation2']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 0.0),
                                      child: Text(
                                        'ช่วงเวลา',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .morningValue ??=
                                                          widget.meds!.morning,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .morningValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    'เช้า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.morningValue == true)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final _datePicked1Time =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime((() {
                                                                if ((widget.meds
                                                                            ?.morningTime !=
                                                                        null) &&
                                                                    (_model.datePicked1 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked1;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.morningTime !=
                                                                        null) &&
                                                                    (_model.datePicked1 ==
                                                                        null)) {
                                                                  return widget
                                                                      .meds
                                                                      ?.morningTime;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.morningTime ==
                                                                        null) &&
                                                                    (_model.datePicked1 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked1;
                                                                } else {
                                                                  return getCurrentTimestamp;
                                                                }
                                                              }() ??
                                                              DateTime.now())),
                                                    );
                                                    if (_datePicked1Time !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked1 =
                                                            DateTime(
                                                          (() {
                                                                    if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.morningTime;
                                                                    } else if ((widget.meds?.morningTime ==
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .year,
                                                          (() {
                                                                    if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.morningTime;
                                                                    } else if ((widget.meds?.morningTime ==
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .month,
                                                          (() {
                                                                    if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else if ((widget.meds?.morningTime !=
                                                                            null) &&
                                                                        (_model.datePicked1 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.morningTime;
                                                                    } else if ((widget.meds?.morningTime ==
                                                                            null) &&
                                                                        (_model.datePicked1 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked1;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .day,
                                                          _datePicked1Time.hour,
                                                          _datePicked1Time
                                                              .minute,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.04,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if ((_model.datePicked1 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.morningTime !=
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked1);
                                                            } else if ((_model
                                                                        .datePicked1 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.morningTime ==
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked1);
                                                            } else {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  widget.meds
                                                                      ?.morningTime);
                                                            }
                                                          }(),
                                                          'เลือกเวลา',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 5.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value:
                                                          _model.noonValue ??=
                                                              widget.meds!.noon,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() =>
                                                            _model.noonValue =
                                                                newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    'กลางวัน',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.noonValue == true)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final _datePicked2Time =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime((() {
                                                                if ((widget.meds
                                                                            ?.noonTime !=
                                                                        null) &&
                                                                    (_model.datePicked2 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked2;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.noonTime !=
                                                                        null) &&
                                                                    (_model.datePicked2 ==
                                                                        null)) {
                                                                  return widget
                                                                      .meds
                                                                      ?.noonTime;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.noonTime ==
                                                                        null) &&
                                                                    (_model.datePicked2 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked2;
                                                                } else {
                                                                  return getCurrentTimestamp;
                                                                }
                                                              }() ??
                                                              DateTime.now())),
                                                    );
                                                    if (_datePicked2Time !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked2 =
                                                            DateTime(
                                                          (() {
                                                                    if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.noonTime;
                                                                    } else if ((widget.meds?.noonTime ==
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .year,
                                                          (() {
                                                                    if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.noonTime;
                                                                    } else if ((widget.meds?.noonTime ==
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .month,
                                                          (() {
                                                                    if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else if ((widget.meds?.noonTime !=
                                                                            null) &&
                                                                        (_model.datePicked2 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.noonTime;
                                                                    } else if ((widget.meds?.noonTime ==
                                                                            null) &&
                                                                        (_model.datePicked2 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked2;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .day,
                                                          _datePicked2Time.hour,
                                                          _datePicked2Time
                                                              .minute,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.04,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if ((_model.datePicked2 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.noonTime !=
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked2);
                                                            } else if ((_model
                                                                        .datePicked2 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.noonTime ==
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked2);
                                                            } else {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  widget.meds
                                                                      ?.noonTime);
                                                            }
                                                          }(),
                                                          'เลือกเวลา',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 5.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .eveningValue ??=
                                                          widget.meds!.evening,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .eveningValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    'เย็น',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.eveningValue == true)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final _datePicked3Time =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime((() {
                                                                if ((widget.meds
                                                                            ?.eveningTime !=
                                                                        null) &&
                                                                    (_model.datePicked3 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked3;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.eveningTime !=
                                                                        null) &&
                                                                    (_model.datePicked3 ==
                                                                        null)) {
                                                                  return widget
                                                                      .meds
                                                                      ?.eveningTime;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.eveningTime ==
                                                                        null) &&
                                                                    (_model.datePicked3 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked3;
                                                                } else {
                                                                  return getCurrentTimestamp;
                                                                }
                                                              }() ??
                                                              DateTime.now())),
                                                    );
                                                    if (_datePicked3Time !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked3 =
                                                            DateTime(
                                                          (() {
                                                                    if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.eveningTime;
                                                                    } else if ((widget.meds?.eveningTime ==
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .year,
                                                          (() {
                                                                    if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.eveningTime;
                                                                    } else if ((widget.meds?.eveningTime ==
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .month,
                                                          (() {
                                                                    if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else if ((widget.meds?.eveningTime !=
                                                                            null) &&
                                                                        (_model.datePicked3 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.eveningTime;
                                                                    } else if ((widget.meds?.eveningTime ==
                                                                            null) &&
                                                                        (_model.datePicked3 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked3;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .day,
                                                          _datePicked3Time.hour,
                                                          _datePicked3Time
                                                              .minute,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.04,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if ((_model.datePicked3 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.eveningTime !=
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked3);
                                                            } else if ((_model
                                                                        .datePicked3 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.eveningTime ==
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked3);
                                                            } else {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  widget.meds
                                                                      ?.eveningTime);
                                                            }
                                                          }(),
                                                          'เลือกเวลา',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 5.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .nightValue ??=
                                                          widget.meds!.night,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() =>
                                                            _model.nightValue =
                                                                newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    'ก่อนนอน',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.nightValue == true)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final _datePicked4Time =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime((() {
                                                                if ((widget.meds
                                                                            ?.nightTime !=
                                                                        null) &&
                                                                    (_model.datePicked4 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked4;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.nightTime !=
                                                                        null) &&
                                                                    (_model.datePicked4 ==
                                                                        null)) {
                                                                  return widget
                                                                      .meds
                                                                      ?.nightTime;
                                                                } else if ((widget
                                                                            .meds
                                                                            ?.nightTime ==
                                                                        null) &&
                                                                    (_model.datePicked4 !=
                                                                        null)) {
                                                                  return _model
                                                                      .datePicked4;
                                                                } else {
                                                                  return getCurrentTimestamp;
                                                                }
                                                              }() ??
                                                              DateTime.now())),
                                                    );
                                                    if (_datePicked4Time !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked4 =
                                                            DateTime(
                                                          (() {
                                                                    if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.nightTime;
                                                                    } else if ((widget.meds?.nightTime ==
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .year,
                                                          (() {
                                                                    if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.nightTime;
                                                                    } else if ((widget.meds?.nightTime ==
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .month,
                                                          (() {
                                                                    if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else if ((widget.meds?.nightTime !=
                                                                            null) &&
                                                                        (_model.datePicked4 ==
                                                                            null)) {
                                                                      return widget
                                                                          .meds
                                                                          ?.nightTime;
                                                                    } else if ((widget.meds?.nightTime ==
                                                                            null) &&
                                                                        (_model.datePicked4 !=
                                                                            null)) {
                                                                      return _model
                                                                          .datePicked4;
                                                                    } else {
                                                                      return getCurrentTimestamp;
                                                                    }
                                                                  }() ??
                                                                  DateTime
                                                                      .now())
                                                              .day,
                                                          _datePicked4Time.hour,
                                                          _datePicked4Time
                                                              .minute,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.04,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if ((_model.datePicked4 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.nightTime !=
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked4);
                                                            } else if ((_model
                                                                        .datePicked4 !=
                                                                    null) &&
                                                                (widget.meds
                                                                        ?.nightTime ==
                                                                    null)) {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked4);
                                                            } else {
                                                              return dateTimeFormat(
                                                                  'jm',
                                                                  widget.meds
                                                                      ?.nightTime);
                                                            }
                                                          }(),
                                                          'เลือกเวลา',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation3']!),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 24.0),
                                  child: StreamBuilder<List<AlreadyRecord>>(
                                    stream: queryAlreadyRecord(
                                      parent: currentUserReference,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AlreadyRecord>
                                          buttonAlreadyRecordList =
                                          snapshot.data!;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if (widget.meds?.morningTime !=
                                              null) {
                                            // Action morning
                                            await actions.deleteID(
                                              widget.meds?.id,
                                              functions
                                                  .findDocumentInNotiCollection(
                                                      widget.meds!.morningTime!,
                                                      widget.notiTime!
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList()),
                                            );
                                          }
                                          if (widget.meds?.noonTime != null) {
                                            // Action noon
                                            await actions.deleteID(
                                              widget.meds?.id,
                                              functions
                                                  .findDocumentInNotiCollection(
                                                      widget.meds!.noonTime!,
                                                      widget.notiTime!
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList()),
                                            );
                                          }
                                          if (widget.meds?.eveningTime !=
                                              null) {
                                            // Action evening
                                            await actions.deleteID(
                                              widget.meds?.id,
                                              functions
                                                  .findDocumentInNotiCollection(
                                                      widget.meds!.eveningTime!,
                                                      widget.notiTime!
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList()),
                                            );
                                          }
                                          if (widget.meds?.nightTime != null) {
                                            // Action night
                                            await actions.deleteID(
                                              widget.meds?.id,
                                              functions
                                                  .findDocumentInNotiCollection(
                                                      widget.meds!.nightTime!,
                                                      widget.notiTime!
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList()),
                                            );
                                          }
                                          // medications
                                          await widget.meds!.reference.delete();
                                          await actions.deleteIDAlready(
                                            widget.meds?.id,
                                            buttonAlreadyRecordList
                                                .map((e) => e.reference)
                                                .toList(),
                                          );
                                          context.safePop();
                                        },
                                        text: 'ลบยาออก',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF9F1E1E),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
