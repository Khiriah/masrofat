
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrofat/custom/custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'custom/constance.dart';
import 'custom/custom_buttom_social.dart';
import 'home_screen.dart';

class ModkharatScreen extends StatefulWidget {  String sal;

   ModkharatScreen({Key? key,
  required this.sal}) : super(key: key);
  @override
  State<ModkharatScreen> createState() => _ModkharatScreenState();
}

class _ModkharatScreenState extends State<ModkharatScreen> {
  List modakharat = [];
  String input = "";
  int selectedIndex = 0;
  String error = "";
  String title = "";
  String des = "";
  var conternum = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

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
                            decoration: InputDecoration(
                                hintText: title,
                                border: UnderlineInputBorder(),
                                labelText: 'سبب الادخار'),
                            onChanged: (String value) {
                              title = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: des,
                              border: UnderlineInputBorder(),
                              labelText: 'المبلغ',
                            ),
                            maxLines: 1,
                            onChanged: (String value) {
                              des = value;
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
                            if (title.isEmpty) {
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

                                      //   TextButton(
                                      //       onPressed: Navigator.pop(context),
                                      //       child: Text('CANCEL'))
                                      // ],
                                    );
                                  });
                            } else {
                              modakharat.add(title);
                              modakharat.add(des);
                              conternum = conternum +1;
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
        body: Column(children: [
          Card(
            margin: const EdgeInsets.only(top: 10,left: 60,right: 60,bottom: 50),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column
              (
                children: [
              Row(
                  children: [
              CustomButtonSocial(
                text: 'الادخار ',
                imageName: 'assets/images/cash.png',
                onPress: () {},
              ),
                SizedBox(width: 100,),
                Container(child:
                CustomText(text:("١٥،٠٠٠ ريال "),)
                )
            ]),
              Row(children: [
                SizedBox(width: 20,),
                Container(
                  child:
                  CustomText(text:("المتبقي من المبلغ المدخر  "),)
                ),
                SizedBox(width: 100,),
                Container(child:
                CustomText(text:("١٥،٠٠٠ ريال "),)
                )
              ]),
          ])
          ),
          ListView.builder(
              // return ListView.builder(
              shrinkWrap: true,
              itemCount: modakharat.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(modakharat[index]),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child:
                    ListTile(
                      leading: Container(
                            child: CircularPercentIndicator(
                              radius: 30.0,
                              percent: 60/100,
                              animation: true,
                              animationDuration: 1000,
                              center: new Text("%80",style: TextStyle(
                                fontSize: 5,
                              ),),
                              progressColor: primaryColor,
                              circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      title: Text(modakharat[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            modakharat.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              })
        ]));
  }
}
