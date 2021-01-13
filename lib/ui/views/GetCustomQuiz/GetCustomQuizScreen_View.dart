import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/GetCustomQuiz/GetCustomQuizScreen_ViewModel.dart';

class GetCustomQuizScreenView extends StatelessWidget {
  final String subjectId;
  final String topicIdList;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GetCustomQuizScreenView({Key key, this.subjectId, this.topicIdList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GetCustomQuizScreenViewModel>.reactive(
      onModelReady: (model) async => model.loadData(subjectId, topicIdList),
      viewModelBuilder: () => GetCustomQuizScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Choose Questions',
            ),
            titleSpacing: 4.0,
          ),
          bottomNavigationBar: (model.quizData != null)
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'START',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print('Form Validate');
                        model.startQuiz(subjectId, topicIdList);
                      }
                    },
                  ),
                )
              : SizedBox(),
          body: (model.quizData != null)
              ? Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Question Type',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Total Que',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Que Nos',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'One Word',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '${model.quizData['one_word']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: TextFormField(
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              model
                                                  .setOneWord(int.parse(value));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'True/False',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '${model.quizData['true_false']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: TextFormField(
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              model.setTrueFalse(
                                                  int.parse(value));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Multiple Choice',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '${model.quizData['multiple']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  // color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: TextFormField(
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              model.setMultiple(
                                                  int.parse(value));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            height: 320.0,
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Instructions To Follow',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  // height: 100.0,
                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: false,
                                    children: [
                                      ListTile(
                                        leading: Text('1.'),
                                        title: Text(
                                          'You will get multiple attempt before submit the quiz.',
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text('2.'),
                                        title: Text(
                                          'Please ensure that you have reliable internet and power for the whole duration of the quiz.',
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text('3.'),
                                        title: Text(
                                          'You can not pause the test.',
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text('4.'),
                                        title: Text(
                                          'Evaluate all options carefully.',
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text('5.'),
                                        title: Text(
                                          '1 mark is awarded for correct attempts and this quiz has not negative marking.',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
