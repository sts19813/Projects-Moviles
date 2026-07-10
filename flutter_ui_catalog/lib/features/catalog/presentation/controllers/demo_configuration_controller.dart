import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DemoButtonSize { small, medium, large }

@immutable
class DemoConfiguration {
  const DemoConfiguration({
    this.buttonLabel = 'Continuar',
    this.buttonSize = DemoButtonSize.medium,
    this.buttonEnabled = true,
    this.buttonLoading = false,
    this.buttonFullWidth = false,
    this.buttonShowIcon = false,
    this.buttonRadius = 12,
    this.fieldLabel = 'Nombre',
    this.fieldHint = 'Escribe tu nombre',
    this.fieldObscureText = false,
    this.fieldShowIcon = true,
    this.fieldShowError = false,
    this.fieldMaxLength = 40,
  });

  final String buttonLabel;
  final DemoButtonSize buttonSize;
  final bool buttonEnabled;
  final bool buttonLoading;
  final bool buttonFullWidth;
  final bool buttonShowIcon;
  final double buttonRadius;
  final String fieldLabel;
  final String fieldHint;
  final bool fieldObscureText;
  final bool fieldShowIcon;
  final bool fieldShowError;
  final int fieldMaxLength;

  DemoConfiguration copyWith({
    String? buttonLabel,
    DemoButtonSize? buttonSize,
    bool? buttonEnabled,
    bool? buttonLoading,
    bool? buttonFullWidth,
    bool? buttonShowIcon,
    double? buttonRadius,
    String? fieldLabel,
    String? fieldHint,
    bool? fieldObscureText,
    bool? fieldShowIcon,
    bool? fieldShowError,
    int? fieldMaxLength,
  }) {
    return DemoConfiguration(
      buttonLabel: buttonLabel ?? this.buttonLabel,
      buttonSize: buttonSize ?? this.buttonSize,
      buttonEnabled: buttonEnabled ?? this.buttonEnabled,
      buttonLoading: buttonLoading ?? this.buttonLoading,
      buttonFullWidth: buttonFullWidth ?? this.buttonFullWidth,
      buttonShowIcon: buttonShowIcon ?? this.buttonShowIcon,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      fieldLabel: fieldLabel ?? this.fieldLabel,
      fieldHint: fieldHint ?? this.fieldHint,
      fieldObscureText: fieldObscureText ?? this.fieldObscureText,
      fieldShowIcon: fieldShowIcon ?? this.fieldShowIcon,
      fieldShowError: fieldShowError ?? this.fieldShowError,
      fieldMaxLength: fieldMaxLength ?? this.fieldMaxLength,
    );
  }
}

class DemoConfigurationsController
    extends Notifier<Map<String, DemoConfiguration>> {
  @override
  Map<String, DemoConfiguration> build() => const <String, DemoConfiguration>{};

  void update(String componentId, DemoConfiguration configuration) {
    state = Map<String, DemoConfiguration>.unmodifiable(
      <String, DemoConfiguration>{...state, componentId: configuration},
    );
  }

  void reset(String componentId) {
    final configurations = Map<String, DemoConfiguration>.of(state)
      ..remove(componentId);
    state = Map<String, DemoConfiguration>.unmodifiable(configurations);
  }
}

final demoConfigurationsProvider =
    NotifierProvider<
      DemoConfigurationsController,
      Map<String, DemoConfiguration>
    >(DemoConfigurationsController.new);
