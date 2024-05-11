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
import 'package:w_sharme_beauty/features/auth/data/repositories/firebase_auth_facade.dart'
    as _i12;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i22;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i31;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i40;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i30;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i51;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i24;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i23;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i53;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_post_repository.dart'
    as _i18;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i28;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i14;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i13;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i45;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_profile_facade.dart'
    as _i20;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i19;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i16;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i15;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/user_details/data/firebase_user_facade.dart'
    as _i27;
import 'package:w_sharme_beauty/features/user_details/domain/repositories/i_user_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/user_details/presentations/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/firebase_module.dart' as _i61;

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
    gh.lazySingleton<_i9.IChatRepository>(() => _i10.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i11.IAuthFacade>(() => _i12.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i13.IPostRepository>(() => _i14.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i15.AddQuestionRepository>(
        () => _i16.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i17.ICommunityPostRepository>(
        () => _i18.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i19.IProfileInfoRepository>(
        () => _i20.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(gh<_i22.IAuthFacade>()));
    gh.lazySingleton<_i23.ICommentRepository>(() => _i24.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i25.CommunityPostListBloc>(() => _i25.CommunityPostListBloc(
          gh<_i17.ICommunityPostRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.lazySingleton<_i26.IUserRepository>(() => _i27.FirebaseUserFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i28.ICommunityRepository>(
        () => _i29.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i30.RegisterWithEmailUC>(
        () => _i30.RegisterWithEmailUC(repository: gh<_i11.IAuthFacade>()));
    gh.factory<_i31.LoginWithEmailUC>(
        () => _i31.LoginWithEmailUC(repository: gh<_i11.IAuthFacade>()));
    gh.factory<_i32.CommunityCreatePostBloc>(() => _i32.CommunityCreatePostBloc(
          gh<_i17.ICommunityPostRepository>(),
          gh<_i19.IProfileInfoRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.factory<_i33.CommunityDetailBloc>(
        () => _i33.CommunityDetailBloc(gh<_i28.ICommunityRepository>()));
    gh.factory<_i34.ProfileInfoUpdateBloc>(() => _i34.ProfileInfoUpdateBloc(
          gh<_i19.IProfileInfoRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i35.CommunityListBloc>(
        () => _i35.CommunityListBloc(gh<_i28.ICommunityRepository>()));
    gh.factory<_i36.GetAllChatsUseCase>(
        () => _i36.GetAllChatsUseCase(gh<_i9.IChatRepository>()));
    gh.factory<_i37.GetMessagesBloc>(
        () => _i37.GetMessagesBloc(gh<_i9.IChatRepository>()));
    gh.factory<_i38.GetAllChatsBloc>(
        () => _i38.GetAllChatsBloc(gh<_i9.IChatRepository>()));
    gh.factory<_i39.SeenMessageBloc>(
        () => _i39.SeenMessageBloc(gh<_i9.IChatRepository>()));
    gh.factory<_i40.LogoutUC>(
        () => _i40.LogoutUC(repository: gh<_i22.IAuthFacade>()));
    gh.factory<_i41.CommunityProfileInfoBloc>(
        () => _i41.CommunityProfileInfoBloc(
              gh<_i22.IAuthFacade>(),
              gh<_i19.IProfileInfoRepository>(),
            ));
    gh.factory<_i42.MyProfileInfoBloc>(() => _i42.MyProfileInfoBloc(
          gh<_i22.IAuthFacade>(),
          gh<_i19.IProfileInfoRepository>(),
        ));
    gh.factory<_i43.UpdateStatusUserBloc>(
        () => _i43.UpdateStatusUserBloc(gh<_i22.IAuthFacade>()));
    gh.factory<_i44.PostLikeBloc>(() => _i44.PostLikeBloc(
          gh<_i45.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i46.MyCommunityListBloc>(() => _i46.MyCommunityListBloc(
          gh<_i28.ICommunityRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.factory<_i47.PostUserListBloc>(
        () => _i47.PostUserListBloc(gh<_i13.IPostRepository>()));
    gh.factory<_i48.PostDetailBloc>(() => _i48.PostDetailBloc(
          gh<_i45.IPostRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.factory<_i49.MyPostListBloc>(() => _i49.MyPostListBloc(
          gh<_i45.IPostRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.factory<_i50.SendMessageBloc>(() => _i50.SendMessageBloc(
          gh<_i9.IChatRepository>(),
          gh<_i37.GetMessagesBloc>(),
        ));
    gh.factory<_i51.CreateChatroomBloc>(() => _i51.CreateChatroomBloc(
          gh<_i9.IChatRepository>(),
          gh<_i37.GetMessagesBloc>(),
        ));
    gh.factory<_i52.ReplyCommentListBloc>(
        () => _i52.ReplyCommentListBloc(gh<_i23.ICommentRepository>()));
    gh.factory<_i53.CommentLikesBloc>(
        () => _i53.CommentLikesBloc(gh<_i23.ICommentRepository>()));
    gh.factory<_i54.CommentListBloc>(
        () => _i54.CommentListBloc(gh<_i23.ICommentRepository>()));
    gh.factory<_i55.PostCreateBloc>(() => _i55.PostCreateBloc(
          gh<_i45.IPostRepository>(),
          gh<_i19.IProfileInfoRepository>(),
          gh<_i22.IAuthFacade>(),
        ));
    gh.factory<_i56.PostListBloc>(() => _i56.PostListBloc(
          gh<_i45.IPostRepository>(),
          gh<_i42.MyProfileInfoBloc>(),
          gh<_i49.MyPostListBloc>(),
        ));
    gh.factory<_i57.UserDetailBloc>(
        () => _i57.UserDetailBloc(gh<_i26.IUserRepository>()));
    gh.factory<_i58.CommentCreateBloc>(() => _i58.CommentCreateBloc(
          gh<_i23.ICommentRepository>(),
          gh<_i11.IAuthFacade>(),
          gh<_i19.IProfileInfoRepository>(),
          gh<_i54.CommentListBloc>(),
        ));
    gh.factory<_i59.AddReplyCommentBloc>(() => _i59.AddReplyCommentBloc(
          gh<_i23.ICommentRepository>(),
          gh<_i19.IProfileInfoRepository>(),
          gh<_i11.IAuthFacade>(),
          gh<_i56.PostListBloc>(),
          gh<_i52.ReplyCommentListBloc>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    gh.factory<_i60.CommunityCreateBloc>(() => _i60.CommunityCreateBloc(
          gh<_i28.ICommunityRepository>(),
          gh<_i22.IAuthFacade>(),
          gh<_i46.MyCommunityListBloc>(),
          gh<_i35.CommunityListBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i61.FirebaseModule {}
