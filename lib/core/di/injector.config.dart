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
    as _i10;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i12;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i9;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i32;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i31;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i25;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i24;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_comment_facade.dart'
    as _i18;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_post_repository.dart'
    as _i20;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i30;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i19;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i14;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i13;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i40;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i53;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_profile_facade.dart'
    as _i22;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i16;
import 'package:w_sharme_beauty/features/question/data/data/firebase_get_question_facade.dart'
    as _i27;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i15;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i51;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/firebase_module.dart' as _i59;

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
    gh.factory<_i8.CommunityParentCommetIdBloc>(
        () => _i8.CommunityParentCommetIdBloc());
    gh.lazySingleton<_i9.IAuthFacade>(() => _i10.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i11.LogoutUC>(
        () => _i11.LogoutUC(repository: gh<_i12.IAuthFacade>()));
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
    gh.lazySingleton<_i17.ICommunityCommentRepository>(
        () => _i18.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i19.ICommunityPostRepository>(
        () => _i20.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i21.IProfileInfoRepository>(
        () => _i22.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i24.ICommentRepository>(() => _i25.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i26.IQuestionRepository>(
        () => _i27.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i28.CommunityPostListBloc>(() => _i28.CommunityPostListBloc(
          gh<_i19.ICommunityPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.lazySingleton<_i29.ICommunityRepository>(
        () => _i30.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i31.RegisterWithEmailUC>(
        () => _i31.RegisterWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i32.LoginWithEmailUC>(
        () => _i32.LoginWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i33.CommunityCreatePostBloc>(() => _i33.CommunityCreatePostBloc(
          gh<_i19.ICommunityPostRepository>(),
          gh<_i21.IProfileInfoRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i34.CommunityDetailBloc>(
        () => _i34.CommunityDetailBloc(gh<_i29.ICommunityRepository>()));
    gh.factory<_i35.ProfileInfoUpdateBloc>(() => _i35.ProfileInfoUpdateBloc(
          gh<_i21.IProfileInfoRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i36.CommunityListBloc>(
        () => _i36.CommunityListBloc(gh<_i29.ICommunityRepository>()));
    gh.factory<_i37.CommunityProfileInfoBloc>(
        () => _i37.CommunityProfileInfoBloc(
              gh<_i12.IAuthFacade>(),
              gh<_i21.IProfileInfoRepository>(),
            ));
    gh.factory<_i38.MyProfileInfoBloc>(() => _i38.MyProfileInfoBloc(
          gh<_i12.IAuthFacade>(),
          gh<_i21.IProfileInfoRepository>(),
        ));
    gh.factory<_i39.PostLikeBloc>(() => _i39.PostLikeBloc(
          gh<_i40.IPostRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i41.MyCommunityListBloc>(() => _i41.MyCommunityListBloc(
          gh<_i29.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i42.PostDetailBloc>(() => _i42.PostDetailBloc(
          gh<_i40.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i43.MyPostListBloc>(() => _i43.MyPostListBloc(
          gh<_i40.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i44.CommunityCommentLikesBloc>(() =>
        _i44.CommunityCommentLikesBloc(gh<_i17.ICommunityCommentRepository>()));
    gh.factory<_i45.CommunityCommentListBloc>(() =>
        _i45.CommunityCommentListBloc(gh<_i17.ICommunityCommentRepository>()));
    gh.factory<_i46.CommunityReplyCommentListBloc>(() =>
        _i46.CommunityReplyCommentListBloc(
            gh<_i17.ICommunityCommentRepository>()));
    gh.factory<_i47.CommunityAddReplyCommentBloc>(
        () => _i47.CommunityAddReplyCommentBloc(
              gh<_i17.ICommunityCommentRepository>(),
              gh<_i21.IProfileInfoRepository>(),
              gh<_i12.IAuthFacade>(),
              gh<_i28.CommunityPostListBloc>(),
              gh<_i46.CommunityReplyCommentListBloc>(),
              gh<_i8.CommunityParentCommetIdBloc>(),
            ));
    gh.factory<_i48.ReplyCommentListBloc>(
        () => _i48.ReplyCommentListBloc(gh<_i24.ICommentRepository>()));
    gh.factory<_i49.CommentLikesBloc>(
        () => _i49.CommentLikesBloc(gh<_i24.ICommentRepository>()));
    gh.factory<_i50.CommentListBloc>(
        () => _i50.CommentListBloc(gh<_i24.ICommentRepository>()));
    gh.factory<_i51.QuestionBloc>(() => _i51.QuestionBloc(
          gh<_i15.AddQuestionRepository>(),
          gh<_i21.IProfileInfoRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i52.PostCreateBloc>(() => _i52.PostCreateBloc(
          gh<_i40.IPostRepository>(),
          gh<_i21.IProfileInfoRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i53.PostListBloc>(() => _i53.PostListBloc(
          gh<_i40.IPostRepository>(),
          gh<_i38.MyProfileInfoBloc>(),
          gh<_i43.MyPostListBloc>(),
        ));
    gh.factory<_i54.GetAllQuestionBloc>(
        () => _i54.GetAllQuestionBloc(gh<_i26.IQuestionRepository>()));
    gh.factory<_i55.CommentCreateBloc>(() => _i55.CommentCreateBloc(
          gh<_i24.ICommentRepository>(),
          gh<_i9.IAuthFacade>(),
          gh<_i21.IProfileInfoRepository>(),
          gh<_i50.CommentListBloc>(),
        ));
    gh.factory<_i56.AddReplyCommentBloc>(() => _i56.AddReplyCommentBloc(
          gh<_i24.ICommentRepository>(),
          gh<_i21.IProfileInfoRepository>(),
          gh<_i9.IAuthFacade>(),
          gh<_i53.PostListBloc>(),
          gh<_i48.ReplyCommentListBloc>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    gh.factory<_i57.CommunityCreateBloc>(() => _i57.CommunityCreateBloc(
          gh<_i29.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
          gh<_i41.MyCommunityListBloc>(),
          gh<_i36.CommunityListBloc>(),
        ));
    gh.factory<_i58.CommunityCommentCreateBloc>(
        () => _i58.CommunityCommentCreateBloc(
              gh<_i17.ICommunityCommentRepository>(),
              gh<_i12.IAuthFacade>(),
              gh<_i21.IProfileInfoRepository>(),
              gh<_i45.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i59.FirebaseModule {}
