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
import 'package:w_sharme_beauty/features/adverts/data/data/firebase_create_advert_facade.dart'
    as _i18;
import 'package:w_sharme_beauty/features/adverts/domain/repositories/i_create_advert_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/adverts/presentation/create_advert_bloc/create_advert_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i14;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i16;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i13;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i59;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i58;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i28;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i27;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i67;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i81;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i68;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i87;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i26;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i25;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i45;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i44;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i91;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i89;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i35;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i56;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i51;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i34;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i55;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i88;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i90;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i80;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i79;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i75;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i66;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i78;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i33;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i32;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i49;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i61;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i60;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i54;
import 'package:w_sharme_beauty/features/question/data/data/firebase_get_question_facade.dart'
    as _i47;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i53;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i46;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/firebase_module.dart' as _i92;

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
    gh.factory<_i6.CommunityParentCommetIdBloc>(
        () => _i6.CommunityParentCommetIdBloc());
    gh.factory<_i7.CommunityLikeBloc>(() => _i7.CommunityLikeBloc());
    gh.factory<_i8.ParentCommentIdBloc>(() => _i8.ParentCommentIdBloc());
    gh.factory<_i9.LikeCommunityPostBloc>(() => _i9.LikeCommunityPostBloc());
    gh.factory<_i10.AddedChatUsersGroupBloc>(
        () => _i10.AddedChatUsersGroupBloc());
    gh.factory<_i11.ChatGroupCheckManagerBloc>(
        () => _i11.ChatGroupCheckManagerBloc());
    gh.factory<_i12.InvitePeopleChatBloc>(() => _i12.InvitePeopleChatBloc());
    gh.lazySingleton<_i13.IAuthFacade>(() => _i14.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i15.LogoutUC>(
        () => _i15.LogoutUC(repository: gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i17.ICreateAdvartRepository>(
        () => _i18.FirebaseCreateAdvartRepository(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i19.CreateAdvertBloc>(() => _i19.CreateAdvertBloc(
          gh<_i17.ICreateAdvartRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i20.MyProfileInfoBloc>(
        () => _i20.MyProfileInfoBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i21.GetAllUsersBloc>(
        () => _i21.GetAllUsersBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i22.UpdateStatusUserBloc>(
        () => _i22.UpdateStatusUserBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i23.SubscribeBloc>(
        () => _i23.SubscribeBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i24.UserDetailBloc>(
        () => _i24.UserDetailBloc(gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i25.IChatGroupRepository>(
        () => _i26.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i27.IChatRepository>(() => _i28.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i29.SendMessageGroupBloc>(() => _i29.SendMessageGroupBloc(
          gh<_i25.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i30.GetGroupBloc>(() => _i30.GetGroupBloc(
          gh<_i25.IChatGroupRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i31.GetAllAdminsChatGroupBloc>(
        () => _i31.GetAllAdminsChatGroupBloc(
              gh<_i25.IChatGroupRepository>(),
              gh<_i16.IAuthFacade>(),
            ));
    gh.lazySingleton<_i32.IPostRepository>(() => _i33.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i34.ICommunityPostRepository>(
        () => _i35.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i36.AuthBloc>(() => _i36.AuthBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i37.GetAllChatGroupBloc>(
        () => _i37.GetAllChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i38.RemoveAdminChatGroupBloc>(
        () => _i38.RemoveAdminChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i39.UpdateChatGroupBloc>(
        () => _i39.UpdateChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i40.CreateChatGroupBloc>(
        () => _i40.CreateChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i41.InviteUsersChatGroupBloc>(
        () => _i41.InviteUsersChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i42.UpdateManagerChatGroupBloc>(
        () => _i42.UpdateManagerChatGroupBloc(gh<_i25.IChatGroupRepository>()));
    gh.factory<_i43.GetAllGroupMessagesBloc>(
        () => _i43.GetAllGroupMessagesBloc(gh<_i25.IChatGroupRepository>()));
    gh.lazySingleton<_i44.ICommentRepository>(() => _i45.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i46.IQuestionRepository>(
        () => _i47.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i48.PostCreateBloc>(() => _i48.PostCreateBloc(
          gh<_i49.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i50.CommunityCreatePostBloc>(() => _i50.CommunityCreatePostBloc(
          gh<_i34.ICommunityPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.lazySingleton<_i51.ICommunityCommentRepository>(
        () => _i52.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i53.AddQuestionRepository>(
        () => _i54.FirestoreAddQuestionRepository(
              gh<_i13.IAuthFacade>(),
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i55.ICommunityRepository>(
        () => _i56.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i57.AddQuestionBloc>(() => _i57.AddQuestionBloc(
          gh<_i53.AddQuestionRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i58.RegisterWithEmailUC>(
        () => _i58.RegisterWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.factory<_i59.LoginWithEmailUC>(
        () => _i59.LoginWithEmailUC(repository: gh<_i13.IAuthFacade>()));
    gh.lazySingleton<_i60.IProfileInfoRepository>(
        () => _i61.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i62.CommunityDetailBloc>(
        () => _i62.CommunityDetailBloc(gh<_i55.ICommunityRepository>()));
    gh.factory<_i63.UpdateCommunityBloc>(
        () => _i63.UpdateCommunityBloc(gh<_i55.ICommunityRepository>()));
    gh.factory<_i64.CommunityPostListBloc>(
        () => _i64.CommunityPostListBloc(gh<_i34.ICommunityPostRepository>()));
    gh.factory<_i65.ProfileInfoUpdateBloc>(() => _i65.ProfileInfoUpdateBloc(
          gh<_i60.IProfileInfoRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i66.CommunityListBloc>(
        () => _i66.CommunityListBloc(gh<_i55.ICommunityRepository>()));
    gh.factory<_i67.GetAllChatsUseCase>(
        () => _i67.GetAllChatsUseCase(gh<_i27.IChatRepository>()));
    gh.factory<_i68.GetMessagesBloc>(
        () => _i68.GetMessagesBloc(gh<_i27.IChatRepository>()));
    gh.factory<_i69.GetAllChatsBloc>(
        () => _i69.GetAllChatsBloc(gh<_i27.IChatRepository>()));
    gh.factory<_i70.SeenMessageBloc>(
        () => _i70.SeenMessageBloc(gh<_i27.IChatRepository>()));
    gh.factory<_i71.CommunityProfileInfoBloc>(
        () => _i71.CommunityProfileInfoBloc(
              gh<_i16.IAuthFacade>(),
              gh<_i60.IProfileInfoRepository>(),
            ));
    gh.factory<_i72.PostLikeBloc>(() => _i72.PostLikeBloc(
          gh<_i49.IPostRepository>(),
          gh<_i13.IAuthFacade>(),
        ));
    gh.factory<_i73.MyCommunityListBloc>(() => _i73.MyCommunityListBloc(
          gh<_i55.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i74.PostUserListBloc>(
        () => _i74.PostUserListBloc(gh<_i32.IPostRepository>()));
    gh.factory<_i75.CommunityCreateBloc>(() => _i75.CommunityCreateBloc(
          gh<_i55.ICommunityRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i76.PostDetailBloc>(() => _i76.PostDetailBloc(
          gh<_i49.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i77.MyPostListBloc>(() => _i77.MyPostListBloc(
          gh<_i49.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i78.CommunityReplyCommentListBloc>(() =>
        _i78.CommunityReplyCommentListBloc(
            gh<_i51.ICommunityCommentRepository>()));
    gh.factory<_i79.CommunityCommentListBloc>(() =>
        _i79.CommunityCommentListBloc(gh<_i51.ICommunityCommentRepository>()));
    gh.factory<_i80.CommunityCommentLikesBloc>(() =>
        _i80.CommunityCommentLikesBloc(gh<_i51.ICommunityCommentRepository>()));
    gh.factory<_i81.CreateChatroomBloc>(() => _i81.CreateChatroomBloc(
          gh<_i27.IChatRepository>(),
          gh<_i68.GetMessagesBloc>(),
        ));
    gh.factory<_i82.ReplyCommentListBloc>(
        () => _i82.ReplyCommentListBloc(gh<_i44.ICommentRepository>()));
    gh.factory<_i83.CommentLikesBloc>(
        () => _i83.CommentLikesBloc(gh<_i44.ICommentRepository>()));
    gh.factory<_i84.CommentListBloc>(
        () => _i84.CommentListBloc(gh<_i44.ICommentRepository>()));
    gh.factory<_i85.PostListBloc>(() => _i85.PostListBloc(
          gh<_i49.IPostRepository>(),
          gh<_i20.MyProfileInfoBloc>(),
          gh<_i77.MyPostListBloc>(),
        ));
    gh.factory<_i86.GetAllQuestionBloc>(
        () => _i86.GetAllQuestionBloc(gh<_i46.IQuestionRepository>()));
    gh.factory<_i87.SendMessageBloc>(() => _i87.SendMessageBloc(
          gh<_i27.IChatRepository>(),
          gh<_i68.GetMessagesBloc>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i88.CommunityAddReplyCommentBloc>(
        () => _i88.CommunityAddReplyCommentBloc(
              gh<_i51.ICommunityCommentRepository>(),
              gh<_i16.IAuthFacade>(),
              gh<_i78.CommunityReplyCommentListBloc>(),
              gh<_i6.CommunityParentCommetIdBloc>(),
            ));
    gh.factory<_i89.CommentCreateBloc>(() => _i89.CommentCreateBloc(
          gh<_i44.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i84.CommentListBloc>(),
        ));
    gh.factory<_i90.CommunityCommentCreateBloc>(
        () => _i90.CommunityCommentCreateBloc(
              gh<_i51.ICommunityCommentRepository>(),
              gh<_i16.IAuthFacade>(),
              gh<_i79.CommunityCommentListBloc>(),
            ));
    gh.factory<_i91.AddReplyCommentBloc>(() => _i91.AddReplyCommentBloc(
          gh<_i44.ICommentRepository>(),
          gh<_i13.IAuthFacade>(),
          gh<_i85.PostListBloc>(),
          gh<_i82.ReplyCommentListBloc>(),
          gh<_i8.ParentCommentIdBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i92.FirebaseModule {}
