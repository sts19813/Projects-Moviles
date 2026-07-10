import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: _expanded ? 220 : 120,
        height: _expanded ? 140 : 120,
        decoration: BoxDecoration(
          color: _expanded ? colors.tertiaryContainer : colors.primaryContainer,
          borderRadius: BorderRadius.circular(_expanded ? 32 : 12),
        ),
        alignment: Alignment.center,
        child: Text(_expanded ? 'Expandido' : 'Tócame'),
      ),
    );
  }
}
