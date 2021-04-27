import 'package:flutter/material.dart';
class AppBarText extends StatefulWidget {

  final String text;
  AppBarText(this.text);

  @override
  _AppBarTextState createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> {
  @override
  Widget build(BuildContext context) {
    return Text( widget.text, style: TextStyle(fontFamily: 'Anton', fontSize: 17, fontWeight: FontWeight.w900, color: Colors.black));
  }
}
