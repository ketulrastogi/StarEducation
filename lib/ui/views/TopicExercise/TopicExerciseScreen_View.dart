import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/TopicExercise/TopicExerciseScreen_ViewModel.dart';

class TopicExerciseScreenView extends StatelessWidget {
  final Map<String, dynamic> topicDetails;

  const TopicExerciseScreenView({Key key, this.topicDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopicExerciseScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(topicDetails),
      viewModelBuilder: () => TopicExerciseScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${topicDetails['topic_name']}',
            ),
            titleSpacing: 4.0,
          ),
          body: (model.exerciseList != null)
              ? ListView.separated(
                  padding: EdgeInsets.only(top: 16.0),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                              '${model.exerciseList[index]['ex_title']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    model.navigateToExerciseQuestionScreenView(
                                        'See',
                                        Colors.red,
                                        '${model.exerciseList[index]['ex_id']}');
                                  },
                                  child: Container(
                                    height: 56.0,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'See',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    model.navigateToExerciseQuestionScreenView(
                                        'Try',
                                        Colors.yellow.shade800,
                                        '${model.exerciseList[index]['ex_id']}');
                                  },
                                  child: Container(
                                    height: 56.0,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.shade800,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Try',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    model.navigateToExerciseQuestionScreenView(
                                        'Apply',
                                        Colors.green,
                                        '${model.exerciseList[index]['ex_id']}');
                                  },
                                  child: Container(
                                    height: 56.0,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Apply',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.0,
                    );
                  },
                  itemCount: model.exerciseList.length,
                )
              : SizedBox(),
        );
      },
    );
  }
}
