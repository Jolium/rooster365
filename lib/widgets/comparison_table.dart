import 'package:flutter/material.dart';
import '../settings/chart.dart';

class ComparisonTable extends StatelessWidget {
  final bool isMobile;

  const ComparisonTable({
    required this.isMobile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: generateChart(isMobile: isMobile),
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
                    style: const TextStyle(overflow: TextOverflow.visible),
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
                    style: const TextStyle(overflow: TextOverflow.visible),
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
                    style: const TextStyle(overflow: TextOverflow.visible),
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
