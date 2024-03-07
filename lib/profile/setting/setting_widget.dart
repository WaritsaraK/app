import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'setting_model.dart';
export 'setting_model.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget>
    with TickerProviderStateMixin {
  late SettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(115, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'การตั้งค่า',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
            fontFamily: 'Noto Sans Thai',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.light);
                          },
                          child: Container(
                            width: 115,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? FlutterFlowTheme.of(context)
                                  .secondaryBackground
                                  : FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny_rounded,
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    'โหมดสว่าง',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? FlutterFlowTheme.of(context)
                                          .primaryText
                                          : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.dark);
                          },
                          child: Container(
                            width: 115,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? FlutterFlowTheme.of(context)
                                  .secondaryBackground
                                  : FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.nightlight_round,
                                  color: Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    'โหมดมืด',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Theme.of(context).brightness ==
                                          Brightness.dark
                                          ? FlutterFlowTheme.of(context)
                                          .primaryText
                                          : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation']!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue = newValue!);
                      if (newValue!) {
                        await requestPermission(notificationsPermission);
                      }
                    },
                    title: Text(
                      'อนุญาตแจ้งเตือน',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Noto Sans Thai',
                        lineHeight: 2,
                      ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            color: FlutterFlowTheme.of(context).noColor,
                            child: ExpandableNotifier(
                              controller: _model.expandableController1,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Text(
                                    'ศูนย์ช่วยเหลือ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                collapsed: Visibility(
                                  visible: false,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Text(
                                      'เบอร์ติดต่อ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 10, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 5, 0),
                                            child: Icon(
                                              Icons.call,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                              size: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 10, 0),
                                            child: Text(
                                              '1669',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Noto Sans Thai',
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'ป่วยฉุกเฉิน อุบัติเหตุ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 5, 0),
                                            child: Icon(
                                              Icons.call,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                              size: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 10, 0),
                                            child: Text(
                                              '1367',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Noto Sans Thai',
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'สายด่วนศูนย์พิษวิทยารามาฯ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 15)),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            color: FlutterFlowTheme.of(context).noColor,
                            child: ExpandableNotifier(
                              controller: _model.expandableController2,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Text(
                                    'นโยบายความเป็นส่วนตัว',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                collapsed: Visibility(
                                  visible: false,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Text(
                                      'รายละเอียด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 15, 15, 0),
                                  child: RichText(
                                    textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                          'ความสำคัญในการคุ้มครองข้อมูลส่วนบุคคลที่ท่านได้มอบให้แก่ทางแอปพลิเคชันด้วยความไว้วางใจดังนั้นทางแอปพลิเคชันจึงมีระบบในการรักษาความปลอดภัยของข้อมูลและขั้นตอนการดำเนินงานที่รัดกุมอีกทั้งมีมาตรการในการรักษาความปลอดภัยของข้อมูลเพื่อป้องกันการเข้าถึง เปิดเผย นำไปใช้ หรือเปลี่ยนแปลงข้อมูลโดยมิได้รับอนุญาตและเพื่อปฏิบัติให้เป็นไปตาม พระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. 2562 (“พ.ร.บ. คุ้มครองข้อมูลส่วนบุคคลฯ”) กฎหมาย และกฎเกณฑ์ที่เกี่ยวข้อง',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 2,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            color: FlutterFlowTheme.of(context).noColor,
                            child: ExpandableNotifier(
                              controller: _model.expandableController3,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Text(
                                    'ข้อตกลงการใช้บริการ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                collapsed: Visibility(
                                  visible: false,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Text(
                                      'รายละเอียด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 15, 15, 0),
                                  child: RichText(
                                    textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                          'สงวนสิทธิในการปรับปรุงหรือแก้ไขช่องทางการให้บริการหรือเนื้อหาใด ๆ บนแอปพลิเคชันนี้ ในเวลาใด ๆ โดยไม่จำเป็นต้องบอกกล่าวหรือระบุเหตุผลในการดำเนินการนั้น คุณรับรองว่าข้อมูลส่วนบุคคลที่คุณให้แอปพลิเคชันเป็นข้อมูลที่ถูกต้องและเป็นความจริงทุกประการ และคุณมีสิทธิตามกฎหมายที่จะให้ข้อมูลดังกล่าวไว้กับแอปพลิเคชัน โดยแอปพลิเคชันสามารถนำข้อมูลดังกล่าวไปเก็บรวบรวม ใช้ภายใต้ขอบเขตแห่งวัตถุประสงค์ที่กฎหมายอนุญาตไว้ และทางแอปพลิเคชันจะพิจารณาเห็นว่าเป็นการเหมาะสมและเป็นประโยชน์ต่อแอปพลิเคชันและผู้ใช้บริการ',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 2,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].addToEnd(SizedBox(height: 64)),
      ),
    );
  }
}
