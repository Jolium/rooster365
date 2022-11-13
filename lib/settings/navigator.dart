import 'package:flutter/material.dart';

import '../pages/error.dart';
import '../pages/home.dart';
import '../pages/packets.dart';

/// Named routes
const String kHomePage = '/';
const String kErrorPage = '/error';
const String kPacketsPage = '/pakketten';

Route<dynamic>? namedRoute(
  RouteSettings settings, {
  Key? key,
}) {
  switch (settings.name) {
    case kHomePage:
      return FadeNamedRoute(const Home(), settings);

    case kPacketsPage:
      return FadeNamedRoute(const Version(), settings);

    default:

      /// Default page = ErrorPage
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Error(),
        settings: settings,
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      );
  }
}

class FadeNamedRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings routeSettings;
  FadeNamedRoute(this.page, this.routeSettings)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          settings: routeSettings,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

enum NewPage {
  error,
  home,
  version,
}

Widget route(
  BuildContext context,
  NewPage page, {
  Key? key,
}) {
  switch (page) {
    case NewPage.home:
      return const Home();

    case NewPage.version:
      return const Version();

    default:

      /// Default page = ErrorPage
      return const Error();
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute(this.page)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(opacity: animation, child: child));
}
