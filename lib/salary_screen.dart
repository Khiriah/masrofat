import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom/custom_buttom_social.dart';
import 'custom/custom_text.dart';
import 'modakharat.dart';
import 'masrofat_screen.dart';
import 'custom/constance.dart';
import 'home_screen.dart';
import 'chart_page.dart';
import 'package:pie_chart/pie_chart.dart';

import 'model/MI.dart';

class SalaryScreen1 extends StatefulWidget {

  var sal = '';
  var total;
  var masraf;
  var mod;
  var mm;

  SalaryScreen1(
      {Key? key, required this.sal, this.total, this.masraf, this.mod,this.mm})
      : super(key: key);
  @override
  State<SalaryScreen1> createState() => _SalaryScreen1State();


}
List<MI> MIFromJson(String str) =>
    List<MI>.from(
        json.decode(str).map((x) => MI.fromJson(x)));

class _SalaryScreen1State extends State<SalaryScreen1> {
  late List<chartScreen> data;
  List<MI> masrofat = <MI>[];
  List<MI> modakharat = <MI>[];
  

  List<MI> Il = <MI>[];
  var remain;


  Map<String, double> dataMap = {
    "إلتزامات": 0.5,
    "مصروفات": 0.3,
    "مدخرات": 0.2,
  };


  loadMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        masrofat = MIFromJson(prefs.getString("Masrofat")!);
        Il = MIFromJson(prefs.getString("Iltizamat")!);
        modakharat = MIFromJson(prefs.getString("Modakharat")!);
        var sum=0;
        for(final e in Il){
          //
          sum+=e.amount;
        }
        for(final e in masrofat){
          //
          sum+=e.amount;
        }
        for(final e in modakharat){
          //
          sum+=e.amount;
        }
        remain= int.parse(widget.sal)-sum;

      } catch (e) {

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: primaryColor,
          elevation: 0.0,
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
        body: Stack(children: <Widget>[
          Container(
            width: 1000,
            height: 230,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(50) ,bottomRight: Radius.circular(50)
                )
            )
            ,
          ),
          Column(
            children: [
              Card(

                  margin: const EdgeInsets.only(
                      top: 50, left: 60, right: 60, bottom: 50),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Row(children: [
                      CustomButtonSocial(
                        text: 'راتبك الشهري ',
                        imageName: 'assets/images/Icon4.png',
                        onPress: () {},
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Container(
                          child: CustomText(
                            text:
                            ('${widget.sal} '),
                          ))
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          child: CustomText(
                            text: ("المتبقي من الراتب "),
                          )),
                      SizedBox(
                        width: 190,
                      ),
                      Container(
                          child: CustomText(
                            text:
                            ('${remain} '),
                          ))
                    ]),
                  ])),


              Container(
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Image.asset('assets/images/icon2.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ModkharatScreen(
                                    sal: widget.sal,
                                  )),
                            );
                          },
                          child: CustomText(text: '  مدخرات')),
                    ]),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/Icon.png'),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => MasrofatScreen(
                                    sal: widget.sal,
                                  )),
                            );
                          },
                          child: CustomText(text: '  مصروفات')),
                    ]),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset('assets/images/Icon4.png'),
                        SizedBox(
                          height: 10,
                        ),

                        TextButton(

                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EltezamtScreen(
                                      sal: widget.sal,
                                    )),
                              );
                            },
                            child: CustomText(text: '  إلتزامات')),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text('تقرير المصروفات',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 23, 20, 37),
                            fontWeight: FontWeight.bold)),
                  )),
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       // Container(
              //       //     padding: EdgeInsets.all(3),
              //       //     margin: EdgeInsets.all(1),
              //       //     decoration: BoxDecoration(
              //       //       borderRadius: BorderRadius.circular(5),
              //       //       color: primaryColor,
              //       //     ),
              //       //     child: Text(
              //       //       'شهري',
              //       //       style: TextStyle(
              //       //           fontSize: 15.0,
              //       //           color: Colors.white,
              //       //           fontWeight: FontWeight.bold),
              //       //     )),
              //       SizedBox(width: 10),
              //       Text('إسبوعي',
              //           style: TextStyle(
              //               fontSize: 15.0,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold)),
              //       Text('يومي',
              //           style: TextStyle(
              //               fontSize: 15.0,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold)),
              //       Divider(
              //         height: 30,
              //       ),
              //     ],
              //   ),
              // ),
              // Divider(
              //   height: 5,
              //   thickness: 0.0,
              //   color: Colors.grey,
              // ),



              // ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(50),
                  margin: EdgeInsets.all(10),
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 15,
                    chartRadius: MediaQuery
                        .of(context)
                        .size
                        .width / 2.4,
                    // colorList:
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 15,
                    centerText: "",
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      // legendShape: _BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                    // gradientList: Colors.red,
                    // emptyColorGradient: ---Empty Color gradient---
                  ),
                ),
              )
            ],
          ),
        ]));
  }


  @override
  void initState() {
    loadMI();

    super.initState();
  }
}

