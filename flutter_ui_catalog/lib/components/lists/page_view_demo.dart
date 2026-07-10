import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 150,
          width: 320,
          child: PageView(
            onPageChanged: (page) => setState(() => _page = page),
            children: <Widget>[
              ColoredBox(
                color: colors.primaryContainer,
                child: const Center(child: Text('Página 1')),
              ),
              ColoredBox(
                color: colors.secondaryContainer,
                child: const Center(child: Text('Página 2')),
              ),
              ColoredBox(
                color: colors.tertiaryContainer,
                child: const Center(child: Text('Página 3')),
              ),
            ],
          ),
        ),
        Text('Página ${_page + 1} de 3'),
      ],
    );
  }
}
