import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this. onPress});

  final  Color colour;
  final Widget cardChild;
  final Function onPress;

//const colorString = colour. toString();


//  const ReusableCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),

        ),
      ),
    );
  }
}