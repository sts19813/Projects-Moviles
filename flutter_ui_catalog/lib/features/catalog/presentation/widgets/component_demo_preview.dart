import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/components/buttons/adaptive_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/cupertino_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/elevated_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/filled_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/floating_action_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/icon_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/outlined_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/text_button_demo.dart';
import 'package:flutter_ui_catalog/components/cards/card_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/checkbox_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/cupertino_switch_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/date_picker_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/dropdown_menu_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/radio_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/slider_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/switch_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/text_field_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/text_form_field_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/time_picker_demo.dart';
import 'package:flutter_ui_catalog/components/lists/expansion_tile_demo.dart';
import 'package:flutter_ui_catalog/components/lists/grid_view_demo.dart';
import 'package:flutter_ui_catalog/components/lists/list_tile_demo.dart';
import 'package:flutter_ui_catalog/components/lists/page_view_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/drawer_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/navigation_bar_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/navigation_rail_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/stepper_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/tab_bar_demo.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_visuals.dart';

class ComponentDemoPreview extends StatelessWidget {
  const ComponentDemoPreview({
    required this.component,
    required this.configuration,
    super.key,
  });

  final CatalogComponent component;
  final DemoConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    return switch (component.id) {
      'filled-button' => FilledButtonDemo(configuration: configuration),
      'elevated-button' => const ElevatedButtonDemo(),
      'outlined-button' => const OutlinedButtonDemo(),
      'text-button' => const TextButtonDemo(),
      'icon-button' => const IconButtonDemo(),
      'floating-action-button' => const FloatingActionButtonDemo(),
      'cupertino-button' => const CupertinoButtonDemo(),
      'adaptive-button' => const AdaptiveButtonDemo(),
      'text-field' => TextFieldDemo(configuration: configuration),
      'text-form-field' => const TextFormFieldDemo(),
      'dropdown-menu' => const DropdownMenuDemo(),
      'checkbox' => const CheckboxDemo(),
      'radio' => const RadioDemo(),
      'switch' => const SwitchDemo(),
      'slider' => const SliderDemo(),
      'date-picker' => const DatePickerDemo(),
      'time-picker' => const TimePickerDemo(),
      'cupertino-switch' => const CupertinoSwitchDemo(),
      'card' => const CardDemo(),
      'list-tile' => const ListTileDemo(),
      'expansion-tile' => const ExpansionTileDemo(),
      'grid-view' => const GridViewDemo(),
      'page-view' => const PageViewDemo(),
      'navigation-bar' => const NavigationBarDemo(),
      'navigation-rail' => const NavigationRailDemo(),
      'drawer' => const DrawerDemo(),
      'tab-bar' => const TabBarDemo(),
      'stepper' => const StepperDemo(),
      _ => _PendingPreview(component: component),
    };
  }
}

class _PendingPreview extends StatelessWidget {
  const _PendingPreview({required this.component});

  final CatalogComponent component;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(iconForCategory(component.categoryId), size: 56),
        const SizedBox(height: AppSpacing.md),
        Text(component.name, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.xs),
        const Text(
          'Vista registrada; la implementación avanzada se añadirá en la Fase 6.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
