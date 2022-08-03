import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veridox_form_preview/app_screens/database_controller.dart';

import 'app_screens/home_page.dart';

void main() async {
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = {
    'apiKey': "AIzaSyA0KGfaOxma0G8tbmB_PEydfbvC7g5eOr0",
    'authDomain': "veridox-68b89.firebaseapp.com",
    'databaseURL':
        "https://veridox-68b89-default-rtdb.asia-southeast1.firebasedatabase.app",
    'projectId': "veridox-68b89",
    'storageBucket': "veridox-68b89.appspot.com",
    'messagingSenderId': "217484249170",
    'appId': "1:217484249170:web:e6e00a838b72fcd236778b",
    'measurementId': "G-BKG5HBEPY9"
  };
  await Firebase.initializeApp(
    // name: 'Veridocs',
    options: FirebaseOptions(
      // databaseURL:
      apiKey: firebaseConfig['apiKey']!,
      authDomain: firebaseConfig['authDomain']!,
      databaseURL: firebaseConfig['databaseURL']!,
      projectId: firebaseConfig['projectId']!,
      storageBucket: firebaseConfig['storageBucket']!,
      appId: firebaseConfig['appId']!,
      messagingSenderId: firebaseConfig['messagingSenderId']!,
      measurementId: firebaseConfig['measurementId']!,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // home: DataController(),
    );
  }
}
