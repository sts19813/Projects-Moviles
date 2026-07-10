import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AreaChartDemo extends StatelessWidget {
  const AreaChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.tertiary;
    return SizedBox(
      height: 260,
      child: LineChart(
        LineChartData(
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
              barWidth: 3,
              dotData: const FlDotData(show: false),
              spots: const <FlSpot>[
                FlSpot(0, 2),
                FlSpot(1, 4),
                FlSpot(2, 3.5),
                FlSpot(3, 7),
                FlSpot(4, 6),
                FlSpot(5, 8.5),
                FlSpot(6, 7),
              ],
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    color.withValues(alpha: 0.45),
                    color.withValues(alpha: 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
