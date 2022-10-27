import 'package:flutter/material.dart';
import 'package:masrofat/eltezamat_screen.dart';
import 'modakharat.dart';
import 'masrofat_screen.dart';
import 'custom/constance.dart';
import 'home_screen.dart';
import 'chart_page.dart';
import 'package:pie_chart/pie_chart.dart';

class SalaryScreen1 extends StatefulWidget {
  var sal = '';
  var total;
  var masraf;
  var mod;

  SalaryScreen1(
      {Key? key, required this.sal, this.total, this.masraf, this.mod})
      : super(key: key);
  @override
  State<SalaryScreen1> createState() => _SalaryScreen1State();
}

class _SalaryScreen1State extends State<SalaryScreen1> {
  late List<chartScreen> data;
  Map<String, double> dataMap = {
    "إلتزامات": 0.5,
    "مصروفات": 0.3,
    "مدخرات": 0.2,
  };
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
                Text(
                  'راتبك الشهري  : ${widget.sal}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Divider(
                  height: 20,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                // Text(
                //   'المتبقي من الراتب : ${widget.sal} ',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold, color: Colors.grey),
                // ),
              ],
            ),
          ),
          //

          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                      )
                    ]),
                child: Column(children: [
                  Icon(
                    Icons.control_point_sharp,
                    color: Colors.grey,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
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
                      child: Text('مدخرات')),
                ]),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                      )
                    ]),
                child: Column(children: [
                  Icon(
                    Icons.money_off,
                    color: Colors.grey,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
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
                      child: Text('مصروفات')),
                ]),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                      )
                    ]),
                child: Column(
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
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
                        child: Text('إلتزامات')),
                  ],
                ),
              )
            ]),
          ),

          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('تقرير المصروفات ', textAlign: TextAlign.right),
                ],
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: Text(
                      'شهري',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(width: 10),
                Text('إسبوعي',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text('يومي',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Divider(
                  height: 30,
                ),
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 0.5,
            color: Colors.grey,
          ),

          // ),
          Center(
            child: Container(
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(10),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 15,
                chartRadius: MediaQuery.of(context).size.width / 2.4,
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
    );
  }
}
