import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../settings/settings.dart';

class CurvePainterBottom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;
    var path = Path();
    final Paint paint = Paint();

    /// Back wave

    // Start point
    path.moveTo(0, height);
    path.lineTo(0, height * 0.5);

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
      height - (height * 0.5),
      width * 3 / 4,
      height - (height * 0.3),
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height - (height * 0.1),
      width,
      height - (height * 0.3),
    );

    path.lineTo(width, height);
    path.close();
    paint.color = kMainColor.withOpacity(0.2);
    canvas.drawPath(path, paint);

    /// Middle wave
    path = Path();
    path.moveTo(0, height);
    path.lineTo(0, height * 0.6);

    path.quadraticBezierTo(
      width / 8,
      height - (height * 0.5),
      width / 4,
      height - (height * 0.3),
    );

    path.quadraticBezierTo(
      width * 3 / 8,
      height - (height * 0.1),
      width / 2,
      height - (height * 0.4),
    );

    path.quadraticBezierTo(
      width * 5 / 8,
      height - (height * 0.7),
      width * 3 / 4,
      height - (height * 0.5),
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height - (height * 0.3),
      width,
      height - (height * 0.6),
    );

    path.lineTo(width, height);
    path.close();
    paint.color = kMainColor.withOpacity(0.5);
    canvas.drawPath(path, paint);

    /// Front wave
    path = Path();
    path.moveTo(0, height);
    path.lineTo(0, height * 0.6);

    path.quadraticBezierTo(
      width / 8,
      height * 0.2,
      width / 4,
      height * 0.5,
    );

    path.quadraticBezierTo(
      width * 3 / 8,
      height * 0.8,
      width / 2,
      height * 0.8,
    );

    path.quadraticBezierTo(
      width * 5 / 8,
      height * 0.8,
      width * 3 / 4,
      height * 0.4,
    );

    path.quadraticBezierTo(
      width * 7 / 8,
      height * 0.1,
      width,
      height * 0.6,
    );

    path.lineTo(width, height);
    path.close();
    paint.color = kMainColor;
    paint.shader = ui.Gradient.linear(
      Offset.zero,
      Offset(0, height),
      [
        kSideColor,
        kMainColor,
      ],
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
