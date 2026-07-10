import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartDemo extends StatefulWidget {
  const BarChartDemo({super.key});

  @override
  State<BarChartDemo> createState() => _BarChartDemoState();
}

class _BarChartDemoState extends State<BarChartDemo> {
  bool _showForecast = false;

  @override
  Widget build(BuildContext context) {
    final values = _showForecast
        ? <double>[5, 7, 6, 9, 8, 10]
        : <double>[3, 6, 4, 8, 7, 9];
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 240,
          child: BarChart(
            BarChartData(
              maxY: 12,
              alignment: BarChartAlignment.spaceAround,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(drawVerticalLine: false),
              titlesData: const FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              barGroups: values.indexed.map((entry) {
                return BarChartGroupData(
                  x: entry.$1,
                  barRods: <BarChartRodData>[
                    BarChartRodData(
                      toY: entry.$2,
                      width: 20,
                      color: color,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SegmentedButton<bool>(
          segments: const <ButtonSegment<bool>>[
            ButtonSegment(value: false, label: Text('Actual')),
            ButtonSegment(value: true, label: Text('Pronóstico')),
          ],
          selected: <bool>{_showForecast},
          onSelectionChanged: (selection) {
            setState(() => _showForecast = selection.first);
          },
        ),
      ],
    );
  }
}
