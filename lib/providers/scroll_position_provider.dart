import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollPositionNotifier extends StateNotifier<double> {
  ScrollPositionNotifier() : super(0.0);

  void change({required ScrollController scrollController}) =>
      state = scrollController.position.pixels;
}

final scrollPositionProvider =
    StateNotifierProvider.autoDispose<ScrollPositionNotifier, double>(
  (ref) => ScrollPositionNotifier(),
);

class MaxScrollPositionNotifier extends StateNotifier<double> {
  MaxScrollPositionNotifier() : super(0.0);

  void set({required ScrollController scrollController}) =>
      state = scrollController.position.maxScrollExtent;
}

final maxScrollPositionProvider =
    StateNotifierProvider<MaxScrollPositionNotifier, double>(
  (ref) => MaxScrollPositionNotifier(),
);
