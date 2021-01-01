import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/TopicConcept/TopicConceptScreen_ViewModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TopicConceptScreenView extends StatelessWidget {
  final Map<String, dynamic> topicDetails;

  const TopicConceptScreenView({Key key, this.topicDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('TopicConcept: $topicDetails');
    return ViewModelBuilder<TopicConceptScreenViewModel>.reactive(
      viewModelBuilder: () => TopicConceptScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${topicDetails['topic_name']} Sample',
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
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: '${topicDetails['topic_video']}',
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Theme.of(context).accentColor,
                  progressColors: ProgressBarColors(
                    playedColor: Theme.of(context).accentColor,
                    handleColor: Theme.of(context).accentColor,
                  ),
                  onReady: () {
                    // _controller.addListener(listener);
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '${topicDetails['topic_concept']}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
