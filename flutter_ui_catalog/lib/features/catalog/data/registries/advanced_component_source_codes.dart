const advancedComponentSourceCodes = <String, String>{
  'alert-dialog': '''final confirmed = await showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Eliminar elemento'),
    content: const Text('Esta acción no se puede deshacer.'),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
      FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Eliminar')),
    ],
  ),
);''',
  'bottom-sheet': '''await showModalBottomSheet<void>(
  context: context,
  showDragHandle: true,
  builder: (context) => const SafeArea(
    child: ListTile(
      leading: Icon(Icons.share_outlined),
      title: Text('Compartir'),
    ),
  ),
);''',
  'cupertino-alert-dialog': '''await showCupertinoDialog<void>(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: const Text('Permitir notificaciones'),
    content: const Text('Puedes cambiar esta opción posteriormente.'),
    actions: [
      CupertinoDialogAction(
        onPressed: () => Navigator.pop(context),
        child: const Text('Permitir'),
      ),
    ],
  ),
);''',
  'snack-bar': '''ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Cambios guardados correctamente')),
);''',
  'tooltip': '''const Tooltip(
  message: 'Actualiza el contenido',
  triggerMode: TooltipTriggerMode.tap,
  child: Icon(Icons.refresh),
)''',
  'circular-progress-indicator': '''CircularProgressIndicator(
  value: progress,
  strokeWidth: 7,
)''',
  'linear-progress-indicator': '''LinearProgressIndicator(value: progress)''',
  'chip': '''FilterChip(
  label: const Text('Flutter'),
  selected: selected,
  onSelected: (value) => setState(() => selected = value),
)''',
  'data-table': '''DataTable(
  sortColumnIndex: 0,
  sortAscending: ascending,
  columns: [
    DataColumn(label: const Text('Nombre'), onSort: sortByName),
    const DataColumn(label: Text('Equipo')),
  ],
  rows: users.map((user) => DataRow(cells: [
    DataCell(Text(user.name)),
    DataCell(Text(user.team)),
  ])).toList(),
)''',
  'animated-container': '''AnimatedContainer(
  duration: const Duration(milliseconds: 400),
  curve: Curves.easeInOut,
  width: expanded ? 220 : 120,
  height: expanded ? 140 : 120,
  decoration: BoxDecoration(
    color: expanded ? Colors.orange : Colors.purple,
    borderRadius: BorderRadius.circular(expanded ? 32 : 12),
  ),
)''',
  'animated-opacity': '''AnimatedOpacity(
  opacity: visible ? 1 : 0.15,
  duration: const Duration(milliseconds: 350),
  child: const FlutterLogo(size: 88),
)''',
  'hero': '''Hero(
  tag: 'flutter-logo',
  child: GestureDetector(
    onTap: () => Navigator.push(context, destinationRoute),
    child: const FlutterLogo(size: 96),
  ),
)''',
};
