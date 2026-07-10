import 'package:flutter/material.dart';

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 230,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList.separated(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text('Artículo ${index + 1}'),
            ),
            separatorBuilder: (context, index) => const Divider(height: 1),
          ),
        ],
      ),
    );
  }
}
