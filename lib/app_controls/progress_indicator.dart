import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override

  int currentStep;

  ProgressBar({this.currentStep});

  Widget build(BuildContext context) {
    return Container(
      child:
      StepProgressIndicator(
        totalSteps: 5,
        currentStep: currentStep,
        size: 10,
        selectedColor: Colors.greenAccent,
        unselectedColor: Colors.white24,
        roundedEdges: Radius.circular(10),
      ),
    );
  }
}
