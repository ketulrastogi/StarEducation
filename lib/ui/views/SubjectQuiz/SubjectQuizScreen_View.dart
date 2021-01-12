import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stareducation/ui/views/SubjectQuiz/SubjectQuizScreen_ViewModel.dart';
import 'package:stareducation/ui/widgets/QuestionCard/QuestionCardWidget_View.dart';

class SubjectQuizScreenView extends StatefulWidget {
  final Map<String, dynamic> quizDetails;

  const SubjectQuizScreenView({Key key, this.quizDetails}) : super(key: key);

  @override
  _SubjectQuizScreenViewState createState() => _SubjectQuizScreenViewState();
}

class _SubjectQuizScreenViewState extends State<SubjectQuizScreenView> {
  CountdownTimerController controller;
  int endTime;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().millisecondsSinceEpoch +
        1000 * 60 * int.parse(widget.quizDetails['quiz_time']);
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubjectQuizScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(widget.quizDetails),
      viewModelBuilder: () => SubjectQuizScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${widget.quizDetails['quiz_title']}',
            ),
            titleSpacing: 4.0,
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountdownTimer(
                    controller: controller,
                    widgetBuilder: (_, CurrentRemainingTime time) {
                      if (time == null) {
                        return Text('Game over');
                      }
                      // return Row(
                      //   children: [
                      //     Text('${time.hours != null ? time.hours : ''}'),
                      //     Text('${time.min != null ? time.min : ''}'),
                      //     Text('${time.sec != null ? time.sec : ''}'),
                      //   ],
                      // );
                      return Text(
                        '${time.min}:${time.sec}',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: QuestionCardWidgetView(
                key: _globalKey,
                exerciseId: widget.quizDetails['quiz_id'],
                questionGroup: 'subject_quiz',
                questionType: 'subject_quiz',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
