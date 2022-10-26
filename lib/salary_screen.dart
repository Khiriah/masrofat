import 'package:flutter/material.dart';
import 'masrofat_screen.dart';
import 'custom/constance.dart';
import 'home_screen.dart';

class SalaryScreen extends StatefulWidget {
  String sal;
  SalaryScreen({Key? key, required this.sal}) : super(key: key);
  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, //specify the location of the FAB
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            setState(() {});
          },
          tooltip: "Centre FAB",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.add),
            color: primaryColor,
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    //darken the icon if it is selected or else give it a different color
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
              ],
            ),
          ),
          shape: CircularNotchedRectangle(),
          color: primaryColor,
        ),
        body: Center(
          child: Center(
            child: Column(children: [
              Text('راتبك الشهري  : ${widget.sal}'),
              Container(
                child: Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text('مدخرات')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MasrofatScreen()),
                          );
                        },
                        child: Text('مصروفات')),
                    TextButton(onPressed: () {}, child: Text('إلتزامات'))
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
