import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartDemo extends StatelessWidget {
  const ScatterChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final secondary = Theme.of(context).colorScheme.secondary;
    const points = <(double, double)>[
      (1, 2),
      (1.8, 3.2),
      (2.5, 2.7),
      (3.2, 5.2),
      (4, 4.5),
      (4.6, 7),
      (5.4, 6.2),
      (6.2, 8.4),
    ];

    return SizedBox(
      height: 260,
      child: ScatterChart(
        ScatterChartData(
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 10,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          scatterSpots: points.indexed.map((entry) {
            return ScatterSpot(
              entry.$2.$1,
              entry.$2.$2,
              dotPainter: FlDotCirclePainter(
                radius: 7,
                color: entry.$1.isEven ? primary : secondary,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
