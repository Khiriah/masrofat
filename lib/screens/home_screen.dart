import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masrofat/model/Muser.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

import '../base.dart';
import '../custom/constance.dart';

List<MI1> MIFromJson(String str) =>
    List<MI1>.from(json.decode(str).map((x) => MI1.fromJson(x)));
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _salary = new TextEditingController();
  List<MI1> User = <MI1>[];

  get i => null;

  loadMI1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        User = MIFromJson(prefs.getString("User")!);

      } catch (e) {}
    });
  }

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _salController = TextEditingController();


  void _add(BuildContext context, String name, String date,int sal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User.add(MI1(name: name, date: date,sal: sal));
    prefs.setString('User', jsonEncode(User));
    showSnackBar(context, 'تمت الاضافه');
  }



  void showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar((snackBar));
  }
  @override
  // String salary = '';
  // bool x = false;
  // int Sal(val) {
  //   val = int.parse(salary);
  //   print(val);
  //   return val;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {

            print('ggggg hhhhhhiiii');
            Get.to(SalaryScreen1);
          },
        ),
      ),
    // if (sal == 0)   {
    // }
      body:
      Container(

        child: Column(children: [
          Container(
            width: 1000,
            height: 150,

            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(50) ,bottomRight: Radius.circular(50)
                )
            )
            ,
          ),
          Container(
              padding: EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.center,
              child: TextField(
                controller: _salController,
                decoration: InputDecoration(
                  labelText: 'ادخل راتبك :',
                  fillColor: Colors.white,
                  filled: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                ),
                keyboardType: TextInputType.number,
              )),
          Container(

              padding: EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.center,
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'ادخل تاريخ الراتب  :',
                  fillColor: Colors.white,

                  filled: false,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                ),
                keyboardType: TextInputType.number,
              )),
          // DatePickerPage(date: ""),
          Container(
              padding: EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.center,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'ادخل اسمك :',
                  fillColor: Colors.white,
                  filled: false,
                  contentPadding:
                   EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                ),
                keyboardType: TextInputType.number,
              )),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(18),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: primaryColor,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () async {
              _add(
                context,
                _nameController.text,_dateController.text,
                int.parse(_salController.text),
              );
              // else
              Get.to(Base());
            },
            child: Text('اضافه'),
          ),
          Column(
            children: <Widget>[
              // Container(
              //   child: Text('Salary $salary'),
              // ),
            ],
          )
        ]),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    loadMI1();
  }
}




// import 'package:flutter/material.dart';

// import 'salary_screen.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final Map<String, int> dataMap = {
//     'Number 1': 1,
//     'Number 2': 2,
//     'Number 3': 3,
//   };

//   String name = '';
//   String age = '';
//   bool isAdult = false;

//   // void updateBoolData(bool newData) {
//   //   setState(() {
//   //     isAdult = newData;
//   //   });
//   // }
//   //
//   // void moveToNextPage() async {
//   //   final newBoolData = await Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (context) => Screen2(
//   //         name: name,
//   //         age: age,
//   //       ),
//   //     ),
//   //   );
//   //   updateBoolData(newBoolData);
//    }

