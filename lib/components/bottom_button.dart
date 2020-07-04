import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  BottomButton({@required this.onTap, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
            child: Text(
          this.buttonText,
          style: kButtonTextStyle,
        )),
        padding: EdgeInsets.only(bottom: 25.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: Colors.pink,
      ),
    );
  }
}
