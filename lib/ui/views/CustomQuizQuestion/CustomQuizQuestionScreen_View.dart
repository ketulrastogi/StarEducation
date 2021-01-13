import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/CustomQuizQuestion/CustomQuizQuestionScreen_ViewModel.dart';
import 'package:stareducation/ui/widgets/QuestionCard/QuestionCardWidget_View.dart';

class CustomQuizQuestionScreenView extends StatelessWidget {
  final String subjectId;
  final String topicIdList;
  final String mutliple;
  final String trueFalse;
  final String oneWord;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  CustomQuizQuestionScreenView(
      {Key key,
      this.subjectId,
      this.topicIdList,
      this.mutliple,
      this.trueFalse,
      this.oneWord})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomQuizQuestionScreenViewModel>.reactive(
      viewModelBuilder: () => CustomQuizQuestionScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Chapters',
            ),
            titleSpacing: 4.0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: QuestionCardWidgetView(
                key: _globalKey,
                exerciseId: subjectId,
                questionGroup: 'custom_quiz',
                questionType: 'custom_quiz',
                color: Theme.of(context).primaryColor,
                customQuizData: {
                  'topicIdList': topicIdList,
                  'multiple': mutliple,
                  'trueFalse': trueFalse,
                  'oneWord': oneWord,
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
