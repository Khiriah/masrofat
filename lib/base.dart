import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:masrofat/screens/eltezamat_screen.dart';
import 'package:masrofat/screens/masrofat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/Muser.dart';

List<MI1> MIFromJson(String str) =>
    List<MI1>.from(json.decode(str).map((x) => MI1.fromJson(x)));
class Base extends StatefulWidget {
  var sal = '';
  var total;
  var masraf;
  var mod;
  var mm;
  var name='';
  var date='';

  Base(
      {Key? key})
      : super(key: key);
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var name='';
  var date='';
  var salary = 0;
  List<MI1> User = <MI1>[];
  loadMI1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        User = MIFromJson(prefs.getString("User")!);
      } catch (e) {}
    });
  }
  int _selectedIndex = 0;
  final screens = [
    SalaryScreen1(),
    EltezamtScreen(),
    MasrofatScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 200,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        title: Text(
          'How to Fluttffer',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_appBar.png'),
                  fit: BoxFit.fill)),
        ),
      ),
      body: screens[_selectedIndex], // call the page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Color.fromRGBO(0, 109, 143, 0.06),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Color.fromRGBO(0, 109, 143, 0.06),
                hoverColor: Color.fromRGBO(0, 109, 143, 0.06),
                gap: 8,
                activeColor: Color.fromRGBO(0, 109, 143, 1),
                iconSize: 24,
                textSize: 14,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Color.fromRGBO(0, 109, 143, 1),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'الرئيسية',
                  ),
                  GButton(
                    icon: LineIcons.file,
                    text: 'الإلتزامات',
                  ),
                  GButton(
                    icon: LineIcons.moneyBill,
                    text: 'المصروفات',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    loadMI1();
  }
}
