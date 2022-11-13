import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // pass null to disable button
  final Color color;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = Colors.blueAccent,
    this.width = 100.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(height / 3),
              bottomLeft: Radius.circular(height / 3),
            ),
          ),
          side: BorderSide(
            width: 3.0,
            color: color,
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
