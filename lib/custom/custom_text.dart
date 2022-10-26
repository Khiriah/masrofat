import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {

final String text ;
  final double fontSize ;
  final Color color ;
  final Alignment alignment;

CustomText({
  this.text="",
  this.color=Colors.black,
  this.fontSize=16,
  this.alignment=Alignment.topLeft
});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
        style: TextStyle(
        color: color,
        fontSize: fontSize,


    ),
    )
    );
  }
}
