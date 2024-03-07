// Automatic FlutterFlow imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:popup/custom_code/actions/notifications.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future callNotifications() async {
  DateTime currentTime = DateTime.now();
  String formattedTime = DateFormat('HHmm').format(currentTime);

  // ดึงข้อมูลผู้ใช้ปัจจุบัน
  final currentUser = FirebaseAuth.instance.currentUser;
  // print('currentUser : $currentUser');
  // print('time : $formattedTime');

  //ตรวจสอบว่ามีผู้ใช้ปัจจุบันหรือไม่
  if (currentUser != null) {
    // ดึงข้อมูล Firestore และเรียกใช้เมทอด collection สำหรับ subcollection 'noti'
    final notiCollection = FirebaseFirestore.instance.collection('users').doc(currentUser.uid).collection('noti');

    // คิวรี่เอกสารใน subcollection 'noti'
    final querySnapshot = await notiCollection.get();

    // วนลูปผ่านเอกสารใน querySnapshot
    for (final documentSnapshot in querySnapshot.docs) {
      final id = documentSnapshot.reference;

      // พิมพ์เวลาที่จัดรูปแบบและ id ปัจจุบันสำหรับการดีบั๊ก
      print('formattedTime: $formattedTime, id: ${id.id}');

      // ตรวจสอบว่าเวลาที่จัดรูปแบบตรงกับ id หรือไม่
      if (formattedTime == id.id) {
        // เข้าถึงข้อมูลการแจ้งเตือนและทำบางสิ่ง
        final notificationData = documentSnapshot.data();
        final List<String> idList = notificationData['id'].cast<String>(); // ดึงค่ารายการ ID ออกมา

        //ถ้ามีรายการยาที่ต้องทำการแจ้งเตือน
        if (idList.isNotEmpty) {
          print('Notification Data: $notificationData');

          SharedPreferences prefs = await SharedPreferences.getInstance();
          int idNoti = prefs.getInt('idNoti') ??
              0; // อ่านค่า id จาก SharedPreferences หากไม่พบค่าให้ใช้ค่าเริ่มต้นเป็น 0
          idNoti++;
          await prefs.setInt('idNoti', idNoti); // บันทึกค่า id ล่าสุดลงใน SharedPreferences
          print('id : $idNoti');

          await Notifications().notification(idList, idNoti);

        }
      }
    }
  }
}

