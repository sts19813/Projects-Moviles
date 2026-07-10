import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';

class FilledButtonDemo extends StatelessWidget {
  const FilledButtonDemo({required this.configuration, super.key});

  final DemoConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    final height = switch (configuration.buttonSize) {
      DemoButtonSize.small => 40.0,
      DemoButtonSize.medium => 48.0,
      DemoButtonSize.large => 56.0,
    };
    final onPressed =
        configuration.buttonEnabled && !configuration.buttonLoading
        ? () => showDemoMessage(context, 'FilledButton presionado')
        : null;
    final style = FilledButton.styleFrom(
      minimumSize: Size(0, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(configuration.buttonRadius),
      ),
    );
    const loader = SizedBox.square(
      dimension: 18,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
    final button = configuration.buttonShowIcon
        ? FilledButton.icon(
            onPressed: onPressed,
            style: style,
            icon: configuration.buttonLoading
                ? loader
                : const Icon(Icons.arrow_forward),
            label: Text(configuration.buttonLabel),
          )
        : FilledButton(
            onPressed: onPressed,
            style: style,
            child: configuration.buttonLoading
                ? loader
                : Text(configuration.buttonLabel),
          );
    return SizedBox(
      width: configuration.buttonFullWidth ? double.infinity : null,
      child: button,
    );
  }
}
