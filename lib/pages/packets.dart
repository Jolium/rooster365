import 'package:flutter/material.dart';

import '../models/responsive.dart';
import '../settings/chart.dart';
import '../widgets/my_divider.dart';
import '../widgets/my_scaffold.dart';

class Version extends StatelessWidget {
  const Version({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isMobile = Responsive.isMobile(context);
    return MyScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: isMobile ? 32.0 : 48.0),
              child: Row(
                children: [
                  if (!isMobile) const Expanded(child: SizedBox()),
                  const Expanded(child: MyDivider()),
                  Expanded(
                    flex: isMobile ? 8 : 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0,
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
                  const Expanded(child: MyDivider()),
                  if (!isMobile) const Expanded(child: SizedBox()),
                ],
              ),
            ),
            Container(
              margin: isMobile
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(
                      // vertical: 24.0,
                      horizontal: size.width / 20,
                    ),
              decoration: BoxDecoration(
                color: Colors.indigoAccent.withOpacity(0.1),
                border: Border.all(width: 3.0, color: Colors.blueAccent),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(size.width / 20),
                  bottomLeft: Radius.circular(size.width / 20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: generateChart(isMobile: isMobile),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateChart({required bool isMobile}) {
    final List<Widget> column = [
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            const Expanded(child: Text('')),
            Expanded(
              child: Text(
                'Basic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 24.0 : 36.0,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Standard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 24.0 : 36.0,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ],
        ),
      )
    ];

    for (final Map<String, String> map in chart.values) {
      final String a = map['a'] ?? '';
      final String b = map['b'] ?? '';
      final String c = map['c'] ?? '';

      column.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    a,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 3.0,
                height: 30.0,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    b,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 3.0,
                height: 30.0,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    c,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return column;
  }
}
