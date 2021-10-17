import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String ButtonTitle;

  BottomButton({@required this.onTap,@required this.ButtonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          ButtonTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        color: kbottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}