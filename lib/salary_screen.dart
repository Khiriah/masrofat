import 'package:flutter/material.dart';
import 'package:masrofat/home_screen.dart';

import 'custom/custom_button.dart';
import 'custom/custom_text_form_field.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        // elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
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

              CustomTextFormField(text: 'Your Salary', hint: 'Your Salary',

            ),
            ElevatedButton(onPressed: (){
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),);
            }, child: Text("Start"))
        ]  )
      ),
    );
  }
  }

