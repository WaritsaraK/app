import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int calculateAge(DateTime dateToCheck) {
  final now = DateTime.now();
  int age = now.year - dateToCheck.year;

  if (now.month < dateToCheck.month ||
      (now.month == dateToCheck.month && now.day < dateToCheck.day)) {
    age--;
  }

  return age;
}

double calculateBMI(
  double weight,
  double height,
) {
  double BMI = 0.0;
  height = height / 100;
  BMI = weight / (height * height);
  return BMI;
}

int calculateDate() {
  final now = DateTime.now();
  int number = now.day;

  return number;
}

String bmiCriteria(
  double weight,
  double height,
) {
  var str = '';
  double BMI = 0.0;
  height = height / 100;
  BMI = weight / (height * height);

  if (BMI < 18.5) {
    str = "น้ำหนักต่ำกว่าเกณฑ์";
  } else if ((BMI >= 18.5) && (BMI <= 22.9)) {
    str = "สมส่วน";
  } else if ((BMI >= 23.0) && (BMI <= 24.9)) {
    str = "น้ำหนักเกิน";
  } else if ((BMI >= 25.0) && (BMI <= 29.9)) {
    str = "โรคอ้วน";
  } else if (BMI > 30) {
    str = "โรคอ้วนอันตราย";
  }

  return str;
}

DateTimeRange calculateSevenDaysAgo(
  DateTime endDate,
  DateTime startDate,
) {
  endDate = DateTime.now();
  startDate = endDate.subtract(Duration(days: 7));

  return DateTimeRange(start: startDate, end: endDate);
}

DateTimeRange calculateCurrentMonthRange(DateTime now) {
  int year = now.year;
  int month = now.month;
  int lastDayOfMonth = DateTime(year, month + 1, 0).day; // วันสุดท้ายของเดือน
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonthDateTime = DateTime(year, month, lastDayOfMonth);

  return DateTimeRange(start: firstDayOfMonth, end: lastDayOfMonthDateTime);
}

DateTimeRange calculateMonthAgo(
  DateTime endDate,
  DateTime startDate,
) {
  endDate = DateTime.now();
  startDate = endDate.subtract(Duration(days: 30));

  return DateTimeRange(start: startDate, end: endDate);
}

DateTimeRange? calculateToday() {
  DateTime today = DateTime.now();

  DateTime startDate = DateTime(today.year, today.month, today.day, 0, 0, 0);
  DateTime endDate = DateTime(today.year, today.month, today.day, 23, 59, 59);

  return DateTimeRange(start: startDate, end: endDate);
}

DocumentReference? findDocumentInNotiCollection(
  DateTime time,
  List<DocumentReference> ids,
) {
  String formattedTime = DateFormat('HHmm').format(time);

  // วนลูปผ่านลิสต์ของ DocumentReference objects
  for (DocumentReference id in ids) {
    // พิมพ์เวลาที่จัดรูปแบบแล้วและ id ปัจจุบันเพื่อใช้ในการ debug
    print('formattedTime: $formattedTime, id: $id');

    // ตรวจสอบว่าเวลาที่จัดรูปแบบแล้วตรงกับ id หรือไม่
    if (formattedTime == id.id) {
      return id;
      break; // พบตรงกัน ออกจากลูปทันที
    }
  }
}

bool checkDocumentInNotiCollection(
  DateTime time,
  List<DocumentReference> ids,
) {
  bool result = false;
  String formattedTime = DateFormat('HHmm').format(time);

  // วนลูปผ่านลิสต์ของ DocumentReference objects
  for (DocumentReference id in ids) {
    // พิมพ์เวลาที่จัดรูปแบบแล้วและ id ปัจจุบันเพื่อใช้ในการ debug
    print('formattedTime: $formattedTime, id: $id');

    // ตรวจสอบว่าเวลาที่จัดรูปแบบแล้วตรงกับ id หรือไม่
    if (formattedTime == id.id) {
      result = true;
      break; // พบตรงกัน ออกจากลูปทันที
    }
  }

  // หากไม่พบ id ที่ตรงกันเลย คืนค่า false
  return result;
}

String helloTime() {
  String hello = '';
  DateTime currentTime = DateTime.now();

  if (currentTime.hour >= 5 && currentTime.hour < 12) {
    hello = 'สวัสดีตอนเช้า';
  } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
    hello = 'สวัสดีตอนกลางวัน';
  } else if (currentTime.hour >= 18 && currentTime.hour < 21) {
    hello = 'สวัสดีตอนเย็น';
  } else {
    hello = 'สวัสดีตอนกลางคืน';
  }

  return hello;
}

String timeagos(DateTime timealert) {
  String result = '';
  DateTime currentTime = DateTime.now();

  // หาความต่างของเวลา
  Duration difference = currentTime.difference(timealert);

  if (difference.inMinutes < 1) {
    result = 'ตอนนี้';
  } else if (difference.inMinutes < 60) {
    result = '${difference.inMinutes} นาทีที่แล้ว';
  } else {
    // จำนวนชั่วโมงที่ผ่านไป
    int hours = difference.inHours;
    // หากเวลาที่ผ่านไปน้อยกว่าหนึ่งวัน
    if (hours < 24 && currentTime.day == timealert.day) {
      result = '$hours ชั่วโมงที่แล้ว';
    } else {
      // หากเวลาที่ผ่านไปมากกว่าหนึ่งวันให้แสดงวันที่และเวลา
      // ตรวจสอบว่าเป็นเมื่อวานหรือไม่
      if (currentTime.day - timealert.day == 1) {
        result = 'เมื่อวาน ${DateFormat('HH:mm', 'th').format(timealert)}';
      } else if (currentTime.day - timealert.day <= 7) {
        result =
            '${DateFormat('E', 'th').format(timealert)} ${DateFormat('HH:mm', 'th').format(timealert)}';
      } else {
        // ใช้ตัวย่อของวันแทน
        result =
            '${DateFormat('d E', 'th').format(timealert)} ${DateFormat('HH:mm', 'th').format(timealert)}';
      }
    }
  }

  return result;
}

DateTime? changeFormattime(DocumentReference timeRef) {
  String timeStr =
      timeRef.id; // เรียกใช้ id ของ DocumentReference เพื่อใช้เป็น string
  if (timeStr.length != 4) return null; // ตรวจสอบความยาวของ string
  String hour = timeStr.substring(0, 2); // ดึงชั่วโมง
  String minute = timeStr.substring(2, 4); // ดึงนาที
  String formattedTime = '$hour:$minute'; // นำมาต่อกันเป็นรูปแบบ HH:mm
  final result = DateTime.parse(formattedTime);

  return result;
}

bool filterTime(DocumentReference idTime) {
  final now = DateTime.now();

  final docId = idTime.id;
  final hour = int.parse(docId.substring(0, 2));
  final minute = int.parse(docId.substring(2, 4));

  final docTime = DateTime(now.year, now.month, now.day, hour, minute);

  return docTime.isAfter(now);
}
