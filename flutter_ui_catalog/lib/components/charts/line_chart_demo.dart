import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartDemo extends StatelessWidget {
  const LineChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: 260,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 10,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(drawVerticalLine: false),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: <LineChartBarData>[
            LineChartBarData(
              isCurved: true,
              color: color,
              barWidth: 4,
              spots: const <FlSpot>[
                FlSpot(0, 2),
                FlSpot(1, 3.5),
                FlSpot(2, 3),
                FlSpot(3, 6),
                FlSpot(4, 5.5),
                FlSpot(5, 8),
                FlSpot(6, 7.5),
              ],
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
