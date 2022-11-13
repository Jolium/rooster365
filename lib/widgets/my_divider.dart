import 'package:flutter/material.dart';

import '../settings/settings.dart';

class MyDivider extends StatelessWidget {
  final double width;
  const MyDivider({
    this.width = 100.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        gradient: websiteGradient,
      ),
    );
  }
}
