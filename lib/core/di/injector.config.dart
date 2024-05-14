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
    as _i10;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i12;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i9;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i42;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i41;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i13;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i14;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i20;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i19;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i48;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i51;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i18;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i34;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i33;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i66;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_post_repository.dart'
    as _i27;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i40;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i39;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i23;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i22;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i37;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i53;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i44;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i43;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i16;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i25;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i24;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/firebase_module.dart' as _i67;

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
    gh.lazySingleton<_i9.IAuthFacade>(() => _i10.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i11.LogoutUC>(
        () => _i11.LogoutUC(repository: gh<_i12.IAuthFacade>()));
    gh.factory<_i13.GetAllUsersBloc>(
        () => _i13.GetAllUsersBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i14.UpdateStatusUserBloc>(
        () => _i14.UpdateStatusUserBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i15.MyProfileInfoBloc>(
        () => _i15.MyProfileInfoBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i16.UserDetailBloc>(
        () => _i16.UserDetailBloc(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i17.IChatGroupRepository>(
        () => _i18.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i19.IChatRepository>(() => _i20.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i21.SendMessageGroupBloc>(() => _i21.SendMessageGroupBloc(
          gh<_i17.IChatGroupRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.lazySingleton<_i22.IPostRepository>(() => _i23.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i24.AddQuestionRepository>(
        () => _i25.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i26.ICommunityPostRepository>(
        () => _i27.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i28.AuthBloc>(() => _i28.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i29.GetAllChatGroupBloc>(
        () => _i29.GetAllChatGroupBloc(gh<_i17.IChatGroupRepository>()));
    gh.factory<_i30.CreateChatGroupBloc>(
        () => _i30.CreateChatGroupBloc(gh<_i17.IChatGroupRepository>()));
    gh.factory<_i31.GetGroupBloc>(
        () => _i31.GetGroupBloc(gh<_i17.IChatGroupRepository>()));
    gh.factory<_i32.GetAllGroupMessagesBloc>(
        () => _i32.GetAllGroupMessagesBloc(gh<_i17.IChatGroupRepository>()));
    gh.lazySingleton<_i33.ICommentRepository>(() => _i34.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i35.CommunityPostListBloc>(() => _i35.CommunityPostListBloc(
          gh<_i26.ICommunityPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i36.PostCreateBloc>(() => _i36.PostCreateBloc(
          gh<_i37.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i38.CommunityCreatePostBloc>(() => _i38.CommunityCreatePostBloc(
          gh<_i26.ICommunityPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.lazySingleton<_i39.ICommunityRepository>(
        () => _i40.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i41.RegisterWithEmailUC>(
        () => _i41.RegisterWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i42.LoginWithEmailUC>(
        () => _i42.LoginWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.lazySingleton<_i43.IProfileInfoRepository>(
        () => _i44.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i45.CommunityDetailBloc>(
        () => _i45.CommunityDetailBloc(gh<_i39.ICommunityRepository>()));
    gh.factory<_i46.ProfileInfoUpdateBloc>(() => _i46.ProfileInfoUpdateBloc(
          gh<_i43.IProfileInfoRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i47.CommunityListBloc>(
        () => _i47.CommunityListBloc(gh<_i39.ICommunityRepository>()));
    gh.factory<_i48.GetAllChatsUseCase>(
        () => _i48.GetAllChatsUseCase(gh<_i19.IChatRepository>()));
    gh.factory<_i49.GetMessagesBloc>(
        () => _i49.GetMessagesBloc(gh<_i19.IChatRepository>()));
    gh.factory<_i50.GetAllChatsBloc>(
        () => _i50.GetAllChatsBloc(gh<_i19.IChatRepository>()));
    gh.factory<_i51.SeenMessageBloc>(
        () => _i51.SeenMessageBloc(gh<_i19.IChatRepository>()));
    gh.factory<_i52.CommunityProfileInfoBloc>(
        () => _i52.CommunityProfileInfoBloc(
              gh<_i12.IAuthFacade>(),
              gh<_i43.IProfileInfoRepository>(),
            ));
    gh.factory<_i53.PostLikeBloc>(() => _i53.PostLikeBloc(
          gh<_i37.IPostRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i54.MyCommunityListBloc>(() => _i54.MyCommunityListBloc(
          gh<_i39.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i55.PostUserListBloc>(
        () => _i55.PostUserListBloc(gh<_i22.IPostRepository>()));
    gh.factory<_i56.PostDetailBloc>(() => _i56.PostDetailBloc(
          gh<_i37.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i57.MyPostListBloc>(() => _i57.MyPostListBloc(
          gh<_i37.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i58.CreateChatroomBloc>(() => _i58.CreateChatroomBloc(
          gh<_i19.IChatRepository>(),
          gh<_i49.GetMessagesBloc>(),
        ));
    gh.factory<_i59.ReplyCommentListBloc>(
        () => _i59.ReplyCommentListBloc(gh<_i33.ICommentRepository>()));
    gh.factory<_i60.CommentLikesBloc>(
        () => _i60.CommentLikesBloc(gh<_i33.ICommentRepository>()));
    gh.factory<_i61.CommentListBloc>(
        () => _i61.CommentListBloc(gh<_i33.ICommentRepository>()));
    gh.factory<_i62.PostListBloc>(() => _i62.PostListBloc(
          gh<_i37.IPostRepository>(),
          gh<_i15.MyProfileInfoBloc>(),
          gh<_i57.MyPostListBloc>(),
        ));
    gh.factory<_i63.CommunityCreateBloc>(() => _i63.CommunityCreateBloc(
          gh<_i39.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
          gh<_i54.MyCommunityListBloc>(),
          gh<_i47.CommunityListBloc>(),
        ));
    gh.factory<_i64.SendMessageBloc>(() => _i64.SendMessageBloc(
          gh<_i19.IChatRepository>(),
          gh<_i49.GetMessagesBloc>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i65.CommentCreateBloc>(() => _i65.CommentCreateBloc(
          gh<_i33.ICommentRepository>(),
          gh<_i9.IAuthFacade>(),
          gh<_i61.CommentListBloc>(),
        ));
    gh.factory<_i66.AddReplyCommentBloc>(() => _i66.AddReplyCommentBloc(
          gh<_i33.ICommentRepository>(),
          gh<_i9.IAuthFacade>(),
          gh<_i62.PostListBloc>(),
          gh<_i59.ReplyCommentListBloc>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i67.FirebaseModule {}
