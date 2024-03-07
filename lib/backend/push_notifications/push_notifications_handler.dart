import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/MED_health.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SignUp': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'Home': ParameterData.none(),
  'Profile': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'newsall': ParameterData.none(),
  'History': (data) async => ParameterData(
        allParams: {
          'month': getParameter<String>(data, 'month'),
        },
      ),
  'Currentmed': ParameterData.none(),
  'onboarding1': ParameterData.none(),
  'onboarding2': ParameterData.none(),
  'onboarding3': ParameterData.none(),
  'onboarding4': ParameterData.none(),
  'EditMed': (data) async => ParameterData(
        allParams: {
          'meds': await getDocumentParameter<MedicationsRecord>(
              data, 'meds', MedicationsRecord.fromSnapshot),
        },
      ),
  'seephoto': ParameterData.none(),
  'forgot': ParameterData.none(),
  'notifications': ParameterData.none(),
  'Addmed': ParameterData.none(),
  'DetailsDisease': ParameterData.none(),
  'seeInformatiion': ParameterData.none(),
  'DrugAllergy': ParameterData.none(),
  'detailshealth': ParameterData.none(),
  'setting': ParameterData.none(),
  'readNotifications': (data) async => ParameterData(
        allParams: {
          'alert': getParameter<DateTime>(data, 'alert'),
          'already': await getDocumentParameter<AlreadyRecord>(
              data, 'already', AlreadyRecord.fromSnapshot),
        },
      ),
  'AddmedAgain': (data) async => ParameterData(
        allParams: {
          'medSelect': await getDocumentParameter<MedicationsRecord>(
              data, 'medSelect', MedicationsRecord.fromSnapshot),
        },
      ),
  'selectHistory': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
