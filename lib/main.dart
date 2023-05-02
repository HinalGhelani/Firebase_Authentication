import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_exam_app/screens/splashscreen.dart';
import 'package:firebase_exam_app/screens/user_edit.dart';
import 'package:flutter/material.dart';
import 'screens/user_add.dart';
import 'screens/user_page.dart';
import 'screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const homepage(),
        'user_add': (context) => const UserAdd(),
        'user_page': (context) => const UserPage(),
        'user_edit': (context) => const UserEditPage(),
        'splash_screen': (context) => const SplashScreen(),
      },
    );
  }
}
