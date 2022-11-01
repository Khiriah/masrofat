import 'package:flutter/material.dart';
import 'package:masrofat/custom/constance.dart';
import 'package:masrofat/custom/custom_text.dart';

class FlootingButton extends StatelessWidget {
  const FlootingButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed ;


  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: primaryColor,

    onPressed: (){
    },
    // onPressed,
    );


  }
}