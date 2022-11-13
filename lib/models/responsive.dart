import 'package:flutter/material.dart';

import '../settings/constants.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kSmallScreen;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= kSmallScreen &&
      MediaQuery.of(context).size.width < kLargeScreen;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= kLargeScreen;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
