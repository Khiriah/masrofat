import 'package:flutter/material.dart';
import 'package:masrofat/custom/custom_button.dart';
import 'package:masrofat/custom/custom_text.dart';
import 'package:masrofat/salary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaryScreen(),
                  ),);
              },

              child: Icon(
                Icons.arrow_back,
                color: Colors.black,

              )),
        ),
        body: Padding(

        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
    child: Column(children: [

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [




      ]
    ),
      ]  )
    ),
    );
  }
}
