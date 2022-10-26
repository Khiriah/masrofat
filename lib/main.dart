import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'package:masrofat/home_screen.dart';


void main() {
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
      home: Scaffold(
          body: HomeScreen()
      ),
    );
  }
}

