import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  final List<_UserRow> _rows = <_UserRow>[
    const _UserRow('Ana', 'Diseño', 8),
    const _UserRow('Luis', 'Desarrollo', 12),
    const _UserRow('Marta', 'Producto', 6),
  ];
  bool _ascending = true;

  void _sortByName(int columnIndex, bool ascending) {
    setState(() {
      _ascending = ascending;
      _rows.sort(
        (first, second) => ascending
            ? first.name.compareTo(second.name)
            : second.name.compareTo(first.name),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 0,
        sortAscending: _ascending,
        columns: <DataColumn>[
          DataColumn(label: const Text('Nombre'), onSort: _sortByName),
          const DataColumn(label: Text('Equipo')),
          const DataColumn(label: Text('Tareas'), numeric: true),
        ],
        rows: _rows
            .map(
              (row) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(row.name)),
                  DataCell(Text(row.team)),
                  DataCell(Text('${row.tasks}')),
                ],
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _UserRow {
  const _UserRow(this.name, this.team, this.tasks);

  final String name;
  final String team;
  final int tasks;
}
