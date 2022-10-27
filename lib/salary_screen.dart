import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'modakharat.dart';
import 'masrofat_screen.dart';
import 'custom/constance.dart';
import 'home_screen.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

import 'chart_page.dart';

class SalaryScreen1 extends StatefulWidget {
  String sal;
  SalaryScreen1({Key? key, required this.sal}) : super(key: key);
  @override
  State<SalaryScreen1> createState() => _SalaryScreen1State();
}

class _SalaryScreen1State extends State<SalaryScreen1> {
  late List<chartScreen> data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 7,
                      offset: Offset(10, 11))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('راتبك الشهري  : ${widget.sal}'),
                Divider(
                  color: Colors.black,
                ),
                Text('المتبقي من الراتب : ${widget.sal}'),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ModkharatScreen(
                                 sal: widget.sal,
                                )),
                      );
                    },
                    child: Text('مدخرات')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MasrofatScreen(
                                  sal: widget.sal,
                                )),
                      );
                    },
                    child: Text('مصروفات')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => EltezamtScreen(
                                  sal: widget.sal,
                                )),
                      );
                    },
                    child: Text('إلتزامات'))
              ],
            ),
          ),
          Center(
            child: Container(),
          )
        ],
      ),
    );
  }
}
