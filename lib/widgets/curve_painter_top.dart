import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../settings/settings.dart';

class CurvePainterTop extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;
    var path = Path();
    final Paint paint = Paint();

    /// Back wave

    // Start point
    path.lineTo(0, height * 0.2);

    // (middleCurvePointX, middleCurvePointX, endPointX, endPointY)
    path.quadraticBezierTo(
      width / 8,
      height - (height * 0.2),
      width / 4,
      height - (height * 0.4),
    );

    path.quadraticBezierTo(
      width * 3 / 8,
      height - (height * 0.7),
      width / 2,
      height - (height * 0.6),
    );

    path.quadraticBezierTo(
      width * 5 / 8,
      height - (height * 0.6),
      width * 3 / 4,
      height - (height * 0.3),
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height - (height * 0.1),
      width,
      height - (height * 0.3),
    );

    path.lineTo(width, 0);
    path.close();
    paint.color = kMainColor.withOpacity(0.2);
    canvas.drawPath(path, paint);

    /// Middle wave
    path = Path();
    path.lineTo(0, height * 0);

    path.quadraticBezierTo(
      width / 8,
      height - (height * 0.5),
      width / 4,
      height - (height * 0.3),
    );

    path.quadraticBezierTo(
      width * 3 / 8,
      height - (height * 0.2),
      width / 2,
      height - (height * 0.3),
    );

    path.quadraticBezierTo(
      width * 5 / 8,
      height - (height * 0.5),
      width * 3 / 4,
      height - (height * 0.7),
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height - (height * 0.9),
      width,
      height - (height * 0.1),
    );

    path.lineTo(width, 0);
    path.close();
    paint.color = kMainColor.withOpacity(0.5);
    canvas.drawPath(path, paint);

    /// Front wave
    path = Path();
    path.lineTo(0, height * 0.5);

    path.quadraticBezierTo(
      width / 8,
      height - (height * 0.9),
      width / 4,
      height - (height * 0.6),
    );

    path.quadraticBezierTo(
      width * 3 / 8,
      height - (height * 0.2),
      width / 2,
      height - (height * 0.2),
    );

    path.quadraticBezierTo(
      width * 5 / 8,
      height - (height * 0.2),
      width * 3 / 4,
      height - (height * 0.6),
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height - (height * 0.9),
      width,
      height - (height * 0.5),
    );

    path.lineTo(width, 0);
    path.close();
    paint.color = kMainColor;
    paint.shader = ui.Gradient.linear(
      Offset.zero,
      Offset(0, height),
      [
        kMainColor,
        kSideColor,
      ],
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
