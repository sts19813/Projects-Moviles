import 'package:flutter/material.dart';

class CircularImageDemo extends StatelessWidget {
  const CircularImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 72,
      backgroundImage: AssetImage('assets/branding/app_icon.png'),
    );
  }
}
