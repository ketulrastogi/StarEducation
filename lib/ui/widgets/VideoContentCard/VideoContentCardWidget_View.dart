import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/widgets/VideoContentCard/VideoContentCardWidget_ViewModel.dart';
import 'package:video_player/video_player.dart';

class VideoContentCardWidgetView extends StatefulWidget {
  final String videoUrl;

  const VideoContentCardWidgetView({Key key, this.videoUrl}) : super(key: key);
  @override
  _VideoContentCardWidgetViewState createState() =>
      _VideoContentCardWidgetViewState();
}

class _VideoContentCardWidgetViewState
    extends State<VideoContentCardWidgetView> {
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4');
    await _videoPlayerController1.initialize();
    // _videoPlayerController2 = VideoPlayerController.network(
    //     'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4');
    // await _videoPlayerController2.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoContentCardWidgetViewModel>.reactive(
      viewModelBuilder: () => VideoContentCardWidgetViewModel(),
      builder: (context, model, child) {
        return Card(
          child: Container(
            height: 230.0,
            padding: EdgeInsets.all(4.0),
            child: _chewieController != null &&
                    _chewieController.videoPlayerController.value.initialized
                ? Chewie(
                    controller: _chewieController,
                  )
                : Center(
                    child: Container(
                      height: 32.0,
                      width: 32.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
