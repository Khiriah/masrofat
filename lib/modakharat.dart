import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrofat/salary_screen.dart';

import 'custom/constance.dart';
import 'home_screen.dart';

class ModkharatScreen extends StatefulWidget {
  String sal;
  ModkharatScreen({
    Key? key,
    required this.sal,
  }) : super(key: key);

  @override
  State<ModkharatScreen> createState() => _ModkharatScreenState();
}

class _ModkharatScreenState extends State<ModkharatScreen> {
  @override
  Widget build(BuildContext context) {
    var mod;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        backgroundColor: primaryColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SalaryScreen1(
                    sal: widget.sal,
                  ),
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
                  color: primaryColor1,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        color: primaryColor1,
      ),
      body: Container(
          child: Text(
              'الحد المسموح للمدخرات ${mod = int.parse(widget.sal) * 20 / 100}')),
    );
  }
}
