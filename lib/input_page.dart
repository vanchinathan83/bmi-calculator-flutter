import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'gender.dart';
import 'reusable_card.dart';
import 'reusable_icon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              this.selectedGender = Gender.MALE;
                            });
                          },
                          color: selectedGender == Gender.MALE
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          childWidget: ReusableIcon(
                              label: "MALE", icon: FontAwesomeIcons.mars))),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        this.selectedGender = Gender.FEMALE;
                      });
                    },
                    color: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: ReusableIcon(
                        label: "FEMALE", icon: FontAwesomeIcons.venus),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          color: kActiveCardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("HEIGHT", style: kTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    this.height.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Text("cm")
                                ],
                              ),
                              Slider(
                                value: this.height.toDouble(),
                                activeColor: Color(0xFFEB1555),
                                inactiveColor: Color(0xFF8D8E98),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    this.height = newValue.round();
                                  });
                                },
                              )
                            ],
                          ))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(color: kActiveCardColor)),
                  Expanded(child: ReusableCard(color: kActiveCardColor)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              color: Colors.pink,
            )
          ],
        ));
  }
}
