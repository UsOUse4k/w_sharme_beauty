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
    as _i56;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i55;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i17;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i18;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i25;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i24;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i64;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i78;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i66;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i67;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i23;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i22;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i27;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i44;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i43;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i80;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i81;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i79;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i51;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i34;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i53;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i50;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i33;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i68;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i75;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i32;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i31;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i48;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i58;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i57;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/question/data/firebase_add_question_data.dart'
    as _i30;
import 'package:w_sharme_beauty/features/question/data/firebase_get_question_facade.dart'
    as _i46;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i45;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/firebase_module.dart' as _i87;

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
    gh.factory<_i12.CommunityParentCommetIdBloc>(
        () => _i12.CommunityParentCommetIdBloc());
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
    gh.factory<_i21.SubscribeBloc>(
        () => _i21.SubscribeBloc(gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i22.IChatGroupRepository>(
        () => _i23.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i24.IChatRepository>(() => _i25.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i26.SendMessageGroupBloc>(() => _i26.SendMessageGroupBloc(
          gh<_i22.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i27.GetGroupBloc>(() => _i27.GetGroupBloc(
          gh<_i22.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i28.GetAllAdminsChatGroupBloc>(
        () => _i28.GetAllAdminsChatGroupBloc(
              gh<_i22.IChatGroupRepository>(),
              gh<_i16.IAuthFacade>(),
            ));
    gh.lazySingleton<_i29.AddQuestionRepository>(
        () => _i30.FirestoreAddQuestionRepository(
              gh<_i16.IAuthFacade>(),
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i31.IPostRepository>(() => _i32.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i33.ICommunityPostRepository>(
        () => _i34.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i35.AuthBloc>(() => _i35.AuthBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i36.GetAllChatGroupBloc>(
        () => _i36.GetAllChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i37.RemoveAdminChatGroupBloc>(
        () => _i37.RemoveAdminChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i38.UpdateChatGroupBloc>(
        () => _i38.UpdateChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i39.CreateChatGroupBloc>(
        () => _i39.CreateChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i40.InviteUsersChatGroupBloc>(
        () => _i40.InviteUsersChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i41.UpdateManagerChatGroupBloc>(
        () => _i41.UpdateManagerChatGroupBloc(gh<_i22.IChatGroupRepository>()));
    gh.factory<_i42.GetAllGroupMessagesBloc>(
        () => _i42.GetAllGroupMessagesBloc(gh<_i22.IChatGroupRepository>()));
    gh.lazySingleton<_i43.ICommentRepository>(() => _i44.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i45.IQuestionRepository>(
        () => _i46.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i47.PostCreateBloc>(() => _i47.PostCreateBloc(
          gh<_i48.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i49.CommunityCreatePostBloc>(() => _i49.CommunityCreatePostBloc(
          gh<_i33.ICommunityPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.lazySingleton<_i50.ICommunityCommentRepository>(
        () => _i51.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i52.ICommunityRepository>(
        () => _i53.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i54.QuestionBloc>(() => _i54.QuestionBloc(
          gh<_i29.AddQuestionRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i55.RegisterWithEmailUC>(
        () => _i55.RegisterWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.factory<_i56.LoginWithEmailUC>(
        () => _i56.LoginWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.lazySingleton<_i57.IProfileInfoRepository>(
        () => _i58.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i59.CommunityDetailBloc>(
        () => _i59.CommunityDetailBloc(gh<_i52.ICommunityRepository>()));
    gh.factory<_i60.UpdateCommunityBloc>(
        () => _i60.UpdateCommunityBloc(gh<_i52.ICommunityRepository>()));
    gh.factory<_i61.CommunityPostListBloc>(
        () => _i61.CommunityPostListBloc(gh<_i33.ICommunityPostRepository>()));
    gh.factory<_i62.ProfileInfoUpdateBloc>(() => _i62.ProfileInfoUpdateBloc(
          gh<_i57.IProfileInfoRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i63.CommunityListBloc>(
        () => _i63.CommunityListBloc(gh<_i52.ICommunityRepository>()));
    gh.factory<_i64.GetAllChatsUseCase>(
        () => _i64.GetAllChatsUseCase(gh<_i24.IChatRepository>()));
    gh.factory<_i65.GetMessagesBloc>(
        () => _i65.GetMessagesBloc(gh<_i24.IChatRepository>()));
    gh.factory<_i66.GetAllChatsBloc>(
        () => _i66.GetAllChatsBloc(gh<_i24.IChatRepository>()));
    gh.factory<_i67.SeenMessageBloc>(
        () => _i67.SeenMessageBloc(gh<_i24.IChatRepository>()));
    gh.factory<_i68.CommunityProfileInfoBloc>(
        () => _i68.CommunityProfileInfoBloc(
              gh<_i16.IAuthFacade>(),
              gh<_i57.IProfileInfoRepository>(),
            ));
    gh.factory<_i69.PostLikeBloc>(() => _i69.PostLikeBloc(
          gh<_i48.IPostRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i70.MyCommunityListBloc>(() => _i70.MyCommunityListBloc(
          gh<_i52.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i71.PostUserListBloc>(
        () => _i71.PostUserListBloc(gh<_i31.IPostRepository>()));
    gh.factory<_i72.CommunityCreateBloc>(() => _i72.CommunityCreateBloc(
          gh<_i52.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i73.PostDetailBloc>(() => _i73.PostDetailBloc(
          gh<_i48.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i74.MyPostListBloc>(() => _i74.MyPostListBloc(
          gh<_i48.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i75.CommunityReplyCommentListBloc>(() =>
        _i75.CommunityReplyCommentListBloc(
            gh<_i50.ICommunityCommentRepository>()));
    gh.factory<_i76.CommunityCommentListBloc>(() =>
        _i76.CommunityCommentListBloc(gh<_i50.ICommunityCommentRepository>()));
    gh.factory<_i77.CommunityCommentLikesBloc>(() =>
        _i77.CommunityCommentLikesBloc(gh<_i50.ICommunityCommentRepository>()));
    gh.factory<_i78.CreateChatroomBloc>(() => _i78.CreateChatroomBloc(
          gh<_i24.IChatRepository>(),
          gh<_i65.GetMessagesBloc>(),
        ));
    gh.factory<_i79.ReplyCommentListBloc>(
        () => _i79.ReplyCommentListBloc(gh<_i43.ICommentRepository>()));
    gh.factory<_i80.CommentLikesBloc>(
        () => _i80.CommentLikesBloc(gh<_i43.ICommentRepository>()));
    gh.factory<_i81.CommentListBloc>(
        () => _i81.CommentListBloc(gh<_i43.ICommentRepository>()));
    gh.factory<_i82.PostListBloc>(() => _i82.PostListBloc(
          gh<_i48.IPostRepository>(),
          gh<_i19.MyProfileInfoBloc>(),
          gh<_i74.MyPostListBloc>(),
        ));
    gh.factory<_i83.GetAllQuestionBloc>(
        () => _i83.GetAllQuestionBloc(gh<_i45.IQuestionRepository>()));
    gh.factory<_i84.SendMessageBloc>(() => _i84.SendMessageBloc(
          gh<_i24.IChatRepository>(),
          gh<_i65.GetMessagesBloc>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i85.CommentCreateBloc>(() => _i85.CommentCreateBloc(
          gh<_i43.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i81.CommentListBloc>(),
        ));
    gh.factory<_i86.AddReplyCommentBloc>(() => _i86.AddReplyCommentBloc(
          gh<_i43.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i82.PostListBloc>(),
          gh<_i79.ReplyCommentListBloc>(),
          gh<_i8.ParentCommentIdBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i87.FirebaseModule {}
