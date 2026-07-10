import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class ImageSelectorDemo extends StatefulWidget {
  const ImageSelectorDemo({super.key});

  @override
  State<ImageSelectorDemo> createState() => _ImageSelectorDemoState();
}

class _ImageSelectorDemoState extends State<ImageSelectorDemo> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Wrap(
          spacing: AppSpacing.sm,
          children: List<Widget>.generate(3, (index) {
            final selected = _selected == index;
            return InkWell(
              onTap: () => setState(() => _selected = index),
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outlineVariant,
                    width: selected ? 4 : 1,
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'assets/branding/app_icon.png',
                      fit: BoxFit.cover,
                    ),
                    if (selected)
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.check_circle),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          _selected == null
              ? 'Selecciona una imagen de ejemplo'
              : 'Imagen ${_selected! + 1} seleccionada',
        ),
        const Text('No se solicitan permisos de fotos en esta demo.'),
      ],
    );
  }
}
