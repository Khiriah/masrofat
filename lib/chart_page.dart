import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chartScreen extends StatefulWidget {
  chartScreen(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;

  @override
  State<chartScreen> createState() => _MychartScreenState();
}

class _MychartScreenState extends State<chartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
