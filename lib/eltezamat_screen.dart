// import 'package:flutter/material.dart';
// import 'package:masrofat/home_screen.dart';
// import 'package:masrofat/salary_screen.dart';

// import 'custom/constance.dart';

// class EltezamtScreen extends StatefulWidget {
//   const EltezamtScreen({Key? key}) : super(key: key);

//   @override
//   State<EltezamtScreen> createState() => _EltezamtScreenState();
// }

// class _EltezamtScreenState extends State<EltezamtScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//         backgroundColor: primaryColor,
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SalaryScreen1(
//                     sal: '',
//                   ),
//                 ),
//               );
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             )),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation
//           .centerDocked, //specify the location of the FAB
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         onPressed: () {
//           setState(() {});
//         },
//         tooltip: "Centre FAB",
//         child: Container(
//           margin: EdgeInsets.all(15.0),
//           child: Icon(Icons.add),
//           color: primaryColor,
//         ),
//         elevation: 4.0,
//       ),

//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           margin: EdgeInsets.only(left: 12.0, right: 12.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               IconButton(
//                 onPressed: () {},
//                 iconSize: 27.0,
//                 icon: Icon(
//                   Icons.home,
//                   //darken the icon if it is selected or else give it a different color
//                   color: primaryColor1,
//                 ),
//               ),
//               SizedBox(
//                 width: 50.0,
//               ),
//             ],
//           ),
//         ),
//         shape: CircularNotchedRectangle(),
//         color: primaryColor1,
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masrofat/home_screen.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom/constance.dart';
import 'custom/custom_buttom_social.dart';
import 'custom/custom_text.dart';
import 'model/MI.dart';

class EltezamtScreen extends StatefulWidget {
  String sal;
  var r;

  EltezamtScreen({Key? key, required this.sal, this.r}) : super(key: key);

  @override
  State<EltezamtScreen> createState() => _EltezamtScreenState();
}

List<MI> MIFromJson(String str) =>
    List<MI>.from(json.decode(str).map((x) => MI.fromJson(x)));

class _EltezamtScreenState extends State<EltezamtScreen> {
  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();
  List<MI> Il = <MI>[];

  loadMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
      Il = MIFromJson(prefs.getString("Iltizamat")!);
        
      } catch (e) {
        
      }
    });
  }

  void _add(BuildContext context, String masrofat1, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Il.add(MI(title: masrofat1, amount: amount));
    prefs.setString('Iltizamat', jsonEncode(Il));
    showSnackBar(context, 'Your Iltizamat was added');
    _titleController.clear();
    _amuntController.clear();
  }

  void _delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Il.removeAt(pos);
    prefs.setString('Iltizamat', jsonEncode(Il));
    showSnackBar(context, 'Your Iltizamat was removed');
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: primaryColor,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaryScreen1(
                      sal: widget.sal,
                      total: widget.r,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //specify the location of the FAB
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            setState(() {
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
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'الالتزام'),
                              onChanged: (String value) {},
                            ),
                            TextFormField(
                              controller: _amuntController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'قيمة الالتزام'),
                              onChanged: (String value) {},
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
                                // print(
                                //   reason,
                                // );
                                _add(
                                  context,
                                  _titleController.text,
                                  int.parse(_amuntController.text),
                                );
                                Navigator.pop(context);
                              }
                            });
                          },
                          child: const Text("ADD"),
                        ),
                      ],
                    );
                  });
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
        body:Stack(children: <Widget>[
          // Container(
          //     child: Text(
          //         'الحد المسموح للإلتزامات ${this.widget.r = int.parse(widget.sal) / 2}')),
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
                      text: 'التزاماتي',
                      imageName: 'assets/images/Icon.png',
                      onPress: () {},
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                        child: CustomText(
                          text:
                          (' ${this.widget.r = int.parse(widget.sal) / 2}'),
                        ))
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: CustomText(
                          text: ("المتبقي من الالتزامات "),
                        )),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                        child: CustomText(
                          text:
                          (' ${this.widget.r = int.parse(widget.sal) / 2}'),
                        ))
                  ]),
                ])),
          ListView.builder(
              // return ListView.builder(
              shrinkWrap: true,
              itemCount: Il.length,
              itemBuilder: (BuildContext context, int position) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 2.4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text(Il[position].title),
                    subtitle: Text(Il[position].amount.toString()),
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

  @override
  void initState() {
    super.initState();
    loadMI();
  }
}
