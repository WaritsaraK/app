import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/photo/photo_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.usernameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.usernameFocusNode ??= FocusNode();

    _model.phoneController ??= TextEditingController(text: currentPhoneNumber);
    _model.phoneFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'แก้ไขข้อมูลส่วนตัว',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
            fontFamily: 'Noto Sans Thai',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                          context: context,
                          imageQuality: 80,
                          allowPhoto: true,
                          backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                          textColor: FlutterFlowTheme.of(context).primaryText,
                          pickerFontFamily: 'Outfit',
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                    (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto == null ||
                                            currentUserPhoto == ''
                                            ? 'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'
                                            : currentUserPhoto,
                                        'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg',
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 1),
                              child: FlutterFlowIconButton(
                                borderColor:
                                FlutterFlowTheme.of(context).alternate,
                                borderRadius: 20,
                                borderWidth: 1,
                                buttonSize: 30,
                                fillColor:
                                FlutterFlowTheme.of(context).alternate,
                                icon: Icon(
                                  Icons.mode_edit_outline_rounded,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 14,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                        MediaQuery.viewInsetsOf(context),
                                        child: PhotoWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.usernameController,
                    focusNode: _model.usernameFocusNode,
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: currentUserDisplayName,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                    _model.usernameControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.phoneController,
                    focusNode: _model.phoneFocusNode,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: valueOrDefault<String>(
                        currentPhoneNumber,
                        'Phone number',
                      ),
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                    _model.phoneControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
                      context: context,
                      initialDate: ((currentUserDocument?.birthday != null
                          ? currentUserDocument?.birthday
                          : getCurrentTimestamp) ??
                          DateTime.now()),
                      firstDate: DateTime(1900),
                      lastDate: ((currentUserDocument?.birthday != null
                          ? currentUserDocument?.birthday
                          : getCurrentTimestamp) ??
                          DateTime.now()),
                    );

                    if (_datePickedDate != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                        );
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        child: Stack(
                          children: [
                            if (_model.datePicked == null)
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDocument?.birthday != null
                                      ? dateTimeFormat('d/M/y',
                                      currentUserDocument!.birthday!)
                                      : 'Birthday',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: currentUserDocument?.birthday !=
                                        null
                                        ? FlutterFlowTheme.of(context)
                                        .primaryText
                                        : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ),
                            if (_model.datePicked != null)
                              Text(
                                dateTimeFormat('d/M/y', _model.datePicked),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          'เพศ',
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto Sans Thai',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FlutterFlowChoiceChips(
                            options: [
                              ChipData('ชาย', Icons.male),
                              ChipData('หญิง', Icons.female)
                            ],
                            onChanged: (val) => setState(() =>
                            _model.choiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Noto Sans Thai',
                                color: FlutterFlowTheme.of(context)
                                    .primaryText,
                              ),
                              iconColor:
                              FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18,
                              elevation: 4,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Noto Sans Thai',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                              ),
                              iconColor:
                              FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            chipSpacing: 12,
                            rowSpacing: 12,
                            multiselect: false,
                            initialized: _model.choiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.choiceChipsValueController ??=
                                FormFieldController<List<String>>(
                                  [valueOrDefault(currentUserDocument?.sex, '')],
                                ),
                            wrapped: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.update(createUsersRecordData(
                        displayName: _model.usernameController.text,
                        birthday: _model.datePicked,
                        phoneNumber: _model.phoneController.text,
                        sex: _model.choiceChipsValue,
                      ));
                      context.safePop();
                    },
                    text: 'บันทึก',
                    options: FFButtonOptions(
                      width: 270,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        color: Colors.white,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
