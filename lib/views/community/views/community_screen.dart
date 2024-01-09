import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hockey_app/consts/app_text_styles/news_text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
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
    _controllers = {
      for (var video in videos) video.videoId: _createController(video.videoId)
    };
  }

  YoutubePlayerController _createController(String videoId) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community Screen',
          style: OnboardingTextStyle.screenTitle,
        ),
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            var video = videos[index];
            YoutubePlayerController controller = _controllers[video.videoId]!;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: AppColors.darkGreyColor,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      video.title,
                      style: NewsTextStyle.articleTitle,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                      ),
                      builder: (context, player) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            player,
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Sorry, full screen option isn\'t available.'),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: AppColors.darkGreyColor,
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: size.width * 0.1,
                                  width: size.width * 0.1,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
