import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class FileSelectorDemo extends StatefulWidget {
  const FileSelectorDemo({super.key});

  @override
  State<FileSelectorDemo> createState() => _FileSelectorDemoState();
}

class _FileSelectorDemoState extends State<FileSelectorDemo> {
  String? _file;

  Future<void> _select() async {
    final file = await showDialog<String>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: const Text('Seleccionar archivo de ejemplo'),
        children: <Widget>[
          for (final name in <String>[
            'documento.pdf',
            'datos.csv',
            'notas.txt',
          ])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(dialogContext, name),
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file_outlined),
                title: Text(name),
              ),
            ),
        ],
      ),
    );
    if (file != null && mounted) {
      setState(() => _file = file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        OutlinedButton.icon(
          onPressed: _select,
          icon: const Icon(Icons.attach_file),
          label: const Text('Elegir archivo'),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(_file ?? 'Ningún archivo seleccionado'),
        const Text('Demo segura: no accede al sistema ni solicita permisos.'),
      ],
    );
  }
}
