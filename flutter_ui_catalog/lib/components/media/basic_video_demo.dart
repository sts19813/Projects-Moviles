import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class BasicVideoDemo extends StatefulWidget {
  const BasicVideoDemo({super.key});

  @override
  State<BasicVideoDemo> createState() => _BasicVideoDemoState();
}

class _BasicVideoDemoState extends State<BasicVideoDemo> {
  bool _playing = false;
  double _position = 0.3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ColoredBox(
              color: Colors.black87,
              child: Center(
                child: IconButton.filled(
                  tooltip: _playing ? 'Pausar' : 'Reproducir',
                  onPressed: () => setState(() => _playing = !_playing),
                  icon: Icon(_playing ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Slider(
            value: _position,
            onChanged: (value) => setState(() => _position = value),
          ),
          Text(_playing ? 'Reproduciendo demo' : 'Video en pausa'),
        ],
      ),
    );
  }
}
