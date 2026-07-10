import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartDemo extends StatefulWidget {
  const PieChartDemo({super.key});

  @override
  State<PieChartDemo> createState() => _PieChartDemoState();
}

class _PieChartDemoState extends State<PieChartDemo> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.indigo,
      Colors.teal,
      Colors.orange,
      Colors.pink,
    ];
    final values = <double>[42, 28, 18, 12];

    return Column(
      children: <Widget>[
        SizedBox(
          height: 240,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 42,
              sectionsSpace: 3,
              pieTouchData: PieTouchData(
                touchCallback: (event, response) {
                  setState(() {
                    _touchedIndex =
                        !event.isInterestedForInteractions ||
                            response?.touchedSection == null
                        ? -1
                        : response!.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              sections: values.indexed.map((entry) {
                final selected = entry.$1 == _touchedIndex;
                return PieChartSectionData(
                  value: entry.$2,
                  title: '${entry.$2.toInt()}%',
                  color: colors[entry.$1],
                  radius: selected ? 70 : 60,
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const Wrap(
          spacing: 16,
          children: <Widget>[
            Text('● Móvil'),
            Text('● Web'),
            Text('● Tienda'),
            Text('● Otros'),
          ],
        ),
      ],
    );
  }
}
