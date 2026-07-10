import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';

extension ComponentPlatformPresentation on ComponentPlatform {
  String get label => switch (this) {
    ComponentPlatform.material => 'Material',
    ComponentPlatform.cupertino => 'Cupertino',
    ComponentPlatform.adaptive => 'Adaptativo',
  };

  IconData get icon => switch (this) {
    ComponentPlatform.material => Icons.android,
    ComponentPlatform.cupertino => Icons.apple,
    ComponentPlatform.adaptive => Icons.devices,
  };
}

extension ComponentLevelPresentation on ComponentLevel {
  String get label => switch (this) {
    ComponentLevel.basic => 'Básico',
    ComponentLevel.advanced => 'Avanzado',
  };
}

IconData iconForCategory(String categoryId) => switch (categoryId) {
  'buttons' => Icons.smart_button,
  'inputs' => Icons.edit_note,
  'cards' => Icons.credit_card,
  'navigation' => Icons.alt_route,
  'dialogs' => Icons.chat_bubble_outline,
  'lists' => Icons.view_list,
  'feedback' => Icons.tips_and_updates_outlined,
  'data-display' => Icons.bar_chart,
  'charts' => Icons.insights,
  'layout' => Icons.dashboard_outlined,
  'media' => Icons.perm_media_outlined,
  'animations' => Icons.animation,
  _ => Icons.widgets_outlined,
};
