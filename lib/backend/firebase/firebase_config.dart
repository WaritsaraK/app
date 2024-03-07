import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyChhexqTI1YEAWgRtN7gRdlKjq1NSI9BkA",
            authDomain: "popup-ac56e.firebaseapp.com",
            projectId: "popup-ac56e",
            storageBucket: "popup-ac56e.appspot.com",
            messagingSenderId: "125327025308",
            appId: "1:125327025308:web:84de942bd5f9b26b0c7959"));
  } else {
    await Firebase.initializeApp();
  }
}
