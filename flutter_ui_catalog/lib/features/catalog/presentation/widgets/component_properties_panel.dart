import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_visuals.dart';

class ComponentPropertiesPanel extends StatelessWidget {
  const ComponentPropertiesPanel({
    required this.component,
    required this.configuration,
    required this.onChanged,
    required this.onReset,
    super.key,
  });

  final CatalogComponent component;
  final DemoConfiguration configuration;
  final ValueChanged<DemoConfiguration> onChanged;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Playground de propiedades',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            TextButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restablecer'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text('Los cambios se reflejan en la vista previa y el código.'),
        const SizedBox(height: AppSpacing.lg),
        if (component.id == 'filled-button')
          _ButtonProperties(configuration: configuration, onChanged: onChanged)
        else if (component.id == 'text-field')
          _TextFieldProperties(
            configuration: configuration,
            onChanged: onChanged,
          )
        else
          _ReadOnlyProperties(component: component),
      ],
    );
  }
}

class _ButtonProperties extends StatelessWidget {
  const _ButtonProperties({
    required this.configuration,
    required this.onChanged,
  });

  final DemoConfiguration configuration;
  final ValueChanged<DemoConfiguration> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          initialValue: configuration.buttonLabel,
          decoration: const InputDecoration(labelText: 'Texto'),
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonLabel: value));
          },
        ),
        const SizedBox(height: AppSpacing.md),
        Text('Tamaño', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        SegmentedButton<DemoButtonSize>(
          segments: const <ButtonSegment<DemoButtonSize>>[
            ButtonSegment<DemoButtonSize>(
              value: DemoButtonSize.small,
              label: Text('S'),
            ),
            ButtonSegment<DemoButtonSize>(
              value: DemoButtonSize.medium,
              label: Text('M'),
            ),
            ButtonSegment<DemoButtonSize>(
              value: DemoButtonSize.large,
              label: Text('L'),
            ),
          ],
          selected: <DemoButtonSize>{configuration.buttonSize},
          onSelectionChanged: (selection) {
            onChanged(configuration.copyWith(buttonSize: selection.first));
          },
        ),
        const SizedBox(height: AppSpacing.md),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Habilitado'),
          value: configuration.buttonEnabled,
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonEnabled: value));
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cargando'),
          value: configuration.buttonLoading,
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonLoading: value));
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mostrar icono'),
          value: configuration.buttonShowIcon,
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonShowIcon: value));
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Ancho completo'),
          value: configuration.buttonFullWidth,
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonFullWidth: value));
          },
        ),
        Text(
          'Radio de bordes: ${configuration.buttonRadius.round()} px',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: configuration.buttonRadius,
          min: 0,
          max: 32,
          divisions: 8,
          label: configuration.buttonRadius.round().toString(),
          onChanged: (value) {
            onChanged(configuration.copyWith(buttonRadius: value));
          },
        ),
      ],
    );
  }
}

class _TextFieldProperties extends StatelessWidget {
  const _TextFieldProperties({
    required this.configuration,
    required this.onChanged,
  });

  final DemoConfiguration configuration;
  final ValueChanged<DemoConfiguration> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          initialValue: configuration.fieldLabel,
          decoration: const InputDecoration(labelText: 'Label'),
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldLabel: value));
          },
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          initialValue: configuration.fieldHint,
          decoration: const InputDecoration(labelText: 'Hint'),
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldHint: value));
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Texto oculto'),
          value: configuration.fieldObscureText,
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldObscureText: value));
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mostrar icono'),
          value: configuration.fieldShowIcon,
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldShowIcon: value));
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mostrar error'),
          value: configuration.fieldShowError,
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldShowError: value));
          },
        ),
        Text(
          'Máximo de caracteres: ${configuration.fieldMaxLength}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: configuration.fieldMaxLength.toDouble(),
          min: 10,
          max: 100,
          divisions: 9,
          label: configuration.fieldMaxLength.toString(),
          onChanged: (value) {
            onChanged(configuration.copyWith(fieldMaxLength: value.round()));
          },
        ),
      ],
    );
  }
}

class _ReadOnlyProperties extends StatelessWidget {
  const _ReadOnlyProperties({required this.component});

  final CatalogComponent component;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(component.platform.icon),
            title: const Text('Plataforma'),
            trailing: Text(component.platform.label),
          ),
          ListTile(
            leading: const Icon(Icons.signal_cellular_alt),
            title: const Text('Nivel'),
            trailing: Text(component.level.label),
          ),
          ListTile(
            leading: const Icon(Icons.sell_outlined),
            title: const Text('Etiquetas'),
            subtitle: Text(component.tags.join(', ')),
          ),
        ],
      ),
    );
  }
}
