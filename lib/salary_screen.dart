import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'modakharat.dart';
import 'masrofat_screen.dart';
import 'custom/constance.dart';
import 'home_screen.dart';

class SalaryScreen1 extends StatefulWidget {
  String sal;
  SalaryScreen1({Key? key, required this.sal}) : super(key: key);
  @override
  State<SalaryScreen1> createState() => _SalaryScreen1State();
}

class _SalaryScreen1State extends State<SalaryScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
          backgroundColor: primaryColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: Center(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(50)),
              Text(
                'راتبك الشهري  : ${widget.sal}',
              ),
              Container(
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ModkharatScreen()),
                          );
                        },
                        child: Text('مدخرات')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MasrofatScreen()),
                          );
                        },
                        child: Text('مصروفات')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EltezamtScreen()),
                          );
                        },
                        child: Text('إلتزامات'))
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
