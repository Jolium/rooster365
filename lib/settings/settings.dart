import 'package:flutter/material.dart';

const Color kMainColor = Colors.blueAccent;
const Color kSideColor = Colors.indigo;

const Gradient websiteGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    kSideColor,
    kMainColor,
    kMainColor,
    kSideColor,
  ],
);
