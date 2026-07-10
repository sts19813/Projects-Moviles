import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  static const _heroTag = 'flutter-ui-catalog-hero-demo';

  Future<void> _open(BuildContext context) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (context) => const _HeroDestination()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Hero(tag: _heroTag, child: FlutterLogo(size: 96)),
        const SizedBox(height: AppSpacing.md),
        FilledButton(
          onPressed: () => _open(context),
          child: const Text('Iniciar transición Hero'),
        ),
      ],
    );
  }
}

class _HeroDestination extends StatelessWidget {
  const _HeroDestination();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Destino Hero')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(tag: HeroDemo._heroTag, child: FlutterLogo(size: 220)),
            SizedBox(height: AppSpacing.lg),
            Text('La misma imagen conecta ambas rutas.'),
          ],
        ),
      ),
    );
  }
}
