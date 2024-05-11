import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart';
import 'package:w_sharme_beauty/features/user_details/presentations/bloc/user_detail_bloc/user_detail_bloc.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<PostListBloc>(
          create: (context) {
            final postListBloc = getIt<PostListBloc>();
            postListBloc.add(const PostListEvent.getPosts());
            return postListBloc;
          },
        ),
        BlocProvider<MyPostListBloc>(
          create: (context) => getIt<MyPostListBloc>(),
        ),
        BlocProvider<PostCreateBloc>(
          create: (context) => getIt<PostCreateBloc>(),
        ),
        BlocProvider<PostLikeBloc>(create: (context) => getIt<PostLikeBloc>()),
        BlocProvider<QuestionBloc>(create: (context) => getIt<QuestionBloc>()),
        BlocProvider<CommunityListBloc>(
          create: (context) => getIt<CommunityListBloc>(),
        ),
        BlocProvider<ProfileInfoUpdateBloc>(
          create: (context) => getIt<ProfileInfoUpdateBloc>(),
        ),
        BlocProvider<MyProfileInfoBloc>(
          create: (context) {
            final getMe = getIt<MyProfileInfoBloc>();
            getMe.add(const MyProfileInfoEvent.getMe());
            return getMe;
          },
        ),
        BlocProvider<CommentCreateBloc>(
          create: (context) => getIt<CommentCreateBloc>(),
        ),
        BlocProvider<PostDetailBloc>(
          create: (context) => getIt<PostDetailBloc>(),
        ),
        BlocProvider<CommunityCreateBloc>(
          create: (context) => getIt<CommunityCreateBloc>(),
        ),
        BlocProvider<CommunityListBloc>(
          create: (context) => getIt<CommunityListBloc>(),
        ),
        BlocProvider<MyCommunityListBloc>(
          create: (context) => getIt<MyCommunityListBloc>(),
        ),
        BlocProvider<CommunityDetailBloc>(
          create: (context) => getIt<CommunityDetailBloc>(),
        ),
        BlocProvider<CommentListBloc>(
          create: (context) => getIt<CommentListBloc>(),
        ),
        BlocProvider<AddReplyCommentBloc>(
          create: (context) => getIt<AddReplyCommentBloc>(),
        ),
        BlocProvider<ReplyCommentListBloc>(
          create: (context) => getIt<ReplyCommentListBloc>(),
        ),
        BlocProvider<ParentCommentIdBloc>(
          create: (context) => getIt<ParentCommentIdBloc>(),
        ),
        BlocProvider<CommentLikesBloc>(
          create: (context) => getIt<CommentLikesBloc>(),
        ),
        BlocProvider<CommunityCreatePostBloc>(
          create: (context) => getIt<CommunityCreatePostBloc>(),
        ),
        BlocProvider<CommunityPostListBloc>(
          create: (context) => getIt<CommunityPostListBloc>(),
        ),
        BlocProvider<CommunityProfileInfoBloc>(
          create: (context) => getIt<CommunityProfileInfoBloc>(),
        ),
        BlocProvider<UserDetailBloc>(
          create: (context) => getIt<UserDetailBloc>(),
        ),
        BlocProvider<PostUserListBloc>(
          create: (context) => getIt<PostUserListBloc>(),
        ),
        BlocProvider<GetMessagesBloc>(
          create: (context) => getIt<GetMessagesBloc>(),
        ),
        BlocProvider<CreateChatroomBloc>(
          create: (context) => getIt<CreateChatroomBloc>(),
        ),
        BlocProvider<SendMessageBloc>(
          create: (context) => getIt<SendMessageBloc>(),
        ),
        BlocProvider<GetAllChatsBloc>(
          create: (context) => getIt<GetAllChatsBloc>(),
        ),
        BlocProvider<SeenMessageBloc>(
          create: (context) => getIt<SeenMessageBloc>(),
        ),
        BlocProvider<UpdateStatusUserBloc>(
          create: (context) => getIt<UpdateStatusUserBloc>(),
        ),
      ],
      child: child,
    );
  }
}
