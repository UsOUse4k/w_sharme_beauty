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
    as _i12;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i14;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i44;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i13;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i43;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i16;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i22;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i50;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i51;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i53;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i66;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i20;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i19;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i36;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i35;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i68;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i67;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_post_repository.dart'
    as _i30;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i42;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i41;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i25;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i39;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i46;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i45;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i17;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i18;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i28;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i27;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/firebase_module.dart' as _i69;

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
    gh.factory<_i6.CommunityLikeBloc>(() => _i6.CommunityLikeBloc());
    gh.factory<_i7.ParentCommentIdBloc>(() => _i7.ParentCommentIdBloc());
    gh.factory<_i8.QuestionBloc>(() => _i8.QuestionBloc());
    gh.factory<_i9.InvitePeopleChatBloc>(() => _i9.InvitePeopleChatBloc());
    gh.factory<_i10.AddedChatUsersGroupBloc>(
        () => _i10.AddedChatUsersGroupBloc());
    gh.lazySingleton<_i11.IAuthFacade>(() => _i12.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i13.LogoutUC>(
        () => _i13.LogoutUC(repository: gh<_i14.IAuthFacade>()));
    gh.factory<_i15.GetAllUsersBloc>(
        () => _i15.GetAllUsersBloc(gh<_i14.IAuthFacade>()));
    gh.factory<_i16.UpdateStatusUserBloc>(
        () => _i16.UpdateStatusUserBloc(gh<_i14.IAuthFacade>()));
    gh.factory<_i17.MyProfileInfoBloc>(
        () => _i17.MyProfileInfoBloc(gh<_i14.IAuthFacade>()));
    gh.factory<_i18.UserDetailBloc>(
        () => _i18.UserDetailBloc(gh<_i14.IAuthFacade>()));
    gh.lazySingleton<_i19.IChatGroupRepository>(
        () => _i20.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i21.IChatRepository>(() => _i22.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i23.SendMessageGroupBloc>(() => _i23.SendMessageGroupBloc(
          gh<_i19.IChatGroupRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i24.GetGroupBloc>(() => _i24.GetGroupBloc(
          gh<_i19.IChatGroupRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.lazySingleton<_i25.IPostRepository>(() => _i26.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i27.AddQuestionRepository>(
        () => _i28.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i29.ICommunityPostRepository>(
        () => _i30.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i31.AuthBloc>(() => _i31.AuthBloc(gh<_i14.IAuthFacade>()));
    gh.factory<_i32.GetAllChatGroupBloc>(
        () => _i32.GetAllChatGroupBloc(gh<_i19.IChatGroupRepository>()));
    gh.factory<_i33.CreateChatGroupBloc>(
        () => _i33.CreateChatGroupBloc(gh<_i19.IChatGroupRepository>()));
    gh.factory<_i34.GetAllGroupMessagesBloc>(
        () => _i34.GetAllGroupMessagesBloc(gh<_i19.IChatGroupRepository>()));
    gh.lazySingleton<_i35.ICommentRepository>(() => _i36.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i37.CommunityPostListBloc>(() => _i37.CommunityPostListBloc(
          gh<_i29.ICommunityPostRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i38.PostCreateBloc>(() => _i38.PostCreateBloc(
          gh<_i39.IPostRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i40.CommunityCreatePostBloc>(() => _i40.CommunityCreatePostBloc(
          gh<_i29.ICommunityPostRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.lazySingleton<_i41.ICommunityRepository>(
        () => _i42.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i43.RegisterWithEmailUC>(
        () => _i43.RegisterWithEmailUC(repository: gh<_i11.IAuthFacade>()));
    gh.factory<_i44.LoginWithEmailUC>(
        () => _i44.LoginWithEmailUC(repository: gh<_i11.IAuthFacade>()));
    gh.lazySingleton<_i45.IProfileInfoRepository>(
        () => _i46.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i47.CommunityDetailBloc>(
        () => _i47.CommunityDetailBloc(gh<_i41.ICommunityRepository>()));
    gh.factory<_i48.ProfileInfoUpdateBloc>(() => _i48.ProfileInfoUpdateBloc(
          gh<_i45.IProfileInfoRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i49.CommunityListBloc>(
        () => _i49.CommunityListBloc(gh<_i41.ICommunityRepository>()));
    gh.factory<_i50.GetAllChatsUseCase>(
        () => _i50.GetAllChatsUseCase(gh<_i21.IChatRepository>()));
    gh.factory<_i51.GetMessagesBloc>(
        () => _i51.GetMessagesBloc(gh<_i21.IChatRepository>()));
    gh.factory<_i52.GetAllChatsBloc>(
        () => _i52.GetAllChatsBloc(gh<_i21.IChatRepository>()));
    gh.factory<_i53.SeenMessageBloc>(
        () => _i53.SeenMessageBloc(gh<_i21.IChatRepository>()));
    gh.factory<_i54.CommunityProfileInfoBloc>(
        () => _i54.CommunityProfileInfoBloc(
              gh<_i14.IAuthFacade>(),
              gh<_i45.IProfileInfoRepository>(),
            ));
    gh.factory<_i55.PostLikeBloc>(() => _i55.PostLikeBloc(
          gh<_i39.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i56.MyCommunityListBloc>(() => _i56.MyCommunityListBloc(
          gh<_i41.ICommunityRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i57.PostUserListBloc>(
        () => _i57.PostUserListBloc(gh<_i25.IPostRepository>()));
    gh.factory<_i58.PostDetailBloc>(() => _i58.PostDetailBloc(
          gh<_i39.IPostRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i59.MyPostListBloc>(() => _i59.MyPostListBloc(
          gh<_i39.IPostRepository>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i60.CreateChatroomBloc>(() => _i60.CreateChatroomBloc(
          gh<_i21.IChatRepository>(),
          gh<_i51.GetMessagesBloc>(),
        ));
    gh.factory<_i61.ReplyCommentListBloc>(
        () => _i61.ReplyCommentListBloc(gh<_i35.ICommentRepository>()));
    gh.factory<_i62.CommentLikesBloc>(
        () => _i62.CommentLikesBloc(gh<_i35.ICommentRepository>()));
    gh.factory<_i63.CommentListBloc>(
        () => _i63.CommentListBloc(gh<_i35.ICommentRepository>()));
    gh.factory<_i64.PostListBloc>(() => _i64.PostListBloc(
          gh<_i39.IPostRepository>(),
          gh<_i17.MyProfileInfoBloc>(),
          gh<_i59.MyPostListBloc>(),
        ));
    gh.factory<_i65.CommunityCreateBloc>(() => _i65.CommunityCreateBloc(
          gh<_i41.ICommunityRepository>(),
          gh<_i14.IAuthFacade>(),
          gh<_i56.MyCommunityListBloc>(),
          gh<_i49.CommunityListBloc>(),
        ));
    gh.factory<_i66.SendMessageBloc>(() => _i66.SendMessageBloc(
          gh<_i21.IChatRepository>(),
          gh<_i51.GetMessagesBloc>(),
          gh<_i14.IAuthFacade>(),
        ));
    gh.factory<_i67.CommentCreateBloc>(() => _i67.CommentCreateBloc(
          gh<_i35.ICommentRepository>(),
          gh<_i11.IAuthFacade>(),
          gh<_i63.CommentListBloc>(),
        ));
    gh.factory<_i68.AddReplyCommentBloc>(() => _i68.AddReplyCommentBloc(
          gh<_i35.ICommentRepository>(),
          gh<_i11.IAuthFacade>(),
          gh<_i64.PostListBloc>(),
          gh<_i61.ReplyCommentListBloc>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i69.FirebaseModule {}
