import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 360),
      child: Card(
        color: _selected
            ? Theme.of(context).colorScheme.secondaryContainer
            : null,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => setState(() => _selected = !_selected),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: <Widget>[
                const CircleAvatar(child: Icon(Icons.flutter_dash)),
                const SizedBox(width: AppSpacing.md),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Flutter UI',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Toca para seleccionar esta tarjeta.'),
                    ],
                  ),
                ),
                Icon(_selected ? Icons.check_circle : Icons.circle_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
