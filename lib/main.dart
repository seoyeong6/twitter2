import 'package:flutter/material.dart';
import 'package:authentication/auth/login_screen.dart';
import 'package:authentication/auth/experience_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
      home: ExperienceScreen(),
    );
  }
}
