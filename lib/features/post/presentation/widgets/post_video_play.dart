import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostVidePlay extends StatefulWidget {
  const PostVidePlay({super.key, required this.videoController});

  final VideoPlayerController videoController;

  @override
  State<PostVidePlay> createState() => _PostVidePlayState();
}

class _PostVidePlayState extends State<PostVidePlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: widget.videoController.value.aspectRatio,
          child: VideoPlayer(widget.videoController),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          child: widget.videoController.value.isPlaying
              ? const SizedBox
                  .shrink() // Не показываем иконку если видео играет
              : Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ),
        ),
      ],
    );
  }
}
