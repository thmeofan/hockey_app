import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../consts/app_colors.dart';
import '../../../data/models/video_model.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Map<String, YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = Map.fromIterable(videos,
        key: (video) => video.videoId,
        value: (video) => _createController(video.videoId));
  }

  YoutubePlayerController _createController(String videoId) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community Screen',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            var video = videos[index];
            YoutubePlayerController _controller = _controllers[video.videoId]!;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: AppColors.darkGreyColor,
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      video.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      liveUIColor: AppColors.lightBlueColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
