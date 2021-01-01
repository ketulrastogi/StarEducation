import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ExerciseQuestion/ExerciseQuestionScreen_ViewModel.dart';

class ExerciseQuesttionScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExerciseQuestionScreenViewModel>.reactive(
      viewModelBuilder: () => ExerciseQuestionScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold();
      },
    );
  }
}
