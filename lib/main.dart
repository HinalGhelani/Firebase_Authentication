import 'package:firebase_exam_app/HomePage.dart';
import 'package:firebase_exam_app/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const HomePage(),
        'splash_screen': (context) => const SplashScreen(),
      },
    ),
  );
}


