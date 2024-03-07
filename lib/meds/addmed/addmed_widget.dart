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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addmed_model.dart';
export 'addmed_model.dart';

class AddmedWidget extends StatefulWidget {
  const AddmedWidget({super.key});

  @override
  State<AddmedWidget> createState() => _AddmedWidgetState();
}

class _AddmedWidgetState extends State<AddmedWidget>
    with TickerProviderStateMixin {
  late AddmedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => AddmedModel());

    _model.idController ??= TextEditingController(
        text: random_data.randomString(
      20,
      20,
      true,
      true,
      true,
    ));
    _model.idFocusNode ??= FocusNode();

    _model.nameDrugController ??= TextEditingController();

    _model.detailController ??= TextEditingController();
    _model.detailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: queryMedicationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (medicationsRecord) => medicationsRecord.where(
          'end',
          isEqualTo: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        int addmedCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (addmedCount >= 1)
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('selectHistory');
                            },
                            text: 'เลือกจากที่เคยบันทึก',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              hoverColor: FlutterFlowTheme.of(context).warning,
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Home');
                            },
                            child: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'เพิ่มรายการยา',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto Sans Thai',
                              fontSize: 30.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.idController,
                                focusNode: _model.idFocusNode,
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.idControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final pic = _model.uploadedFileUrls
                                              .map((e) => e)
                                              .toList();
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  pic.length, (picIndex) {
                                                final picItem = pic[picIndex];
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    picItem,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.15,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 20.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        final selectedMedia = await selectMedia(
                                          mediaSource: MediaSource.photoGallery,
                                          multiImage: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
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
                                    ),
                                  ],
                                ),
                              ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<MedInfoRecord> nameDrugMedInfoRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final nameDrugMedInfoRecord =
                                    nameDrugMedInfoRecordList.isNotEmpty
                                        ? nameDrugMedInfoRecordList.first
                                        : null;
                                return Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return nameDrugMedInfoRecord!.data
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.nameDrugKey,
                                      textController:
                                          _model.nameDrugController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                    setState(() => _model
                                        .nameDrugSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.nameDrugFocusNode = focusNode;

                                    _model.nameDrugController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.nameDrugKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: 'ชื่อยา',
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
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                          .nameDrugControllerValidator
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
                              controller: _model.detailController,
                              focusNode: _model.detailFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'สรรพคุณ',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 16.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.detailControllerValidator
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
                                        _model.typeDrugValueController ??=
                                            FormFieldController<String>(
                                      _model.typeDrugValue ??= 'เม็ด',
                                    ),
                                    options: ['เม็ด', 'แคปซูล', 'น้ำ'],
                                    onChanged: (val) => setState(
                                        () => _model.typeDrugValue = val),
                                    width: 300.0,
                                    height: 45.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
                                        FlutterFlowTheme.of(context).alternate,
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
                                      borderRadius: BorderRadius.circular(20.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
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
                                      count: _model.dosageValue ??= 1,
                                      updateCount: (count) => setState(
                                          () => _model.dosageValue = count),
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
                                  alignment: AlignmentDirectional(-1.0, -1.0),
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
                                  alignment: AlignmentDirectional(-1.0, 1.0),
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 25.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController1 ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: false,
                                    ),
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
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
                                  alignment: AlignmentDirectional(-1.0, 1.0),
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 20.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.spaceAround,
                                      controller:
                                          _model.choiceChipsValueController2 ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: false,
                                    ),
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation2']!),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model.morningValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.morningValue =
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked1Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay
                                                      .fromDateTime(((dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked1) !=
                                                                      null &&
                                                                  dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked1) !=
                                                                      ''
                                                              ? _model
                                                                  .datePicked1
                                                              : getCurrentTimestamp) ??
                                                          DateTime.now())),
                                                );
                                                if (_datePicked1Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked1 =
                                                        DateTime(
                                                      ((dateTimeFormat('jm', _model.datePicked1) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked1) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked1
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .year,
                                                      ((dateTimeFormat('jm', _model.datePicked1) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked1) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked1
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .month,
                                                      ((dateTimeFormat('jm', _model.datePicked1) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked1) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked1
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .day,
                                                      _datePicked1Time.hour,
                                                      _datePicked1Time.minute,
                                                    );
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 150.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      dateTimeFormat('jm',
                                                          _model.datePicked1),
                                                      'เลือกเวลา',
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model.noonValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                        .noonValue = newValue!);
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked2Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay
                                                      .fromDateTime(((dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked2) !=
                                                                      null &&
                                                                  dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked2) !=
                                                                      ''
                                                              ? _model
                                                                  .datePicked2
                                                              : getCurrentTimestamp) ??
                                                          DateTime.now())),
                                                );
                                                if (_datePicked2Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked2 =
                                                        DateTime(
                                                      ((dateTimeFormat('jm', _model.datePicked2) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked2) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked2
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .year,
                                                      ((dateTimeFormat('jm', _model.datePicked2) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked2) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked2
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .month,
                                                      ((dateTimeFormat('jm', _model.datePicked2) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked2) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked2
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .day,
                                                      _datePicked2Time.hour,
                                                      _datePicked2Time.minute,
                                                    );
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 150.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      dateTimeFormat('jm',
                                                          _model.datePicked2),
                                                      'เลือกเวลา',
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model.eveningValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.eveningValue =
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked3Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay
                                                      .fromDateTime(((dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked3) !=
                                                                      null &&
                                                                  dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked3) !=
                                                                      ''
                                                              ? _model
                                                                  .datePicked3
                                                              : getCurrentTimestamp) ??
                                                          DateTime.now())),
                                                );
                                                if (_datePicked3Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked3 =
                                                        DateTime(
                                                      ((dateTimeFormat('jm', _model.datePicked3) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked3) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked3
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .year,
                                                      ((dateTimeFormat('jm', _model.datePicked3) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked3) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked3
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .month,
                                                      ((dateTimeFormat('jm', _model.datePicked3) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked3) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked3
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .day,
                                                      _datePicked3Time.hour,
                                                      _datePicked3Time.minute,
                                                    );
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 150.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      dateTimeFormat('jm',
                                                          _model.datePicked3),
                                                      'เลือกเวลา',
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model.nightValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked4Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay
                                                      .fromDateTime(((dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked4) !=
                                                                      null &&
                                                                  dateTimeFormat(
                                                                          'jm',
                                                                          _model
                                                                              .datePicked4) !=
                                                                      ''
                                                              ? _model
                                                                  .datePicked4
                                                              : getCurrentTimestamp) ??
                                                          DateTime.now())),
                                                );
                                                if (_datePicked4Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked4 =
                                                        DateTime(
                                                      ((dateTimeFormat('jm', _model.datePicked4) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked4) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked4
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .year,
                                                      ((dateTimeFormat('jm', _model.datePicked4) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked4) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked4
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .month,
                                                      ((dateTimeFormat('jm', _model.datePicked4) !=
                                                                          null &&
                                                                      dateTimeFormat(
                                                                              'jm',
                                                                              _model
                                                                                  .datePicked4) !=
                                                                          ''
                                                                  ? _model
                                                                      .datePicked4
                                                                  : getCurrentTimestamp) ??
                                                              DateTime.now())
                                                          .day,
                                                      _datePicked4Time.hour,
                                                      _datePicked4Time.minute,
                                                    );
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 150.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      dateTimeFormat('jm',
                                                          _model.datePicked4),
                                                      'เลือกเวลา',
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation3']!),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('Home');
                                  },
                                  text: 'ยกเลิก',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<NotiRecord> buttonNotiRecordList =
                                        snapshot.data!;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await MedicationsRecord.createDoc(
                                          currentUserReference!,
                                          id: valueOrDefault<String>(
                                            _model.idController.text,
                                            '-',
                                          ),
                                        ).set({
                                          ...createMedicationsRecordData(
                                            user: currentUserReference,
                                            nameDrug:
                                                _model.nameDrugController.text,
                                            detailDrug:
                                                _model.detailController.text,
                                            typeDrug: _model.typeDrugValue,
                                            dosage: _model.dosageValue,
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
                                            id: _model.idController.text,
                                            end: false,
                                            endTime: null,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'uploadtime':
                                                  FieldValue.serverTimestamp(),
                                              'image_drug': _model
                                                  .uploadedFileUrls
                                                  .map((e) => e)
                                                  .toList(),
                                            },
                                          ),
                                        });
                                        if (_model.datePicked1 != null) {
                                          if (functions
                                              .checkDocumentInNotiCollection(
                                                  _model.datePicked1!,
                                                  buttonNotiRecordList
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
                                                  'id': FieldValue.arrayUnion([
                                                    _model.idController.text
                                                  ]),
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
                                                  'id': [
                                                    _model.idController.text
                                                  ],
                                                },
                                              ),
                                            });
                                          }
                                        }
                                        if (_model.datePicked2 != null) {
                                          if (functions
                                              .checkDocumentInNotiCollection(
                                                  _model.datePicked2!,
                                                  buttonNotiRecordList
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
                                                  'id': FieldValue.arrayUnion([
                                                    _model.idController.text
                                                  ]),
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
                                                  'id': [
                                                    _model.idController.text
                                                  ],
                                                },
                                              ),
                                            });
                                          }
                                        }
                                        if (_model.datePicked3 != null) {
                                          if (functions
                                              .checkDocumentInNotiCollection(
                                                  _model.datePicked3!,
                                                  buttonNotiRecordList
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
                                                  'id': FieldValue.arrayUnion([
                                                    _model.idController.text
                                                  ]),
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
                                                  'id': [
                                                    _model.idController.text
                                                  ],
                                                },
                                              ),
                                            });
                                          }
                                        }
                                        if (_model.datePicked4 != null) {
                                          if (functions
                                              .checkDocumentInNotiCollection(
                                                  _model.datePicked4!,
                                                  buttonNotiRecordList
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
                                                  'id': FieldValue.arrayUnion([
                                                    _model.idController.text
                                                  ]),
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
                                                  'id': [
                                                    _model.idController.text
                                                  ],
                                                },
                                              ),
                                            });
                                          }
                                        }
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'บันทึกรายการยาเรียบร้อย'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text(
                                                              'เพิ่มรายการยาใหม่'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'กลับหน้าหลัก'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          context.pushNamed('Home');
                                        } else {
                                          context.pushNamed('Addmed');
                                        }
                                      },
                                      text: 'บันทึก',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
