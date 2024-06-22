import 'package:flutter/material.dart';

class ImageInteractiveViewer extends StatefulWidget {
  const ImageInteractiveViewer({super.key, required this.child});

  final Widget child;

  @override
  State<ImageInteractiveViewer> createState() => _ImageInteractiveViewerState();
}

class _ImageInteractiveViewerState extends State<ImageInteractiveViewer> {
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _controller,
      boundaryMargin: const EdgeInsets.all(20.0),
      onInteractionEnd: (details) {
        _controller.value = Matrix4.identity();
      },
      minScale: 0.1,
      maxScale: 5,
      child: widget.child,
    );
  }
}
