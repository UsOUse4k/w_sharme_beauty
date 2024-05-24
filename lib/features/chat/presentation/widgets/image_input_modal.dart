import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart';

class ImageInputModal extends StatefulWidget {
  final Uint8List imageFile;
  final String userId;
  final String chatRoomId;

  const ImageInputModal({
    required this.imageFile,
    required this.userId,
    required this.chatRoomId,
  });

  @override
  _ImageInputModalState createState() => _ImageInputModalState();
}

class _ImageInputModalState extends State<ImageInputModal> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.memory(widget.imageFile, fit: BoxFit.cover,),
          SizedBox(height: 20.h),
          TextField(
            controller: _captionController,
            decoration: const InputDecoration(
              hintText: 'Добавить подпись..',
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            child: const Icon(
              Icons.send,
              color: AppColors.purple,
            ),
            onPressed: () {
              context.read<SendMessageBloc>().add(
                    SendMessageEvent.sendMessage(
                      chatRoomId: widget.chatRoomId,
                      message: _captionController.text,
                      receiverId: widget.userId,
                      file: widget.imageFile,
                    ),
                  );
              _captionController.clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}
