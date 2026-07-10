import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: SizedBox(
        width: 420,
        height: 180,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tab(text: 'Resumen'),
                Tab(text: 'Actividad'),
                Tab(text: 'Archivos'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(child: Text('Resumen')),
                  Center(child: Text('Actividad')),
                  Center(child: Text('Archivos')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
