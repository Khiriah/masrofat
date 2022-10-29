// import 'dart:html';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masrofat/custom/custom_text.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom/constance.dart';
import 'custom/custom_buttom_social.dart';

import 'home_screen.dart';
import 'model/MI.dart';

class ModkharatScreen extends StatefulWidget {
  String sal;
  var m;
  var mm = 100;

  ModkharatScreen({Key? key, required this.sal}) : super(key: key);
  @override
  State<ModkharatScreen> createState() => _ModkharatScreenState();
}

List<MI> MIFromJson(String str) =>
    List<MI>.from(
        json.decode(str).map((x) => MI.fromJson(x)));
class _ModkharatScreenState extends State<ModkharatScreen> {

  List<MI> modakharat= <MI>[]  ;

  loadMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        modakharat=MIFromJson(prefs.getString("Modakharat")!);

      } catch (e) {

      }
    });


  }


  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();

  void _add(BuildContext context, String masrofat1, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modakharat.add(MI(title: masrofat1, amount: amount));
    prefs.setString('Modakharat', jsonEncode(modakharat));

    showSnackBar(context, 'Your Modakharat was added');
    _titleController.clear();
    _amuntController.clear();
  }
  void _delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modakharat.removeAt(pos);
    prefs.setString('Modakharat', jsonEncode(modakharat));
    showSnackBar(context, 'Your Modakharat was removed');
    _titleController.clear();
    _amuntController.clear();
  }



  void showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar((snackBar));
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
                    builder: (context) =>
                        SalaryScreen1(sal: widget.sal, masraf: widget.m),
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
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                hintText: " ",
                                border: UnderlineInputBorder(),
                                labelText: 'سبب الادخار'),
                            onChanged: (String value) {},
                          ),
                          TextFormField(
                            controller: _amuntController,
                            decoration: InputDecoration(
                              hintText: " ",
                              border: UnderlineInputBorder(),
                              labelText: 'المبلغ',
                            ),
                            maxLines: 1,
                            onChanged: (String value) {

                            },
                          ),
                        ]),
                    actions: <Widget>[
                      TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: const Text('CANCEL')),
                      TextButton(
                        onPressed: () {
                          setState(() {

                            if (_titleController.text.isEmpty ||
                                _amuntController.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      icon: Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                      title: Text(
                                        "The Titel Cannot be empty",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    );
                                  });
                            } else {

                              _add(
                                context,
                                _titleController.text,
                                int.parse(_amuntController.text),
                              );
                              Get.to(SalaryScreen1);
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: const Text("ADD"),
                      ),
                    ],
                  );
                });
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
        body: Stack(children: <Widget>[
          Container(
            width: 1000,
            height: 80,
            color: primaryColor,
          ),
          Column(children: [
            Card(
                margin: const EdgeInsets.only(
                    top: 50, left: 60, right: 60, bottom: 50),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Row(children: [
                    CustomButtonSocial(
                      text: 'مدخراتي',
                      imageName: 'assets/images/Icon.png',
                      onPress: () {},
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                        child: CustomText(
                      text:
                          (' ${this.widget.m = int.parse(widget.sal) * 20 / 100}'),
                    ))
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: CustomText(
                      text: ("المتبقي من المدخرات "),
                    )),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                        child: CustomText(
                      text:
                          (' ${this.widget.m = int.parse(widget.sal) * 20 / 100}'),
                    ))
                  ]),
                ])),
            ListView.builder(
                // return ListView.builder(
                shrinkWrap: true,
                itemCount: modakharat.length,
                itemBuilder: (BuildContext context, int position) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 2.4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Container(
                        child: CircularPercentIndicator(
                          radius: 20.0,
                          percent: 60 / 100,
                          animation: true,
                          animationDuration: 1000,
                          center: new Text(
                            "%80",
                            style: TextStyle(
                              fontSize: 5,
                            ),
                          ),
                          progressColor: primaryColor,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      title: Text( modakharat[position].title),
                     subtitle: Text(modakharat[position].amount.toString()),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _delete(context, position);
                          });
                        },
                      ),
                    ),
                  );
                })
          ])
        ]));
  }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom
    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
