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
  int weight = 60;
  int age = 22;

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
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    inactiveTrackColor: Color(0xFF8D8E98),
                                    activeTrackColor: Color(0xFFEB1555),
                                    thumbColor: Color(0xFFEB1555),
                                    overlayColor: Color(0x29EB1555),
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 15.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 30.0)),
                                child: Slider(
                                  value: this.height.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      this.height = newValue.round();
                                    });
                                  },
                                ),
                              )
                            ],
                          ))),
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
                              Text(
                                "WEIGHT",
                                style: kTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            this.weight--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          this.weight++;
                                        });
                                      },
                                    ),
                                  ])
                            ],
                          ))),
                  Expanded(
                      child: ReusableCard(
                          color: kActiveCardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: kTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            this.age--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          this.age++;
                                        });
                                      },
                                    ),
                                  ])
                            ],
                          ))),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/results");
              },
              child: Container(
                child: Text("CALCULATE"),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                color: Colors.pink,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      onPressed: this.onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
