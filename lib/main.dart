import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'form_widgets/image_input.dart';

List<CameraDescription> cameras = [];

void main() async {
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  WidgetsFlutterBinding.ensureInitialized();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
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
  // static List<CameraDescription> cameras = await availableCameras();
  // static final firstCamera = cameras.first;
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
      // home: MyHomePage(),
      // home: DataController(),
      home: const ImageInput(
        widgetJson: {'label': 'capture location images'},
      ),
    );
  }
}
