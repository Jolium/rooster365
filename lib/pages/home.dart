// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

import '../models/responsive.dart';
import '../settings/constants.dart';
import '../settings/text_contents.dart';
import '../widgets/comparison_table.dart';
import '../widgets/custom_button.dart';
import '../widgets/images_slider.dart';
import '../widgets/my_divider.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/rooster_logo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = Responsive.isMobile(context);
    return MyScaffold(
      child: Column(
        children: [
          if (isMobile)
            Column(
              children: [
                const Text(
                  titleContent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenSize.width / 30.0),
                const Text(
                  shortContent,
                  textAlign: TextAlign.justify,
                  style: TextStyle(overflow: TextOverflow.visible),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Probeer nu de online versie',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: CustomButton(
                        text: 'Demoversie',
                        onPressed: () {
                          js.context.callMethod('open', [kWebsiteUrl]);
                        },
                      ),
                    ),
                  ],
                ),
                ImagesSlider(
                  images: const [kWebsiteImage],
                  size: screenSize.width,
                ),
                SizedBox(height: screenSize.width / 30.0),
                const Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(overflow: TextOverflow.visible),
                ),
                ImagesSlider(
                  images: imagesCarouselSlider,
                  size: screenSize.width,
                ),
                SizedBox(height: screenSize.width / 30.0),
              ],
            )
          else
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            titleContent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Text(
                            shortContent,
                            textAlign: TextAlign.justify,
                            style: TextStyle(overflow: TextOverflow.visible),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 30.0),
                    Expanded(
                      child: ImagesSlider(
                        images: const [kWebsiteImage],
                        size: screenSize.width / 2.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.width / 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ImagesSlider(
                        images: imagesCarouselSlider,
                        size: screenSize.width / 2.2,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 30.0),
                    const Expanded(
                      child: Text(
                        content,
                        textAlign: TextAlign.justify,
                        style: TextStyle(overflow: TextOverflow.visible),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: screenSize.width / 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyDivider(width: screenSize.width / 3),
              const RoosterLogo(),
              MyDivider(width: screenSize.width / 3),
            ],
          ),
          SizedBox(height: screenSize.width / 30.0),
          Row(
            children: [
              Expanded(
                // flex: isMobile ? 8 : 6,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 24.0,
                  ),
                  child: Text(
                    'Pakketten vergelijken',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 30.0 : 40.0,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ),
              ),
            ],
          ),
          ComparisonTable(
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}
