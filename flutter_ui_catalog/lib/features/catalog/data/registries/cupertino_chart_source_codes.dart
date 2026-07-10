const cupertinoChartSourceCodes = <String, String>{
  'cupertino-date-picker': '''CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  initialDateTime: selectedDate,
  onDateTimeChanged: (date) => setState(() => selectedDate = date),
)''',
  'cupertino-picker': '''CupertinoPicker(
  itemExtent: 44,
  useMagnifier: true,
  onSelectedItemChanged: (index) => setState(() => selectedIndex = index),
  children: options.map((option) => Center(child: Text(option))).toList(),
)''',
  'cupertino-time-picker': '''CupertinoDatePicker(
  mode: CupertinoDatePickerMode.time,
  use24hFormat: true,
  minuteInterval: 5,
  onDateTimeChanged: (time) => setState(() => selectedTime = time),
)''',
  'cupertino-modal-popup-route': '''Navigator.of(context).push<void>(
  CupertinoModalPopupRoute<void>(
    semanticsDismissible: true,
    builder: (context) => CupertinoActionSheet(
      title: const Text('Selecciona una acción'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Compartir'),
        ),
      ],
    ),
  ),
)''',
  'bar-chart': '''BarChart(
  BarChartData(
    maxY: 12,
    barGroups: values.indexed.map((entry) => BarChartGroupData(
      x: entry.\$1,
      barRods: [BarChartRodData(toY: entry.\$2, width: 20)],
    )).toList(),
  ),
)''',
  'pie-chart': '''PieChart(
  PieChartData(
    centerSpaceRadius: 42,
    sections: [
      PieChartSectionData(value: 42, title: '42%', color: Colors.indigo),
      PieChartSectionData(value: 28, title: '28%', color: Colors.teal),
      PieChartSectionData(value: 30, title: '30%', color: Colors.orange),
    ],
  ),
)''',
  'line-chart': '''LineChart(
  LineChartData(
    lineBarsData: [LineChartBarData(
      isCurved: true,
      spots: const [FlSpot(0, 2), FlSpot(1, 3.5), FlSpot(2, 3)],
    )],
  ),
)''',
  'area-chart': '''LineChart(
  LineChartData(
    lineBarsData: [LineChartBarData(
      spots: const [FlSpot(0, 2), FlSpot(1, 4), FlSpot(2, 3.5)],
      belowBarData: BarAreaData(show: true, color: Colors.indigo.shade100),
    )],
  ),
)''',
  'scatter-chart': '''ScatterChart(
  ScatterChartData(
    scatterSpots: const [
      ScatterSpot(1, 2),
      ScatterSpot(2.5, 4),
      ScatterSpot(4, 7),
    ],
  ),
)''',
  'radar-chart': '''RadarChart(
  RadarChartData(
    getTitle: (index, angle) => RadarChartTitle(text: labels[index]),
    dataSets: [RadarDataSet(
      dataEntries: const [
        RadarEntry(value: 8),
        RadarEntry(value: 9),
        RadarEntry(value: 7),
      ],
    )],
  ),
)''',
};
