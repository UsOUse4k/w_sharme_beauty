// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i14;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i16;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i13;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i50;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i49;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i17;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i18;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i24;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i23;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i58;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i22;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i27;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i43;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i42;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i75;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i33;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i48;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i32;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i47;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i66;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i53;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i28;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i45;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i68;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i67;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i52;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i51;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i31;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i30;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/firebase_module.dart' as _i77;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i3.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(() => firebaseModule.firebaseFirestore);
    gh.factory<_i5.FirebaseStorage>(() => firebaseModule.firebaseStorage);
    gh.factory<_i6.LikeCommunityPostBloc>(() => _i6.LikeCommunityPostBloc());
    gh.factory<_i7.CommunityLikeBloc>(() => _i7.CommunityLikeBloc());
    gh.factory<_i8.ParentCommentIdBloc>(() => _i8.ParentCommentIdBloc());
    gh.factory<_i9.AddedChatUsersGroupBloc>(
        () => _i9.AddedChatUsersGroupBloc());
    gh.factory<_i10.ChatGroupCheckManagerBloc>(
        () => _i10.ChatGroupCheckManagerBloc());
    gh.factory<_i11.InvitePeopleChatBloc>(() => _i11.InvitePeopleChatBloc());
    gh.factory<_i12.QuestionBloc>(() => _i12.QuestionBloc());
    gh.lazySingleton<_i13.IAuthFacade>(() => _i14.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i15.LogoutUC>(
        () => _i15.LogoutUC(repository: gh<_i16.IAuthFacade>()));
    gh.factory<_i17.GetAllUsersBloc>(
        () => _i17.GetAllUsersBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i18.UpdateStatusUserBloc>(
        () => _i18.UpdateStatusUserBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i19.MyProfileInfoBloc>(
        () => _i19.MyProfileInfoBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i20.UserDetailBloc>(
        () => _i20.UserDetailBloc(gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i21.IChatGroupRepository>(
        () => _i22.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i23.IChatRepository>(() => _i24.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i25.SendMessageGroupBloc>(() => _i25.SendMessageGroupBloc(
          gh<_i21.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i26.GetGroupBloc>(() => _i26.GetGroupBloc(
          gh<_i21.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i27.GetAllAdminsChatGroupBloc>(
        () => _i27.GetAllAdminsChatGroupBloc(
              gh<_i21.IChatGroupRepository>(),
              gh<_i16.IAuthFacade>(),
            ));
    gh.lazySingleton<_i28.IPostRepository>(() => _i29.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i30.AddQuestionRepository>(
        () => _i31.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i32.ICommunityPostRepository>(
        () => _i33.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i35.GetAllChatGroupBloc>(
        () => _i35.GetAllChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i36.RemoveAdminChatGroupBloc>(
        () => _i36.RemoveAdminChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i37.UpdateChatGroupBloc>(
        () => _i37.UpdateChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i38.CreateChatGroupBloc>(
        () => _i38.CreateChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i39.InviteUsersChatGroupBloc>(
        () => _i39.InviteUsersChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i40.UpdateManagerChatGroupBloc>(
        () => _i40.UpdateManagerChatGroupBloc(gh<_i21.IChatGroupRepository>()));
    gh.factory<_i41.GetAllGroupMessagesBloc>(
        () => _i41.GetAllGroupMessagesBloc(gh<_i21.IChatGroupRepository>()));
    gh.lazySingleton<_i42.ICommentRepository>(() => _i43.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i44.PostCreateBloc>(() => _i44.PostCreateBloc(
          gh<_i45.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i46.CommunityCreatePostBloc>(() => _i46.CommunityCreatePostBloc(
          gh<_i32.ICommunityPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.lazySingleton<_i47.ICommunityRepository>(
        () => _i48.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i49.RegisterWithEmailUC>(
        () => _i49.RegisterWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.factory<_i50.LoginWithEmailUC>(
        () => _i50.LoginWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.lazySingleton<_i51.IProfileInfoRepository>(
        () => _i52.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i53.CommunityDetailBloc>(
        () => _i53.CommunityDetailBloc(gh<_i47.ICommunityRepository>()));
    gh.factory<_i54.UpdateCommunityBloc>(
        () => _i54.UpdateCommunityBloc(gh<_i47.ICommunityRepository>()));
    gh.factory<_i55.CommunityPostListBloc>(
        () => _i55.CommunityPostListBloc(gh<_i32.ICommunityPostRepository>()));
    gh.factory<_i56.ProfileInfoUpdateBloc>(() => _i56.ProfileInfoUpdateBloc(
          gh<_i51.IProfileInfoRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i57.CommunityListBloc>(
        () => _i57.CommunityListBloc(gh<_i47.ICommunityRepository>()));
    gh.factory<_i58.GetAllChatsUseCase>(
        () => _i58.GetAllChatsUseCase(gh<_i23.IChatRepository>()));
    gh.factory<_i59.GetMessagesBloc>(
        () => _i59.GetMessagesBloc(gh<_i23.IChatRepository>()));
    gh.factory<_i60.GetAllChatsBloc>(
        () => _i60.GetAllChatsBloc(gh<_i23.IChatRepository>()));
    gh.factory<_i61.SeenMessageBloc>(
        () => _i61.SeenMessageBloc(gh<_i23.IChatRepository>()));
    gh.factory<_i62.CommunityProfileInfoBloc>(
        () => _i62.CommunityProfileInfoBloc(
              gh<_i16.IAuthFacade>(),
              gh<_i51.IProfileInfoRepository>(),
            ));
    gh.factory<_i63.PostLikeBloc>(() => _i63.PostLikeBloc(
          gh<_i45.IPostRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i64.MyCommunityListBloc>(() => _i64.MyCommunityListBloc(
          gh<_i47.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i65.PostUserListBloc>(
        () => _i65.PostUserListBloc(gh<_i28.IPostRepository>()));
    gh.factory<_i66.CommunityCreateBloc>(() => _i66.CommunityCreateBloc(
          gh<_i47.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i67.PostDetailBloc>(() => _i67.PostDetailBloc(
          gh<_i45.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i68.MyPostListBloc>(() => _i68.MyPostListBloc(
          gh<_i45.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i69.CreateChatroomBloc>(() => _i69.CreateChatroomBloc(
          gh<_i23.IChatRepository>(),
          gh<_i59.GetMessagesBloc>(),
        ));
    gh.factory<_i70.ReplyCommentListBloc>(
        () => _i70.ReplyCommentListBloc(gh<_i42.ICommentRepository>()));
    gh.factory<_i71.CommentLikesBloc>(
        () => _i71.CommentLikesBloc(gh<_i42.ICommentRepository>()));
    gh.factory<_i72.CommentListBloc>(
        () => _i72.CommentListBloc(gh<_i42.ICommentRepository>()));
    gh.factory<_i73.PostListBloc>(() => _i73.PostListBloc(
          gh<_i45.IPostRepository>(),
          gh<_i19.MyProfileInfoBloc>(),
          gh<_i68.MyPostListBloc>(),
        ));
    gh.factory<_i74.SendMessageBloc>(() => _i74.SendMessageBloc(
          gh<_i23.IChatRepository>(),
          gh<_i59.GetMessagesBloc>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i75.CommentCreateBloc>(() => _i75.CommentCreateBloc(
          gh<_i42.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i72.CommentListBloc>(),
        ));
    gh.factory<_i76.AddReplyCommentBloc>(() => _i76.AddReplyCommentBloc(
          gh<_i42.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i73.PostListBloc>(),
          gh<_i70.ReplyCommentListBloc>(),
          gh<_i8.ParentCommentIdBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i77.FirebaseModule {}
