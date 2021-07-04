import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.fontIcon, this.text);

  final fontIcon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(fontIcon, size: 80),
        SizedBox(height: 15),
        Text(
          text,
          style: kLabelStyle,
        )
      ],
    );
  }
}
