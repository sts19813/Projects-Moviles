import 'package:flutter/cupertino.dart';

class CupertinoModalPopupRouteDemo extends StatelessWidget {
  const CupertinoModalPopupRouteDemo({super.key});

  Future<void> _openPopup(BuildContext context) async {
    await Navigator.of(context).push<void>(
      CupertinoModalPopupRoute<void>(
        semanticsDismissible: true,
        builder: (popupContext) => CupertinoActionSheet(
          title: const Text('Selecciona una acción'),
          message: const Text('Esta hoja se presenta con una ruta Cupertino.'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(popupContext),
              child: const Text('Compartir'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(popupContext),
              child: const Text('Guardar en favoritos'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(popupContext),
            child: const Text('Cancelar'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () => _openPopup(context),
      child: const Text('Abrir modal Cupertino'),
    );
  }
}
