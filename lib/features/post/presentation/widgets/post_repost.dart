import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_post_bloc/send_post_bloc.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_post_my_screen_bloc/repost_post_my_screen_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_users_bloc/repost_users_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost_button.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost_list_user.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class PostRepost extends StatefulWidget {
  const PostRepost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<PostRepost> createState() => _PostRepostState();
}

class _PostRepostState extends State<PostRepost> {
  @override
  void initState() {
    final uid = firebaseAuth.currentUser!.uid;
    context
        .read<UserDetailBloc>()
        .add(UserDetailEvent.getUserDetail(userId: uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createRoomBloc = context.read<CreateChatroomBloc>();
    final sendPostBloc = context.read<SendPostBloc>();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: BlocConsumer<UserDetailBloc, UserDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (userData) {
              context
                  .read<GetAllUsersBloc>()
                  .add(const GetAllUsersEvent.getAllUsers());
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (userData) {
              return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (users) {
                      final filterUser = users
                          .where((e) => userData.subscriptions!.contains(e.uid))
                          .toList();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: PostRepostListUser(
                              users: filterUser,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0x0D000000),
                                ),
                              ),
                            ),
                            child:
                                BlocBuilder<RepostUsersBloc, RepostUsersState>(
                              builder: (context, state) {
                                return BlocListener<RepostPostMyScreenBloc,
                                    RepostPostMyScreenState>(
                                  listener: (context, state) {
                                    state.maybeWhen(
                                      success: (post) {
                                        context.read<MyPostListBloc>().add(
                                              MyPostListEvent.addNewPost(post),
                                            );
                                        Navigator.pop(context);
                                      },
                                      orElse: () {},
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 5,
                                    ),
                                    child: BlocListener<CreateChatroomBloc,
                                        CreateChatroomState>(
                                      listener: (context, chatRoomState) {
                                        chatRoomState.maybeWhen(
                                          sucsess: (chatRoomId, userId) {
                                            sendPostBloc.add(
                                              SendPostEvent.sendPost(
                                                chatRoomId:
                                                    chatRoomId.toString(),
                                                receiverId: userId.toString(),
                                                post: widget.post,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          },
                                          orElse: () {},
                                        );
                                      },
                                      child: state.selectecUserIds.isNotEmpty
                                          ? GlButton(
                                              text: 'Подтвердить',
                                              onPressed: () {
                                                if (state.selectecUserIds
                                                    .isNotEmpty) {
                                                  for (final userd in state
                                                      .selectecUserIds) {
                                                    createRoomBloc.add(
                                                      CreateChatroomEvent
                                                          .createdChatRoomId(
                                                        userId: userd,
                                                      ),
                                                    );
                                                  }
                                                }
                                              },
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                PostRepostButton(
                                                  title: 'Экспорт',
                                                  onPressed: () {},
                                                  icon:
                                                      Assets.icons.export.path,
                                                ),
                                                PostRepostButton(
                                                  title: 'Скопировать ссылку',
                                                  onPressed: () {},
                                                  icon: Assets.icons.copy.path,
                                                ),
                                                PostRepostButton(
                                                  title: 'На своей странице',
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            RepostPostMyScreenBloc>()
                                                        .add(
                                                          RepostPostMyScreenEvent
                                                              .repostPost(
                                                            post: widget.post,
                                                          ),
                                                        );
                                                  },
                                                  icon: Assets
                                                      .icons.sharePng.path,
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    orElse: () => Container(),
                  );
                },
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
