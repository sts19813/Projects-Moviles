import 'package:flutter/material.dart';

class LocalImageDemo extends StatelessWidget {
  const LocalImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/branding/app_icon.png',
        width: 180,
        height: 180,
        fit: BoxFit.cover,
        semanticLabel: 'Icono local de Flutter UI Catalog',
      ),
    );
  }
}
