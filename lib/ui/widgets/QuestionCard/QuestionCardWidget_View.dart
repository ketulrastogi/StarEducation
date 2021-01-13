import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/widgets/QuestionCard/QuestionCardWidget_ViewModel.dart';
import 'package:stareducation/constants/const.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuestionCardWidgetView extends StatelessWidget {
  final String exerciseId;
  final String questionGroup;
  final String questionType;
  final Color color;
  final Map<String, dynamic> customQuizData;

  QuestionCardWidgetView(
      {Key key,
      this.exerciseId,
      this.questionGroup,
      this.questionType,
      this.color,
      this.customQuizData})
      : super(key: key);

  final TextEditingController _answerController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final unescape = new HtmlUnescape();
  @override
  Widget build(BuildContext context) {
    // print('ExerciseId: ${widget.exerciseId}');

    return ViewModelBuilder<QuestionCardWidgetViewModel>.reactive(
      onModelReady: (model) async => model.loadQuestion(
        exerciseId,
        questionGroup,
        questionType,
        customQuizData: customQuizData,
      ),
      viewModelBuilder: () => QuestionCardWidgetViewModel(),
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: (model.questionList != null &&
                        model.questionList.length > 0)
                    ? ListView(
                        padding: EdgeInsets.all(16.0),
                        children: [
                          Container(
                            child: Text(
                              'Q.${model.questionList.indexOf(model.currentQuestion) + 1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: Html(
                              data: unescape.convert(
                                '${model.currentQuestion['title']}',
                              ),
                              style: {
                                "div": Style(
                                  fontSize: FontSize(24.0),
                                  // textStyle: TextStyle(
                                  //   color: Colors.red,
                                  // ),
                                ),
                              },
                            ),
                            // child: Text(
                            //   model.currentQuestion['title'],
                            //   style: Theme.of(context).textTheme.headline5,
                            //   // .copyWith(color: Theme.of(context).primaryColor),
                            // ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          if (model.currentQuestion.containsKey('hint'))
                            Container(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                onPressed: () {
                                  model.setHintVisibility();
                                },
                                child: Text(
                                  'Scaffold Hint',
                                  // style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                          (model.hintVisible)
                              ? (model.currentQuestion['hint_type'] == 'image')
                                  ? Container(
                                      height: 200.0,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      // decoration:
                                      // BoxDecoration(color: Colors.red.shade100),
                                      child: Center(
                                        child: Image.network(
                                          '$hintImageBaseUrl${model.currentQuestion['hint']}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  : (model.currentQuestion['hint_type'] ==
                                          'content')
                                      ? Container(
                                          child: Html(
                                            data: unescape.convert(
                                              '${model.currentQuestion['hint']}',
                                            ),
                                            style: {
                                              "div": Style(
                                                  // fontSize: FontSize(24.0),
                                                  // textStyle: TextStyle(
                                                  //   color: Colors.red,
                                                  // ),
                                                  ),
                                            },
                                          ),
                                          // child: Text(
                                          //     model.currentQuestion['hint']),
                                        )
                                      : YoutubePlayer(
                                          controller: YoutubePlayerController(
                                            initialVideoId:
                                                model.currentQuestion['hint'],
                                            flags: YoutubePlayerFlags(
                                              autoPlay: false,
                                              mute: false,
                                            ),
                                          ),
                                          showVideoProgressIndicator: true,
                                          progressIndicatorColor:
                                              Theme.of(context).accentColor,
                                          progressColors: ProgressBarColors(
                                            playedColor:
                                                Theme.of(context).accentColor,
                                            handleColor:
                                                Theme.of(context).accentColor,
                                          ),
                                          onReady: () {
                                            // _controller.addListener(listener);
                                          },
                                        )
                              : SizedBox(),
                          SizedBox(
                            height: 16.0,
                          ),
                          if (model.currentQuestion['type'] == 'one_word')
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: _answerController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Answer can not be empty';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Container(
                                    child: MaterialButton(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.0),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          model.setAnswer(
                                              _answerController.text.trim());
                                          _answerController.text = '';
                                        }
                                      },
                                      child: Text('Submit'),
                                      textColor: Colors.white,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (model.currentQuestion['type'] == 'true_false')
                            Container(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  RadioListTile<String>(
                                    title: const Text('True'),
                                    value: 'True',
                                    groupValue: model.answer,
                                    onChanged: (String value) {
                                      model.setAnswer(value);
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('False'),
                                    value: 'False',
                                    groupValue: model.answer,
                                    onChanged: (String value) {
                                      model.setAnswer(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          if (model.currentQuestion['type'] ==
                              'multiple_choice')
                            Container(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  ...model.currentQuestion['options']
                                      .map((option) {
                                    return RadioListTile<String>(
                                      title: Text(option.toString()),
                                      value: option.toString(),
                                      groupValue: model.answer,
                                      onChanged: (String value) {
                                        model.setAnswer(value);
                                      },
                                    );
                                  }).toList()
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 32.0,
                          ),
                          if (model.answerVisible)
                            Text(
                              'Correct Answer: ${model.currentQuestion['correct_answers']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          SizedBox(
                            height: 32.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (model.questionList
                                            .indexOf(model.currentQuestion) >
                                        0)
                                    ? FlatButton(
                                        onPressed: () {
                                          model.setCurrentQuestion(model
                                              .questionList[model.questionList
                                                  .indexOf(
                                                      model.currentQuestion) -
                                              1]);

                                          model.setAnswerAsNull();
                                          model.setAnswerVisibility(false);
                                        },
                                        child: Text(
                                          'Previous',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      )
                                    : SizedBox(),
                                (model.questionList
                                            .indexOf(model.currentQuestion) <
                                        model.questionList.length - 1)
                                    ? FlatButton(
                                        onPressed: () {
                                          model.setCurrentQuestion(model
                                              .questionList[model.questionList
                                                  .indexOf(
                                                      model.currentQuestion) +
                                              1]);

                                          model.setAnswerAsNull();
                                          model.setAnswerVisibility(false);
                                        },
                                        child: Text(
                                          'Next',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                        ],
                      )
                    : Center(
                        child: (model.questionList.length == 0)
                            ? Text(
                                model.message,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            : CircularProgressIndicator(),
                      ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              onPressed: () async {
                await model.submitQuestionsAndSetQuizScore(
                  exerciseId,
                  questionType,
                );
              },
              color: color,
              child: Text('Submit'),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
