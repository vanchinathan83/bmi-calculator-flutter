import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'reusable_icon.dart';

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const ACTIVE_CARD_COLOR = Color(0XFF1D1E33);
const INACTIVE_CARD_COLOR = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = ACTIVE_CARD_COLOR;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == INACTIVE_CARD_COLOR) {
        maleCardColor = ACTIVE_CARD_COLOR;
        femaleCardColor = INACTIVE_CARD_COLOR;
      } else {
        maleCardColor = INACTIVE_CARD_COLOR;
      }
    } else {
      if (femaleCardColor == INACTIVE_CARD_COLOR) {
        femaleCardColor = ACTIVE_CARD_COLOR;
        maleCardColor = INACTIVE_CARD_COLOR;
      } else {
        femaleCardColor = INACTIVE_CARD_COLOR;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                        color: maleCardColor,
                        childWidget: ReusableIcon(
                            label: "MALE", icon: FontAwesomeIcons.mars)),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      color: femaleCardColor,
                      childWidget: ReusableIcon(
                          label: "FEMALE", icon: FontAwesomeIcons.venus),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(color: ACTIVE_CARD_COLOR)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(color: ACTIVE_CARD_COLOR)),
                  Expanded(child: ReusableCard(color: ACTIVE_CARD_COLOR)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: BOTTOM_CONTAINER_HEIGHT,
              color: Colors.pink,
            )
          ],
        ));
  }
}
