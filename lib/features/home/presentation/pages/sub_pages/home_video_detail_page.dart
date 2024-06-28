import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class HomeVideoDetailPage extends StatefulWidget {
  const HomeVideoDetailPage({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  _HomeVideoDetailPageState createState() => _HomeVideoDetailPageState();
}

class _HomeVideoDetailPageState extends State<HomeVideoDetailPage> {
  late VideoPlayerController _controller;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        _controller.setVolume(_isMuted ? 0.0 : 1.0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSound() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
                onTap: _toggleSound,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      if (_isMuted) _buildPlayButton(),
                    ],
                  ),
                ),
              )
            : const CircularProgressIndicator(
                color: AppColors.purple,
              ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: () {
        _toggleSound();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: Icon(
          _isMuted ? Icons.volume_off : Icons.volume_up,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
