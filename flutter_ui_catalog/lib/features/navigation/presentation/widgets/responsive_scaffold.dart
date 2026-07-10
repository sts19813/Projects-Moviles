import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/constants/app_breakpoints.dart';
import 'package:go_router/go_router.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _destinations = <_NavigationItem>[
    _NavigationItem('Inicio', Icons.home_outlined, Icons.home),
    _NavigationItem('Catálogo', Icons.widgets_outlined, Icons.widgets),
    _NavigationItem('Favoritos', Icons.favorite_outline, Icons.favorite),
    _NavigationItem('Configuración', Icons.settings_outlined, Icons.settings),
  ];

  void _selectDestination(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final usesRail = width >= AppBreakpoints.compact;

    if (usesRail) {
      return Scaffold(
        body: Row(
          children: <Widget>[
            SafeArea(
              child: NavigationRail(
                extended: width >= AppBreakpoints.expanded,
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: _selectDestination,
                labelType: width >= AppBreakpoints.expanded
                    ? NavigationRailLabelType.none
                    : NavigationRailLabelType.all,
                destinations: _destinations
                    .map(
                      (item) => NavigationRailDestination(
                        icon: Icon(item.icon),
                        selectedIcon: Icon(item.selectedIcon),
                        label: Text(item.label),
                      ),
                    )
                    .toList(growable: false),
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _selectDestination,
        destinations: _destinations
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _NavigationItem {
  const _NavigationItem(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
