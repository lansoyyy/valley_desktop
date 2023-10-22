import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:valley_desktop/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'valley-9b203.firebaseapp.com',
          apiKey: "AIzaSyBYw1II0TSmA-HXeU1NJI1WF2xzyPFIhdQ",
          appId: "1:354930278705:web:420cec9df723d977173010",
          messagingSenderId: "354930278705",
          projectId: "valley-9b203",
          storageBucket: "valley-9b203.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
