// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/responsive.dart';
import '../providers/scroll_position_provider.dart';
import '../settings/constants.dart';
import '../settings/settings.dart';
import '../widgets/rooster_logo.dart';
import '../widgets/rooster_title.dart';
import 'bezier_container.dart';
import 'bottom_bar.dart';
import 'custom_button.dart';

class MyScaffold extends StatefulWidget {
  final Widget child;

  const MyScaffold({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    context
        .read(scrollPositionProvider.notifier)
        .change(scrollController: _scrollController);

    context
        .read(maxScrollPositionProvider.notifier)
        .set(scrollController: _scrollController);
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = Responsive.isMobile(context);

    return Consumer(
      builder: (context, watch, _) {
        final double _scrollPosition = watch(scrollPositionProvider);
        final double _ratio = _scrollPosition < screenSize.height * 0.4
            ? 1 - _scrollPosition / (screenSize.height * 0.4)
            : 0;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              screenSize.width,
              isMobile ? 85.0 : 85.0 * _ratio + 75.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).bottomAppBarColor,
              ),
              child: BezierContainer(
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenSize.width / 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(width: screenSize.width / 40),
                        Row(
                          children: [
                            RoosterLogo(
                              size: isMobile ? screenSize.width / 12 + 3 : 60.0,
                            ),
                            SizedBox(width: screenSize.width / 80),
                            RoosterTitle(
                              fontSize:
                                  isMobile ? screenSize.width / 12 + 3 : 60.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            if (!isMobile)
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: CustomButton(
                                  text: 'Demoversie',
                                  onPressed: () {
                                    js.context
                                        .callMethod('open', [kWebsiteUrl]);
                                  },
                                ),
                              ),
                            Builder(
                              builder: (context) {
                                final bool isDarkMode =
                                    Theme.of(context).brightness ==
                                        Brightness.dark;
                                return IconButton(
                                  icon: Transform.rotate(
                                    angle: _scrollPosition / 90 + 0.5,
                                    child: Icon(
                                      isDarkMode
                                          ? Icons.dark_mode
                                          : Icons.light_mode,
                                    ),
                                  ),
                                  onPressed: () {
                                    EasyDynamicTheme.of(context)
                                        .changeTheme(dark: !isDarkMode);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Consumer(
                  builder: (context, watch, _) {
                    // print('Container');
                    final double _scrollPosition =
                        watch(scrollPositionProvider);
                    final double _maxScrollPosition =
                        context.read(maxScrollPositionProvider);
                    final double _ratio = _maxScrollPosition == 0.0
                        ? 1.0
                        : _scrollPosition < _maxScrollPosition
                            ? 1.0 - _scrollPosition / _maxScrollPosition
                            : 0.0;

                    return Container(
                      height: 10.0 * _ratio + 2.0,
                      decoration: const BoxDecoration(
                        gradient: websiteGradient,
                      ),
                    );
                  },
                ),
                if (isMobile)
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 32.0,
                              horizontal: screenSize.width / 30,
                            ),
                            child: widget.child,
                          ),
                          const BottomBar(),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: _scrollController,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 32.0,
                                  horizontal: screenSize.width / 30,
                                ),
                                child: widget.child,
                              ),
                              const BottomBar(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
