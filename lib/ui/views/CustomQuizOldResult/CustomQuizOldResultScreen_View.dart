import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/CustomQuizOldResult/CustomQuizOldResultScreen_ViewModel.dart';

class CustomQuizOldResultScreenView extends StatelessWidget {
  final String subjectId;

  const CustomQuizOldResultScreenView({Key key, this.subjectId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomQuizOldResultScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(subjectId),
      viewModelBuilder: () => CustomQuizOldResultScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Custom Quiz Result',
            ),
            titleSpacing: 4.0,
          ),
          body: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: model.quizResultList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(
                    '${index + 1}.',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  title: Text(
                    model.quizResultList[index]['quiz_time'],
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Text(
                    model.quizResultList[index]['score'],
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onTap: () {
                    model.navigateToCustomQuizOldResultScreen(
                        model.quizResultList[index]['quiz_id']);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
