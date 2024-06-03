import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_notification_bloc/get_all_notification_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/get_user_detail_bloc/get_user_detail_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_comment_bloc/create_question_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_comments_bloc/get_all_question_comments_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_question_bloc/get_question_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_get_all_reply_comment_bloc/question_get_all_reply_comment_bloc.dart';

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
        BlocProvider<AddQuestionBloc>(
          create: (context) => getIt<AddQuestionBloc>(),
        ),
        BlocProvider<CommunityListBloc>(
          create: (context) => getIt<CommunityListBloc>(),
        ),
        BlocProvider<ProfileInfoUpdateBloc>(
          create: (context) => getIt<ProfileInfoUpdateBloc>(),
        ),
        BlocProvider<MyProfileInfoBloc>(
          create: (context) {
            return getIt<MyProfileInfoBloc>();
          },
        ),
        BlocProvider<GetUserDetailBloc>(
          create: (context) => getIt<GetUserDetailBloc>(),
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
        BlocProvider<AddQuestionBloc>(
          create: (context) => getIt<AddQuestionBloc>(),
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
        BlocProvider<GetAllUsersBloc>(
          create: (context) => getIt<GetAllUsersBloc>(),
        ),
        BlocProvider<CreateChatGroupBloc>(
          create: (context) => getIt<CreateChatGroupBloc>(),
        ),
        BlocProvider<GetAllChatGroupBloc>(
          create: (context) => getIt<GetAllChatGroupBloc>(),
        ),
        BlocProvider<GetAllGroupMessagesBloc>(
          create: (context) => getIt<GetAllGroupMessagesBloc>(),
        ),
        BlocProvider<GetGroupBloc>(
          create: (context) => getIt<GetGroupBloc>(),
        ),
        BlocProvider<SendMessageGroupBloc>(
          create: (context) => getIt<SendMessageGroupBloc>(),
        ),
        BlocProvider<InvitePeopleChatBloc>(
          create: (context) => getIt<InvitePeopleChatBloc>(),
        ),
        BlocProvider<AddedChatUsersGroupBloc>(
          create: (context) => getIt<AddedChatUsersGroupBloc>(),
        ),
        BlocProvider<UpdateChatGroupBloc>(
          create: (context) => getIt<UpdateChatGroupBloc>(),
        ),
        BlocProvider<ChatGroupCheckManagerBloc>(
          create: (context) => getIt<ChatGroupCheckManagerBloc>(),
        ),
        BlocProvider<UpdateManagerChatGroupBloc>(
          create: (context) => getIt<UpdateManagerChatGroupBloc>(),
        ),
        BlocProvider<GetAllAdminsChatGroupBloc>(
          create: (context) => getIt<GetAllAdminsChatGroupBloc>(),
        ),
        BlocProvider<RemoveAdminChatGroupBloc>(
          create: (context) => getIt<RemoveAdminChatGroupBloc>(),
        ),
        BlocProvider<InviteUsersChatGroupBloc>(
          create: (context) => getIt<InviteUsersChatGroupBloc>(),
        ),
        BlocProvider<UpdateCommunityBloc>(
          create: (context) => getIt<UpdateCommunityBloc>(),
        ),
        BlocProvider<SubscribeBloc>(
          create: (context) => getIt<SubscribeBloc>(),
        ),
        BlocProvider<GetAllQuestionBloc>(
          create: (context) => getIt<GetAllQuestionBloc>(),
        ),
        BlocProvider<SubscribeCommunityBloc>(
          create: (context) => getIt<SubscribeCommunityBloc>(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => getIt<CategoryBloc>(),
        ),
        BlocProvider<CategoryListBloc>(
          create: (context) => getIt<CategoryListBloc>(),
        ),
        BlocProvider<GetAdminsSortedBloc>(
          create: (context) => getIt<GetAdminsSortedBloc>(),
        ),
        BlocProvider<FilterUsersInviteBloc>(
          create: (context) => getIt<FilterUsersInviteBloc>(),
        ),
        BlocProvider<SubscibePostBloc>(
          create: (context) => getIt<SubscibePostBloc>(),
        ),
        BlocProvider<CommunityLikeBloc>(
          create: (context) => getIt<CommunityLikeBloc>(),
        ),
        BlocProvider<CommunityCommentListBloc>(
          create: (context) => getIt<CommunityCommentListBloc>(),
        ),
        BlocProvider<CommunityAddReplyCommentBloc>(
          create: (context) => getIt<CommunityAddReplyCommentBloc>(),
        ),
        BlocProvider<CommunityCommentCreateBloc>(
          create: (context) => getIt<CommunityCommentCreateBloc>(),
        ),
        BlocProvider<CommunityCommentLikesBloc>(
          create: (context) => getIt<CommunityCommentLikesBloc>(),
        ),
        BlocProvider<CommunityReplyCommentListBloc>(
          create: (context) => getIt<CommunityReplyCommentListBloc>(),
        ),
        BlocProvider<UpdateNewEmailBloc>(
          create: (context) => getIt<UpdateNewEmailBloc>(),
        ),
        BlocProvider<CommunityPostDetailBloc>(
          create: (context) => getIt<CommunityPostDetailBloc>(),
        ),
        BlocProvider<CommunityCategoryBloc>(
          create: (context) => getIt<CommunityCategoryBloc>(),
        ),
        BlocProvider<GetQuestionBloc>(
          create: (context) => getIt<GetQuestionBloc>(),
        ),
        BlocProvider<CreateQuestionCommentBloc>(
          create: (context) => getIt<CreateQuestionCommentBloc>(),
        ),
        BlocProvider<GetAllQuestionCommentsBloc>(
          create: (context) => getIt<GetAllQuestionCommentsBloc>(),
        ),
        BlocProvider<CreateQuestionReplyCommentBloc>(
          create: (context) => getIt<CreateQuestionReplyCommentBloc>(),
        ),
        BlocProvider<QuestionGetAllReplyCommentBloc>(
          create: (context) => getIt<QuestionGetAllReplyCommentBloc>(),
        ),
        BlocProvider<QuestionCommentLikeBloc>(
          create: (context) => getIt<QuestionCommentLikeBloc>(),
        ),
        BlocProvider<CreateNotificationBloc>(
          create: (context) => getIt<CreateNotificationBloc>(),
        ),
        BlocProvider<GetAllNotificationBloc>(
          create: (context) => getIt<GetAllNotificationBloc>(),
        ),
      ],
      child: child,
    );
  }
}
