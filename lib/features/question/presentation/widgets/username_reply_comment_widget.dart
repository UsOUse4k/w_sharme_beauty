import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';

class UsernameReplyCommentWidget extends StatelessWidget {
  const UsernameReplyCommentWidget({super.key, required this.username, required this.controller});

  final String username;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 5,
      ),
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(username),
          GestureDetector(
            onTap: () {
              controller.clear();
              context.read<ParentCommentIdBloc>().add(
                    const ParentCommentIdEvent.addParentCommentId('', ''),
                  );
            },
            child: const Icon(
              Icons.close,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}
