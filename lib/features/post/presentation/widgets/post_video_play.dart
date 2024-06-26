import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class PostVidePlay extends StatefulWidget {
  const PostVidePlay({
    super.key,
    required this.videoUrl, this.height, this.width,
  });
  final String videoUrl;
  final double? height;
  final double? width;


  @override
  State<PostVidePlay> createState() => _PostVidePlayState();
}

class _PostVidePlayState extends State<PostVidePlay> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: widget.height ?? 394.h,
              width: widget.width ?? double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.black,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  VideoPlayer(_videoPlayerController),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: _PlayPauseOverlay(
                      controller: _videoPlayerController,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.purple,
            ),
          );
        }
      },
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, VideoPlayerValue value, child) {
        return GestureDetector(
          onTap: () {
            value.isPlaying ? controller.pause() : controller.play();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: value.isPlaying
                ? const Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 22,
                  )
                : const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
          ),
        );
      },
    );
  }
}
