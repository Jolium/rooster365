import 'package:flutter/material.dart';

import '../widgets/curve_painter_bottom.dart';
import '../widgets/curve_painter_top.dart';

class BezierContainer extends StatelessWidget {
  final Widget? child;
  final bool isTop;

  const BezierContainer({
    Key? key,
    this.child,
    this.isTop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: isTop ? CurvePainterTop() : CurvePainterBottom(),
      child: child,
    );
  }
}
