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

Future deleteTime(
  bool morning,
  bool noon,
  bool evening,
  bool night,
  DocumentReference? IDmed,
) async {
  if (IDmed != null) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final medSnapshot = await IDmed.get();
      final medicationData = medSnapshot.data();

      final firestoreInstance = FirebaseFirestore.instance;

      if (morning == false) {
        await firestoreInstance
            .collection('users')
            .doc(currentUser.uid)
            .collection('medications')
            .doc(IDmed.id)
            .update({'morningTime': FieldValue.delete()});
      }
      if (noon == false) {
        await firestoreInstance
            .collection('users')
            .doc(currentUser.uid)
            .collection('medications')
            .doc(IDmed.id)
            .update({'noonTime': FieldValue.delete()});
      }
      if (evening == false) {
        await firestoreInstance
            .collection('users')
            .doc(currentUser.uid)
            .collection('medications')
            .doc(IDmed.id)
            .update({'eveningTime': FieldValue.delete()});
      }
      if (night == false) {
        await firestoreInstance
            .collection('users')
            .doc(currentUser.uid)
            .collection('medications')
            .doc(IDmed.id)
            .update({'nightTime': FieldValue.delete()});
      }
    }
  }
}
