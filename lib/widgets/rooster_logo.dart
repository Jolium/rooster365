import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../settings/settings.dart';

class RoosterLogo extends StatelessWidget {
  final double size;
  final double rotation;

  const RoosterLogo({
    Key? key,
    this.size = 50.0,
    this.rotation = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size / 16),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(size / 16),
            child: Container(
              width: size * 1.05,
              height: size * 1.05,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: websiteGradient,
                borderRadius: BorderRadius.all(Radius.circular(size / 3)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 1.0),
            child: Container(
              width: size * 1.05,
              height: size * 1.05,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).bottomAppBarColor,
                borderRadius: BorderRadius.all(Radius.circular(size / 3)),
              ),
            ),
          ),
          Container(
            width: size + 1.0,
            height: size + 1.0,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              gradient: websiteGradient,
              borderRadius: BorderRadius.all(Radius.circular(size / 3)),
            ),
            child: Transform.rotate(
              angle: -math.pi / rotation,
              child: Text(
                'R',
                style: TextStyle(
                  color: Theme.of(context).bottomAppBarColor,
                  fontSize: size * 0.8,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
