import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constans.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState ();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var add;

    return Scaffold(
      appBar: AppBar(
        title: Text("KALKULATOR BMI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                 onTap: (){
                   print('male card');
                 },
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ?
                    kActiveCardColour : kActiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ?
                  kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tinggi",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                    // fontSize: 50.0,
                    //  fontWeight: FontWeight.w900,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF4C4F5E),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0xFFEB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        //  print(newValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Tinggi',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Umur',
                        style: kLabelTextStyle,
                        ),
                        Text(age.toString(),
                        style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                age--;
                              },);
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context)=>ResultPage()));
            },
            child: Container(
              child: Text('Kalkulasi'),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget{
  RoundIconButton({@required  this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
   // RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor:Color(0xFF4C4F5E),
    );
  }
}


