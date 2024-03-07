import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'read_notifications_model.dart';
export 'read_notifications_model.dart';

class ReadNotificationsWidget extends StatefulWidget {
  const ReadNotificationsWidget({
    super.key,
    required this.medDetail,
    required this.alert,
    required this.already,
  });

  final List<MedicationsRecord>? medDetail;
  final DateTime? alert;
  final AlreadyRecord? already;

  @override
  State<ReadNotificationsWidget> createState() =>
      _ReadNotificationsWidgetState();
}

class _ReadNotificationsWidgetState extends State<ReadNotificationsWidget> {
  late ReadNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadNotificationsModel());
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
        backgroundColor: Color(0xFFFEFEFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFEFEFE),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'ถึงเวลาแล้ว อย่าลืมกินยา',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.clock,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Text(
                            functions.timeagos(widget.alert!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Noto Sans Thai',
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 5)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Text(
                            'รายการยาของคุณ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Noto Sans Thai',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Stack(
                          children: [
                            if (widget.already?.confirm == false)
                              FFButtonWidget(
                                onPressed: () async {
                                  await widget.already!.reference
                                      .update(createAlreadyRecordData(
                                    confirm: true,
                                  ));
                                },
                                text: 'ยังไม่ได้กินยา',
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 35,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            if (widget.already?.confirm == true)
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'กินแล้ว',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.no_food_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 26,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 0, 0),
                                  child: Text(
                                    'ก่อนอาหาร',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.medDetail
                            ?.where((e) => e.takeDrug == 'ก่อนอาหาร')
                            .toList()
                            ?.length ==
                            0)
                          Opacity(
                            opacity: 0.5,
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.block,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 60,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final before = widget.medDetail!
                                  .map((e) => e)
                                  .toList()
                                  .where((e) => e.takeDrug == 'ก่อนอาหาร')
                                  .toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                List.generate(before.length, (beforeIndex) {
                                  final beforeItem = before[beforeIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              beforeItem.nameDrug,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Noto Sans Thai',
                                                fontSize: 16,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (beforeItem.takeDrug !=
                                                    null &&
                                                    beforeItem.takeDrug != '')
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 5, 0),
                                                    child: Text(
                                                      beforeItem.takeDrug,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Noto Sans Thai',
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    beforeItem.dosage
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'Noto Sans Thai',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  beforeItem.typeDrug,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Noto Sans Thai',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (beforeItem.useDrug != null &&
                                                beforeItem.useDrug != '')
                                              Text(
                                                beforeItem.useDrug,
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Noto Sans Thai',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .error,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            if (beforeItem.imageDrug.length >=
                                                1)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final picBefore =
                                                        beforeItem.imageDrug
                                                            .map((e) => e)
                                                            .toList();
                                                        return GridView.builder(
                                                          padding:
                                                          EdgeInsets.zero,
                                                          gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio:
                                                            1.5,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                          Axis.vertical,
                                                          itemCount:
                                                          picBefore.length,
                                                          itemBuilder: (context,
                                                              picBeforeIndex) {
                                                            final picBeforeItem =
                                                            picBefore[
                                                            picBeforeIndex];
                                                            return ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8),
                                                              child:
                                                              Image.network(
                                                                picBeforeItem,
                                                                width: 300,
                                                                height: 200,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 5)),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fastfood_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 26,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 0, 0),
                                  child: Text(
                                    'หลังอาหาร',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.medDetail
                            ?.where((e) => e.takeDrug == 'หลังอาหาร')
                            .toList()
                            ?.length ==
                            0)
                          Opacity(
                            opacity: 0.5,
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.block,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 60,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final after = widget.medDetail!
                                  .map((e) => e)
                                  .toList()
                                  .where((e) => e.takeDrug == 'หลังอาหาร')
                                  .toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                List.generate(after.length, (afterIndex) {
                                  final afterItem = after[afterIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              afterItem.nameDrug,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Noto Sans Thai',
                                                fontSize: 16,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (afterItem.takeDrug !=
                                                    null &&
                                                    afterItem.takeDrug != '')
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 5, 0),
                                                    child: Text(
                                                      afterItem.takeDrug,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Noto Sans Thai',
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    afterItem.dosage.toString(),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'Noto Sans Thai',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  afterItem.typeDrug,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Noto Sans Thai',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (afterItem.useDrug != null &&
                                                afterItem.useDrug != '')
                                              Text(
                                                afterItem.useDrug,
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Noto Sans Thai',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .primary,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            if (afterItem.imageDrug.length >= 1)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final picAfter =
                                                        afterItem.imageDrug
                                                            .map((e) => e)
                                                            .toList();
                                                        return GridView.builder(
                                                          padding:
                                                          EdgeInsets.zero,
                                                          gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio:
                                                            1.5,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                          Axis.vertical,
                                                          itemCount:
                                                          picAfter.length,
                                                          itemBuilder: (context,
                                                              picAfterIndex) {
                                                            final picAfterItem =
                                                            picAfter[
                                                            picAfterIndex];
                                                            return ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8),
                                                              child:
                                                              Image.network(
                                                                picAfterItem,
                                                                width: 300,
                                                                height: 200,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 5)),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
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
        ),
      ),
    );
  }
}
