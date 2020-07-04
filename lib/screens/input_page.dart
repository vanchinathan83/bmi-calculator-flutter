import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/reusable_icon.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../gender.dart';
import 'results_page.dart';

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
            BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                CalculatorBrain calculator =
                    CalculatorBrain(height: this.height, weight: this.weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi: calculator.getBMI(),
                              result: calculator.getResult(),
                              interpretation: calculator.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}
