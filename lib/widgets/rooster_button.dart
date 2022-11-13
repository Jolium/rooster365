import 'package:flutter/material.dart';

import '../settings/settings.dart';

class RoosterButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final VoidCallback? onPressed; // pass null to disable button

  const RoosterButton({
    Key? key,
    required this.text,
    this.width = 100.0,
    this.height = 40.0,
    this.color = Colors.blueAccent,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: websiteGradient,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(height / 3),
            bottomLeft: Radius.circular(height / 3),
          ),
        ),
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(height / 3),
              bottomLeft: Radius.circular(height / 3),
            ),
          ),
          child: FittedBox(
            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return const TextStyle(
                      decoration: TextDecoration.underline,
                      backgroundColor: Colors.red,
                    );
                  } else {
                    return const TextStyle(decoration: TextDecoration.overline);
                  }
                }),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return websiteGradient.createShader(
                      Rect.fromLTWH(
                        0,
                        0,
                        bounds.width,
                        bounds.height,
                      ),
                    );
                  },
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
