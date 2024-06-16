import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/Auth/Auth%20Status/authentication_status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        storageBucket: 'todo-121a0.appspot.com',
        apiKey: "AIzaSyCvS9s0fRg0RspgRQD51KGqoEQWAMz9oA8",
        appId: "1:552844308749:android:8455ed74b02bc5b7338044",
        messagingSenderId: "552844308749",
        projectId: "todo-121a0",
      ),
    );
    runApp(const MyApp());
  } catch (e) {
    throw Exception('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeAnimationStyle: AnimationStyle(
          curve: Curves.bounceIn, reverseCurve: Curves.bounceInOut),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const AuthenticationStatus(),
    );
  }
}
