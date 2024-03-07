import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
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
          begin: Offset(70.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'containerOnPageLoadAnimation6': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Profile',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).customColor1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.network(
                                    currentUserPhoto == null ||
                                            currentUserPhoto == ''
                                        ? 'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'
                                        : currentUserPhoto,
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              'BMI',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: StreamBuilder<
                                                List<HealthsRecord>>(
                                              stream: queryHealthsRecord(
                                                parent: currentUserReference,
                                                queryBuilder: (healthsRecord) =>
                                                    healthsRecord
                                                        .where(
                                                          'DateRecorded',
                                                          isGreaterThanOrEqualTo:
                                                              functions
                                                                  .calculateToday()
                                                                  ?.start,
                                                        )
                                                        .where(
                                                          'DateRecorded',
                                                          isLessThanOrEqualTo:
                                                              functions
                                                                  .calculateToday()
                                                                  ?.end,
                                                        )
                                                        .where(
                                                          'DateRecorded',
                                                          isNotEqualTo: null,
                                                        ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<HealthsRecord>
                                                    textHealthsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final textHealthsRecord =
                                                    textHealthsRecordList
                                                            .isNotEmpty
                                                        ? textHealthsRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  valueOrDefault<String>(
                                                    (textHealthsRecord
                                                                    ?.weight ==
                                                                null) ||
                                                            (textHealthsRecord
                                                                    ?.height ==
                                                                null)
                                                        ? '-'
                                                        : (((textHealthsRecord
                                                                            ?.weight !=
                                                                        null) &&
                                                                    (textHealthsRecord!
                                                                            .weight >
                                                                        0.0)) &&
                                                                ((textHealthsRecord
                                                                            ?.height !=
                                                                        null) &&
                                                                    (textHealthsRecord!
                                                                            .height >
                                                                        0.0))
                                                            ? valueOrDefault<
                                                                String>(
                                                                functions.bmiCriteria(
                                                                    textHealthsRecord!
                                                                        .weight,
                                                                    textHealthsRecord!
                                                                        .height),
                                                                '-',
                                                              )
                                                            : '-'),
                                                    '-',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: () {
                                                              if (functions.bmiCriteria(
                                                                      textHealthsRecord!
                                                                          .weight,
                                                                      textHealthsRecord!
                                                                          .height) ==
                                                                  'น้ำหนักต่ำกว่าเกณฑ์') {
                                                                return Color(
                                                                    0xFF4B8EFF);
                                                              } else if (functions.bmiCriteria(
                                                                      textHealthsRecord!
                                                                          .weight,
                                                                      textHealthsRecord!
                                                                          .height) ==
                                                                  'สมส่วน') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1;
                                                              } else if (functions.bmiCriteria(
                                                                      textHealthsRecord!
                                                                          .weight,
                                                                      textHealthsRecord!
                                                                          .height) ==
                                                                  'น้ำหนักเกิน') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else if (functions.bmiCriteria(
                                                                      textHealthsRecord!
                                                                          .weight,
                                                                      textHealthsRecord!
                                                                          .height) ==
                                                                  'โรคอ้วน') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else if ((functions.bmiCriteria(
                                                                          textHealthsRecord!
                                                                              .weight,
                                                                          textHealthsRecord!
                                                                              .height) ==
                                                                      'โรคอ้วนอันตราย') &&
                                                                  (textHealthsRecord!
                                                                          .weight >
                                                                      0.0) &&
                                                                  (textHealthsRecord!
                                                                          .height >
                                                                      0.0)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              }
                                                            }(),
                                                            fontSize: 18.0,
                                                          ),
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 12.0),
                            child: Container(
                              width: 160.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x34090F13),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Currentmed');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 115.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 36.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x98FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.medication,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'รายการยาปัจจุบัน',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.white,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 16.0, 12.0),
                            child: Container(
                              width: 160.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x34090F13),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('History');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 115.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 36.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x98FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.history_rounded,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'ประวัติการใช้ยา',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.white,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 16.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('detailshealth');
                              },
                              child: Container(
                                width: 160.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x34090F13),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 115.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFED1393),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 36.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x98FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.monitor_heart,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'บันทึกสุขภาพ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: Colors.white,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'รายการแจ้งเตือนยาถัดไป',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    fontSize: 22.0,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: StreamBuilder<List<NotiRecord>>(
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
                                  List<NotiRecord> containerNotiRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: Color(0x1B090F13),
                                          offset: Offset(0.0, -2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              unselectedLabelStyle: TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              indicatorWeight: 2.0,
                                              tabs: [
                                                Tab(
                                                  text: 'ยืนยันกินยา',
                                                ),
                                                Tab(
                                                  text: 'รอแจ้งเตือน',
                                                ),
                                                Tab(
                                                  text: 'เสร็จสิ้น',
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: StreamBuilder<
                                                      List<AlreadyRecord>>(
                                                    stream: queryAlreadyRecord(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (alreadyRecord) =>
                                                              alreadyRecord
                                                                  .where(
                                                                    'time',
                                                                    isGreaterThanOrEqualTo:
                                                                        functions
                                                                            .calculateToday()
                                                                            ?.start,
                                                                  )
                                                                  .where(
                                                                    'time',
                                                                    isLessThanOrEqualTo:
                                                                        functions
                                                                            .calculateToday()
                                                                            ?.end,
                                                                  )
                                                                  .where(
                                                                    'confirm',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'time'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AlreadyRecord>
                                                          todayAlreadyRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            todayAlreadyRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            todayIndex) {
                                                          final todayAlreadyRecord =
                                                              todayAlreadyRecordList[
                                                                  todayIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        MedicationsRecord>>(
                                                                  stream:
                                                                      queryMedicationsRecord(
                                                                    parent:
                                                                        currentUserReference,
                                                                    queryBuilder: (medicationsRecord) =>
                                                                        medicationsRecord.whereIn(
                                                                            'id',
                                                                            todayAlreadyRecord.iDsmed),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<MedicationsRecord>
                                                                        containerMedicationsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final drug = containerMedicationsRecordList.map((e) => e).toList();
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: List.generate(drug.length, (drugIndex) {
                                                                                    final drugItem = drug[drugIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.play_arrow_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  drugItem.nameDrug,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  if (containerMedicationsRecordList.first.takeDrug != null && containerMedicationsRecordList.first.takeDrug != '')
                                                                                                    Text(
                                                                                                      drugItem.takeDrug,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      () {
                                                                                                        if (dateTimeFormat('Hm', todayAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.morningTime)) {
                                                                                                          return 'เช้า';
                                                                                                        } else if (dateTimeFormat('Hm', todayAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.noonTime)) {
                                                                                                          return 'กลางวัน';
                                                                                                        } else if (dateTimeFormat('Hm', todayAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.eveningTime)) {
                                                                                                          return 'เย็น';
                                                                                                        } else if (dateTimeFormat('Hm', todayAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.nightTime)) {
                                                                                                          return 'ก่อนนอน';
                                                                                                        } else {
                                                                                                          return '-';
                                                                                                        }
                                                                                                      }(),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    drugItem.dosage.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    drugItem.typeDrug,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }).divide(SizedBox(height: 10.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Divider(
                                                                              height: 24.0,
                                                                              thickness: 1.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.solidClock,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat('Hm', todayAlreadyRecord.time!),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await todayAlreadyRecord.reference.update(createAlreadyRecordData(
                                                                                      confirm: true,
                                                                                    ));
                                                                                  },
                                                                                  text: 'ยังไม่ได้กินยา',
                                                                                  options: FFButtonOptions(
                                                                                    width: 120.0,
                                                                                    height: 35.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          color: Colors.white,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation4']!);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final medToday =
                                                          containerNotiRecordList
                                                              .map((e) => e)
                                                              .toList()
                                                              .where((e) =>
                                                                  (e.id.length >=
                                                                      1) &&
                                                                  functions
                                                                      .filterTime(
                                                                          e.reference))
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            medToday.length,
                                                        itemBuilder: (context,
                                                            medTodayIndex) {
                                                          final medTodayItem =
                                                              medToday[
                                                                  medTodayIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        MedicationsRecord>>(
                                                                  stream:
                                                                      queryMedicationsRecord(
                                                                    parent:
                                                                        currentUserReference,
                                                                    queryBuilder: (medicationsRecord) =>
                                                                        medicationsRecord.whereIn(
                                                                            'id',
                                                                            medTodayItem.id),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<MedicationsRecord>
                                                                        containerMedicationsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final meds = containerMedicationsRecordList.map((e) => e).toList();
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: List.generate(meds.length, (medsIndex) {
                                                                                    final medsItem = meds[medsIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.play_arrow_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  medsItem.nameDrug,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  if (containerMedicationsRecordList.first.takeDrug != null && containerMedicationsRecordList.first.takeDrug != '')
                                                                                                    Text(
                                                                                                      medsItem.takeDrug,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      () {
                                                                                                        if (dateTimeFormat('Hm', medTodayItem.time) == dateTimeFormat('Hm', medsItem.morningTime)) {
                                                                                                          return 'เช้า';
                                                                                                        } else if (dateTimeFormat('Hm', medTodayItem.time) == dateTimeFormat('Hm', medsItem.noonTime)) {
                                                                                                          return 'กลางวัน';
                                                                                                        } else if (dateTimeFormat('Hm', medTodayItem.time) == dateTimeFormat('Hm', medsItem.eveningTime)) {
                                                                                                          return 'เย็น';
                                                                                                        } else if (dateTimeFormat('Hm', medTodayItem.time) == dateTimeFormat('Hm', medsItem.nightTime)) {
                                                                                                          return 'ก่อนนอน';
                                                                                                        } else {
                                                                                                          return '-';
                                                                                                        }
                                                                                                      }(),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    medsItem.dosage.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    medsItem.typeDrug,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Divider(
                                                                              height: 24.0,
                                                                              thickness: 1.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 35.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(32.0),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.solidClock,
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              dateTimeFormat('Hm', medTodayItem.time!),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation5']!);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: StreamBuilder<
                                                      List<AlreadyRecord>>(
                                                    stream: queryAlreadyRecord(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (alreadyRecord) =>
                                                              alreadyRecord
                                                                  .where(
                                                                    'time',
                                                                    isGreaterThanOrEqualTo:
                                                                        functions
                                                                            .calculateToday()
                                                                            ?.start,
                                                                  )
                                                                  .where(
                                                                    'time',
                                                                    isLessThanOrEqualTo:
                                                                        functions
                                                                            .calculateToday()
                                                                            ?.end,
                                                                  )
                                                                  .where(
                                                                    'confirm',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'time'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AlreadyRecord>
                                                          completedAlreadyRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            completedAlreadyRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            completedIndex) {
                                                          final completedAlreadyRecord =
                                                              completedAlreadyRecordList[
                                                                  completedIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (completedAlreadyRecord
                                                                      .iDsmed
                                                                      .length !=
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          MedicationsRecord>>(
                                                                    stream:
                                                                        queryMedicationsRecord(
                                                                      parent:
                                                                          currentUserReference,
                                                                      queryBuilder: (medicationsRecord) => medicationsRecord.whereIn(
                                                                          'id',
                                                                          completedAlreadyRecord
                                                                              .iDsmed),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<MedicationsRecord>
                                                                          containerMedicationsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final drug = containerMedicationsRecordList.map((e) => e).toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: List.generate(drug.length, (drugIndex) {
                                                                                      final drugItem = drug[drugIndex];
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Icon(
                                                                                                      Icons.play_arrow_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).customColor1,
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    drugItem.nameDrug,
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 16.0,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    if (containerMedicationsRecordList.first.takeDrug != null && containerMedicationsRecordList.first.takeDrug != '')
                                                                                                      Text(
                                                                                                        drugItem.takeDrug,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto Sans Thai',
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.w300,
                                                                                                            ),
                                                                                                      ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        () {
                                                                                                          if (dateTimeFormat('Hm', completedAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.morningTime)) {
                                                                                                            return 'เช้า';
                                                                                                          } else if (dateTimeFormat('Hm', completedAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.noonTime)) {
                                                                                                            return 'กลางวัน';
                                                                                                          } else if (dateTimeFormat('Hm', completedAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.eveningTime)) {
                                                                                                            return 'เย็น';
                                                                                                          } else if (dateTimeFormat('Hm', completedAlreadyRecord.time) == dateTimeFormat('Hm', containerMedicationsRecordList.first.nightTime)) {
                                                                                                            return 'ก่อนนอน';
                                                                                                          } else {
                                                                                                            return '-';
                                                                                                          }
                                                                                                        }(),
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      drugItem.dosage.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      drugItem.typeDrug,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    }).divide(SizedBox(height: 10.0)),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Divider(
                                                                                height: 24.0,
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  FaIcon(
                                                                                    FontAwesomeIcons.solidClock,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        dateTimeFormat('Hm', completedAlreadyRecord.time!),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Noto Sans Thai',
                                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 120.0,
                                                                                      height: 35.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).customColor1,
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).customColor1,
                                                                                        ),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          'กินแล้ว',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: 16.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation6']!);
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
          ),
        ),
      ),
    );
  }
}
