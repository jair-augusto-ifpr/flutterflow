import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBo2E6LDNq0lYxKwk_6qAhbNJsqxuLajDQ",
            authDomain: "topicoszotts.firebaseapp.com",
            projectId: "topicoszotts",
            storageBucket: "topicoszotts.firebasestorage.app",
            messagingSenderId: "675362576621",
            appId: "1:675362576621:web:f326f6722d1b548ab994e4"));
  } else {
    await Firebase.initializeApp();
  }
}
