import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget childWidget;
  final Function onPress;
  ReusableCard({@required this.color, this.childWidget, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
