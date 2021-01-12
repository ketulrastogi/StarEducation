import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/SubjectQuizList/SubjectQuizListScreen_ViewModel.dart';

class SubjectQuizListScreenView extends StatelessWidget {
  final Map<String, dynamic> subjectDetails;

  const SubjectQuizListScreenView({Key key, this.subjectDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubjectQuizListScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(subjectDetails),
      viewModelBuilder: () => SubjectQuizListScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Subject Quiz List',
            ),
            titleSpacing: 4.0,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        '${subjectDetails['subject']}',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      child: Text(
                        '${model.quizList.length} Quiz',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            // color: Theme.of(context).primaryColor,
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (model.quizList.length > 0)
                    ? ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemCount: model.quizList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                  '${index + 1}. ${model.quizList[index]['quiz_title']}'),
                              trailing: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: model.quizList[index]['score'] == ''
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  '${model.quizList[index]['score'] == '' ? 'START' : model.quizList[index]['score']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: model.quizList[index]['score'] ==
                                                ''
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                              onTap: () {
                                model.navigateToSubjectQuizScreenOrResultScreen(
                                    model.quizList[index]);
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2.0,
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
