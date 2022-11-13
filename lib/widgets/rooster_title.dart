import 'package:flutter/material.dart';

class RoosterTitle extends StatelessWidget {
  final double fontSize;

  const RoosterTitle({
    Key? key,
    this.fontSize = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'R',
          style: TextStyle(
            color: Colors.blueAccent,
            fontFamily: 'Lobster',
            fontSize: fontSize,
          ),
        ),
        Text(
          'ooster 365',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontFamily: 'Lobster',
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
