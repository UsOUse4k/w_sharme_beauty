import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/data/data/comments_data.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class HomePostPage extends StatefulWidget {
  const HomePostPage({
    super.key,
    this.postId,
  });

  final String? postId;

  @override
  State<HomePostPage> createState() => _HomePostPageState();
}

class _HomePostPageState extends State<HomePostPage> {
  Post? selectedPost;
  bool isLoading = false;
  @override
  void initState() {
    context.read<PostDetailBloc>().add(PostDetailEvent.getPost(widget.postId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Запись',
          textStyle: AppStyles.w500f22,
          key: ValueKey(widget.postId),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: () => setState(() => isLoading = true),
                success: (post) {
                  setState(() {
                    selectedPost = post;
                    isLoading = false;
                  });
                },
                error: (message) => setState(() => isLoading = false),
                orElse: () {},
              );
            },
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: AppColors.purple),
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      if (selectedPost != null)
                        PostCard(
                          show: 'show',
                          post: selectedPost,
                        ),
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${selectedPost?.comments.length ?? 0} Комментариев',
                              style: AppStyles.w500f14.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(commentItems.length, (index) {
                                final item = commentItems[index];
                                return Column(
                                  children: [
                                    CommentBookingCard(
                                      item: item,
                                      avatar: Assets.images.avatar.path,
                                    ),
                                    const SizedBox(height: 6),
                                    if (index == 0)
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Container(),
                                          ),
                                          Flexible(
                                            flex: 8,
                                            child: CommentBookingCard(
                                              item: item,
                                              avatar: Assets.images.avatar.path,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
