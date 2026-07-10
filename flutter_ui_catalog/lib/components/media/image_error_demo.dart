import 'package:flutter/material.dart';

class ImageErrorDemo extends StatelessWidget {
  const ImageErrorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://invalid.flutter-ui-catalog.local/image.png',
      width: 320,
      height: 180,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 320,
        height: 180,
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.center,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.broken_image_outlined, size: 56),
            Text('La imagen no está disponible'),
          ],
        ),
      ),
    );
  }
}
