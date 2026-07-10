import 'package:flutter/material.dart';

class NetworkImageDemo extends StatelessWidget {
  const NetworkImageDemo({super.key});

  static const _url = 'https://picsum.photos/640/360';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        _url,
        width: 320,
        height: 180,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return child;
          }
          return const SizedBox(
            width: 320,
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) => const SizedBox(
          width: 320,
          height: 180,
          child: Center(child: Text('No se pudo cargar la imagen')),
        ),
      ),
    );
  }
}
