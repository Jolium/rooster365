import 'package:flutter/material.dart';
import '../settings/constants.dart';
import '../settings/settings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 10.0,
          decoration: const BoxDecoration(
            gradient: websiteGradient,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: const BoxDecoration(
            gradient: websiteGradient,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: screenSize.width / 40,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Contact:',
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          kContactEmail,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Divider(thickness: 2.0, color: Theme.of(context).primaryColor),
                const SizedBox(height: 20.0),
                const Text(
                  kCopyright + kWebsiteName,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20.0),
                Divider(thickness: 2.0, color: Theme.of(context).primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
