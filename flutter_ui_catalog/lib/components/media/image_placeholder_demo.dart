import 'package:flutter/material.dart';

class ImagePlaceholderDemo extends StatelessWidget {
  const ImagePlaceholderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 180,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.image_outlined, size: 56),
          Text('Imagen pendiente'),
        ],
      ),
    );
  }
}
