import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'settings/constants.dart';
import 'settings/navigator.dart';
import 'settings/themes.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    EasyDynamicThemeWidget(
      child: ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$kWebsiteName | $kWebsiteSlogan',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: kHomePage,
      onGenerateRoute: namedRoute,
    );
  }
}
