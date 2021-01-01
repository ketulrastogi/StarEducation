import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ChapterProgress/ChapterProgressScreen_ViewModel.dart';

class ChapterProgressScreenView extends StatelessWidget {
  final Map<String, dynamic> subjectDetails;

  const ChapterProgressScreenView({Key key, this.subjectDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChapterProgressScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(subjectDetails['sub_id']),
      viewModelBuilder: () => ChapterProgressScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Chapters Progress',
            ),
            titleSpacing: 4.0,
          ),
          body: (model.isBusy)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: model.chapterProgressList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              '${model.chapterProgressList[index]['chapter_name']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProgressBarItemWidget(
                                  color: Colors.blue.shade800,
                                  title: 'Task',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['task']}%',
                                ),
                                ProgressBarItemWidget(
                                  color: Colors.red,
                                  title: 'See',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['see']}%',
                                ),
                                ProgressBarItemWidget(
                                  color: Colors.yellow.shade800,
                                  title: 'Try',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['try']}%',
                                ),
                                ProgressBarItemWidget(
                                  color: Colors.green,
                                  title: 'Apply',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['apply']}%',
                                ),
                                ProgressBarItemWidget(
                                  color: Colors.purple,
                                  title: 'Revise',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['revise']}%',
                                ),
                                ProgressBarItemWidget(
                                  color: Colors.pinkAccent.shade400,
                                  title: 'Quiz',
                                  percentage:
                                      '${model.chapterProgressList[index]['progress']['quiz']}%',
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
                ),
        );
      },
    );
  }
}

class ProgressBarItemWidget extends StatelessWidget {
  final String title;
  final String percentage;
  final Color color;

  const ProgressBarItemWidget(
      {Key key, this.title, this.percentage, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            child: Text(
              percentage,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
