import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/core/constants/app_durations.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    unawaited(_openCatalog());
  }

  Future<void> _openCatalog() async {
    await Future<void>.delayed(AppDurations.splash);
    if (mounted) {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Semantics(
          label: 'Cargando Flutter UI Catalog',
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlutterLogo(size: 88),
              SizedBox(height: AppSpacing.lg),
              Text(
                'Flutter UI Catalog',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: AppSpacing.lg),
              SizedBox.square(
                dimension: 28,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
