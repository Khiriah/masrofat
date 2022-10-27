import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'package:masrofat/home_screen.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      home: Scaffold(body: HomeScreen()),
      // initialRoute: '/',
      // routes: {'/salaryPage': ((context) => SalaryScreen()

      // )},
    );
  }
}
