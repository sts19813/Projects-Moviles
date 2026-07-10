import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: 480,
      child: Stepper(
        currentStep: _step,
        onStepTapped: (step) => setState(() => _step = step),
        onStepContinue: () {
          if (_step < 2) {
            setState(() => _step += 1);
          }
        },
        onStepCancel: () {
          if (_step > 0) {
            setState(() => _step -= 1);
          }
        },
        steps: const <Step>[
          Step(title: Text('Cuenta'), content: Text('Datos de acceso')),
          Step(title: Text('Perfil'), content: Text('Información personal')),
          Step(title: Text('Confirmar'), content: Text('Revisa los datos')),
        ],
      ),
    );
  }
}
