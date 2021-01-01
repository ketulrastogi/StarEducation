import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/constants/const.dart';
import 'package:stareducation/ui/views/TopicDetails/TopicDetailsScreen_ViewModel.dart';

class TopicDetailsScreenView extends StatelessWidget {
  final Map<String, dynamic> topicDetails;

  const TopicDetailsScreenView({Key key, this.topicDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Topic Details: $topicDetails');
    return ViewModelBuilder<TopicDetailsScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(topicDetails),
      viewModelBuilder: () => TopicDetailsScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${topicDetails['topic_name']}',
            ),
            titleSpacing: 4.0,
          ),
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: (model.topicInfo != null)
                    ? Image.network(
                        '$imageBaseUrl${model.topicInfo['top_thumbnail']}',
                        fit: BoxFit.fill,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: MaterialButton(
                  height: 56.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  color: model.topicInfo != null &&
                          model.topicInfo['topic_concept'] == ''
                      ? Colors.green
                      : Colors.pink,
                  child: Text(
                      (model.topicInfo != null &&
                              model.topicInfo['concept_type'] == '')
                          ? 'Exercise'
                          : 'Concept',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                  onPressed: () {
                    model.navigateToConceptOrExerciseScreen(
                        model.topicInfo,
                        model.topicInfo != null &&
                            model.topicInfo['concept_type'] == '');
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              (model.topicInfo != null && model.topicInfo['concept_type'] == '')
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: MaterialButton(
                        height: 56.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        color: Colors.blue.shade800,
                        child: Text('Task',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                        onPressed: () {},
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
