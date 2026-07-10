import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatelessWidget {
  const CustomScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 240,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(pinned: true, title: Text('CustomScrollView')),
          SliverList.builder(
            itemCount: 8,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Elemento ${index + 1}'),
            ),
          ),
        ],
      ),
    );
  }
}
