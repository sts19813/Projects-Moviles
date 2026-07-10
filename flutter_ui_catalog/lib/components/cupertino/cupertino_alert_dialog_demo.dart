import 'package:flutter/cupertino.dart';

class CupertinoAlertDialogDemo extends StatelessWidget {
  const CupertinoAlertDialogDemo({super.key});

  Future<void> _show(BuildContext context) async {
    await showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: const Text('Permitir notificaciones'),
        content: const Text('Puedes cambiar esta opción posteriormente.'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Ahora no'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Permitir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () => _show(context),
      child: const Text('Abrir alerta de iOS'),
    );
  }
}
