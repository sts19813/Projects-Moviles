import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RadarChartDemo extends StatelessWidget {
  const RadarChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final secondary = Theme.of(context).colorScheme.secondary;
    const labels = <String>['UX', 'UI', 'Rend.', 'A11y', 'Tests'];

    return SizedBox(
      height: 300,
      child: RadarChart(
        RadarChartData(
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: false),
          radarBorderData: const BorderSide(color: Colors.transparent),
          tickCount: 4,
          ticksTextStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0,
          ),
          tickBorderData: BorderSide(color: primary.withValues(alpha: 0.15)),
          gridBorderData: BorderSide(color: primary.withValues(alpha: 0.3)),
          getTitle: (index, angle) =>
              RadarChartTitle(text: labels[index], angle: angle),
          dataSets: <RadarDataSet>[
            RadarDataSet(
              borderColor: primary,
              fillColor: primary.withValues(alpha: 0.18),
              entryRadius: 3,
              dataEntries: const <RadarEntry>[
                RadarEntry(value: 8),
                RadarEntry(value: 9),
                RadarEntry(value: 7),
                RadarEntry(value: 8),
                RadarEntry(value: 6),
              ],
            ),
            RadarDataSet(
              borderColor: secondary,
              fillColor: secondary.withValues(alpha: 0.12),
              entryRadius: 3,
              dataEntries: const <RadarEntry>[
                RadarEntry(value: 6),
                RadarEntry(value: 7),
                RadarEntry(value: 9),
                RadarEntry(value: 5),
                RadarEntry(value: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
