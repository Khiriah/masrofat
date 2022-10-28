import 'package:flutter/material.dart';
import 'package:masrofat/salary_screen.dart';
import 'custom/constance.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _salary = new TextEditingController();

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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SalaryScreen1(sal: 'll',),
            //   ),
            // );
            print('ggggg hhhhhhiiii');
            Get.to(SalaryScreen1);
          },
        ),
      ),
      body: Container(

        child: Column(children: [
          Container(
            width: 1000,
            height: 80,
            color: primaryColor,
          ),
          Container(

              padding: EdgeInsets.only(top: 200, left: 50, right: 50),
              alignment: Alignment.center,
              child: TextField(
                controller: _salary,
                decoration: InputDecoration(
                  labelText: 'ادخل راتبك :',
                  fillColor: Colors.white,
                  filled: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
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
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => SalaryScreen1(sal: _salary.text)),
              Get.to(SalaryScreen1(sal: _salary.text));
            },
            child: Text('enter'),
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

