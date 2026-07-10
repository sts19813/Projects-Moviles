import 'package:flutter/material.dart';

class NavigationRailDemo extends StatefulWidget {
  const NavigationRailDemo({super.key});

  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}

class _NavigationRailDemoState extends State<NavigationRailDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: NavigationRail(
        selectedIndex: _index,
        labelType: NavigationRailLabelType.all,
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: const <NavigationRailDestination>[
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined),
            label: Text('Inicio'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.widgets_outlined),
            label: Text('Catálogo'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text('Ajustes'),
          ),
        ],
      ),
    );
  }
}
