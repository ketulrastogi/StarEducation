import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/widgets/PopularVideoList/PopularVideoListWidget_ViewModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopularVideoListWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PopularVideoListWidgetViewModel>.reactive(
      onModelReady: (model) => model.getPopularVideos(),
      viewModelBuilder: () => PopularVideoListWidgetViewModel(),
      builder: (context, model, child) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Popular Videos',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey.shade700,
                      ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 150.0,
                child: ListView.builder(
                  // padding: EdgeInsets.only(left: 16.0),
                  itemCount: model.popularVideoList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 200.0,
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: model.popularVideoList[index]
                                ['video_id'],
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
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
