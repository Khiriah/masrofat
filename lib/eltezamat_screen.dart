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
import 'package:flutter/material.dart';
import 'package:masrofat/home_screen.dart';
import 'package:masrofat/salary_screen.dart';
import 'package:get/get.dart';

import 'custom/constance.dart';

class EltezamtScreen extends StatefulWidget {
  String sal;
  var r;

  EltezamtScreen({Key? key, required this.sal, this.r}) : super(key: key);

  @override
  State<EltezamtScreen> createState() => _EltezamtScreenState();
}

class _EltezamtScreenState extends State<EltezamtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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

      body: Container(
          child: Text(
              'الحد المسموح للإلتزامات ${this.widget.r = int.parse(widget.sal) / 2}')),
    );
  }
}
