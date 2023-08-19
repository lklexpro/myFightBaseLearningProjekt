import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDN6tLhGNLUhAc4HU-5hsRlDIftQ6kIHGc",
            authDomain: "myfightbaselearningprojekt.firebaseapp.com",
            projectId: "myfightbaselearningprojekt",
            storageBucket: "myfightbaselearningprojekt.appspot.com",
            messagingSenderId: "670440131820",
            appId: "1:670440131820:web:a6e212fe0581b909b829c9"));
  } else {
    await Firebase.initializeApp();
  }
}
