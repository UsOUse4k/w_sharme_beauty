import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class PostVideoPlay extends StatefulWidget {
  const PostVideoPlay({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
    this.onTap,
  });
  final String videoUrl;
  final double? height;
  final double? width;
  final Function()? onTap;

  @override
  State<PostVideoPlay> createState() => _PostVideoPlayState();
}

class _PostVideoPlayState extends State<PostVideoPlay> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isControlsVisible = true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              widget.onTap?.call();
              toggleControls();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 394.h,
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_videoPlayerController),
                        if (_isControlsVisible) _buildPlayButton(),
                      ],
                    ),
                  ),
                ),
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

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: () {
        if (_videoPlayerController.value.isPlaying) {
          _videoPlayerController.pause();
        } else {
          _videoPlayerController.play();
        }
        toggleControls();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
          color: Colors.white,
          size: 50.sp,
        ),
      ),
    );
  }
}
