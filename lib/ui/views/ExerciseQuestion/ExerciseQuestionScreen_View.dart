import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ExerciseQuestion/ExerciseQuestionScreen_ViewModel.dart';
import 'package:stareducation/ui/widgets/QuestionCard/QuestionCardWidget_View.dart';

class ExerciseQuestionScreenView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final String questionType;
  final String questionGroup;
  final Color questionTypeColor;
  final String exerciseId;

  ExerciseQuestionScreenView(
      {Key key,
      this.questionType,
      this.questionTypeColor,
      this.exerciseId,
      this.questionGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ExerciseQuestionScreenView - ExerciseId: $exerciseId');
    return ViewModelBuilder<ExerciseQuestionScreenViewModel>.reactive(
      viewModelBuilder: () => ExerciseQuestionScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              questionType,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
            ),
            titleSpacing: 4.0,
            backgroundColor: questionTypeColor,
          ),
          // floatingActionButton: MaterialButton(
          //   onPressed: () {},
          //   color: questionTypeColor,
          //   child: Text('Submit'),
          //   textColor: Colors.white,
          //   padding: EdgeInsets.symmetric(vertical: 20.0),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(32.0),
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: QuestionCardWidgetView(
                key: _globalKey,
                exerciseId: exerciseId,
                questionGroup: questionGroup.toLowerCase(),
                questionType: questionType.toLowerCase(),
                color: questionTypeColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
