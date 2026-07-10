import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';

class ComponentVariants extends StatelessWidget {
  const ComponentVariants({required this.component, super.key});

  final CatalogComponent component;

  @override
  Widget build(BuildContext context) {
    final variants = switch (component.id) {
      'filled-button' => <_Variant>[
        _Variant(
          'Normal',
          FilledButton(onPressed: _noop, child: Text('Continuar')),
        ),
        _Variant(
          'Con icono',
          FilledButton.icon(
            onPressed: _noop,
            icon: Icon(Icons.arrow_forward),
            label: Text('Continuar'),
          ),
        ),
        _Variant(
          'Tonal',
          FilledButton.tonal(onPressed: _noop, child: Text('Continuar')),
        ),
        _Variant(
          'Deshabilitado',
          FilledButton(onPressed: null, child: Text('Continuar')),
        ),
      ],
      'text-field' => const <_Variant>[
        _Variant(
          'Outlined',
          TextField(decoration: InputDecoration(labelText: 'Nombre')),
        ),
        _Variant(
          'Con icono',
          TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
        ),
        _Variant(
          'Contraseña',
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Contraseña'),
          ),
        ),
        _Variant(
          'Con error',
          TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
              errorText: 'Correo no válido',
            ),
          ),
        ),
      ],
      _ => <_Variant>[
        _Variant(
          'Normal',
          _NamedVariant(name: component.name, icon: Icons.check_circle_outline),
        ),
        _Variant(
          'Deshabilitado',
          _NamedVariant(name: component.name, icon: Icons.block),
        ),
        _Variant(
          'Alternativa',
          _NamedVariant(name: component.name, icon: Icons.tune),
        ),
      ],
    };

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: <Widget>[
        Text('Variantes', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xs),
        Text('Estados y presentaciones disponibles para ${component.name}.'),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 720 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: variants.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                mainAxisExtent: 180,
              ),
              itemBuilder: (context, index) {
                final variant = variants[index];
                return Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          variant.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Center(child: variant.preview),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

void _noop() {}

class _Variant {
  const _Variant(this.name, this.preview);

  final String name;
  final Widget preview;
}

class _NamedVariant extends StatelessWidget {
  const _NamedVariant({required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: AppSpacing.sm),
        Flexible(child: Text(name, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
