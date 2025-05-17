//

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MatchVideoController extends GetxController {
  RxString currentVideoId = ''.obs;
  YoutubePlayerController? youtubeController;

  void initialize(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) return;

    if (youtubeController != null) {
      youtubeController!.pause();
      youtubeController!.dispose();
    }

    currentVideoId.value = videoId;

    youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        autoPlay: true,
        mute: false,
        hideControls: false,
      ),
    );
  }

  void reset() {
    currentVideoId.value = '';
    youtubeController?.pause();
    youtubeController?.dispose();
    youtubeController = null;
  }

  bool isCurrentVideo(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    return currentVideoId.value == videoId;
  }

  @override
  void onClose() {
    youtubeController?.dispose();
    super.onClose();
  }
}
