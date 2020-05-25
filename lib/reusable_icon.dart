import 'package:flutter/material.dart';

const TextStyle TEXT_STYLE = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18.0,
);

class ReusableIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  ReusableIcon({@required this.label, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.label,
          style: TEXT_STYLE,
        )
      ],
    );
  }
}
