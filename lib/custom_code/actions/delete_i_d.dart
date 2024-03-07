// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future deleteID(String? med, DocumentReference? notiTime) async {
  // ตรวจสอบว่า notiTime และ notiTime ไม่เป็น null ก่อนเรียกใช้งาน
  if (notiTime != null) {
    // ดึงข้อมูลผู้ใช้ปัจจุบัน
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // ดึงข้อมูลจาก Firestore
      final notiSnapshot = await notiTime.get();
      final notiData = notiSnapshot.data() as Map<String, dynamic>?;

      // ตรวจสอบว่า noti มีข้อมูลและ id ซึ่งเป็น array อยู่ใน noti หรือไม่
      if (notiData != null && notiData.containsKey('id')) {
        final idList = notiData['id'] as List<dynamic>;

        // ตรวจสอบว่า idList มี med อยู่ในรายการหรือไม่
        if (idList.contains(med)) {
          // ลบ med ออกจาก idList
          idList.remove(med);

          // อัพเดทข้อมูลใน Firestore
          await notiTime.update({'id': idList});
        }
      }
    }
  }
}
