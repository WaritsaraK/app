// Automatic FlutterFlow imports
import 'package:popup/index.dart';
import 'package:rxdart/rxdart.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Notifications {
  Future<void> notification(List<String> idList, int id) async {

    // ดำเนินการตามต้องการด้วยรายการ ID ที่ได้รับ
    print('ID List: $idList');

    // ดึงข้อมูลผู้ใช้ปัจจุบัน
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
    // ดึงข้อมูล Firestore และเรียกใช้เมทอด collection สำหรับ subcollection 'medications'
      final medCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .collection('medications');

      // Declare variable to store drug names
      String title = 'ถึงเวลาแล้ว อย่าลืมกินยา!!';
      String content = '';

      // Loop through idList
      for (String id in idList) {
        // Get medication document from Firestore using id
        DocumentSnapshot medicationDoc = await medCollection.doc(id).get();

        // Check if medication document exists
        if (medicationDoc.exists) {
          // Get the name_drug field from medication document
          String drugName = medicationDoc.get('name_drug');

          // Append drug name to content
          content += drugName + '\n';
        }
      }

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

      final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: null,
        macOS: null,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: null,
        macOS: null,
      );

      // Schedule the notification
      // ตรวจสอบว่ามีจำนวนข้อมูลใน idList มากกว่า 1 รายการ
      if (idList.length > 1) {
        content = 'มียามากกว่า 1 ตัว';
      }
      await flutterLocalNotificationsPlugin.show(
        id, title, content, notificationDetails, payload: 'item x',
      );

      // บันทึกที่แจ้งเตือนแล้ว to 'already' collection
      final alreadyCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .collection('already');

      final Map<String, dynamic> data = {
        'IDsmed': idList,
        'time': DateTime.now(),
        'confirm' : false,
      };
      await alreadyCollection.add(data);
    }
  }
}
