import 'package:flutter/material.dart';
import 'constans.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  //const IconContent({
  //Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon (
          icon,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}