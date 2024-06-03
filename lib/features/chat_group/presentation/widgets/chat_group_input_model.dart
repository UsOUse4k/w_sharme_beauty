import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart';

class ChatGroupInputModal extends StatefulWidget {
  final Uint8List imageFile;
  final String communityId;
  final String groupId;

  const ChatGroupInputModal({
    required this.imageFile,
    required this.groupId,
    required this.communityId,
  });

  @override
  _ChatGroupInputModalState createState() => _ChatGroupInputModalState();
}

class _ChatGroupInputModalState extends State<ChatGroupInputModal> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.memory(
            widget.imageFile,
            fit: BoxFit.cover,
          ),
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
              context.read<SendMessageGroupBloc>().add(
                    SendMessageGroupEvent.sendMessage(
                      groupId: widget.groupId,
                      message: _captionController.text,
                      communityId: widget.communityId,
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
