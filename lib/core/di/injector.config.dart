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
    as _i9;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i8;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i28;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i10;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i27;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i22;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_post_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i16;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i25;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i13;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i12;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i35;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i38;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i39;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_profile_facade.dart'
    as _i19;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i18;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i15;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i14;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/firebase_module.dart' as _i42;

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
    gh.factory<_i7.QuestionBloc>(() => _i7.QuestionBloc());
    gh.lazySingleton<_i8.IAuthFacade>(() => _i9.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i10.LogoutUC>(
        () => _i10.LogoutUC(repository: gh<_i11.IAuthFacade>()));
    gh.lazySingleton<_i12.IPostRepository>(() => _i13.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i14.AddQuestionRepository>(
        () => _i15.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i16.ICommunityPostRepository>(
        () => _i17.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i18.IProfileInfoRepository>(
        () => _i19.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(gh<_i11.IAuthFacade>()));
    gh.lazySingleton<_i21.ICommentRepository>(() => _i22.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i23.CommunityPostListBloc>(() => _i23.CommunityPostListBloc(
          gh<_i16.ICommunityPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i24.CommentCreateBloc>(() => _i24.CommentCreateBloc(
          gh<_i21.ICommentRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.lazySingleton<_i25.ICommunityRepository>(
        () => _i26.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i27.RegisterWithEmailUC>(
        () => _i27.RegisterWithEmailUC(repository: gh<_i8.IAuthFacade>()));
    gh.factory<_i28.LoginWithEmailUC>(
        () => _i28.LoginWithEmailUC(repository: gh<_i8.IAuthFacade>()));
    gh.factory<_i29.CommunityCreatePostBloc>(() => _i29.CommunityCreatePostBloc(
          gh<_i16.ICommunityPostRepository>(),
          gh<_i18.IProfileInfoRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i30.ProfileInfoUpdateBloc>(() => _i30.ProfileInfoUpdateBloc(
          gh<_i18.IProfileInfoRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.factory<_i31.CommunityListBloc>(
        () => _i31.CommunityListBloc(gh<_i25.ICommunityRepository>()));
    gh.factory<_i32.MyProfileInfoBloc>(() => _i32.MyProfileInfoBloc(
          gh<_i11.IAuthFacade>(),
          gh<_i18.IProfileInfoRepository>(),
        ));
    gh.factory<_i33.CommunityProfileInfoBloc>(
        () => _i33.CommunityProfileInfoBloc(
              gh<_i11.IAuthFacade>(),
              gh<_i18.IProfileInfoRepository>(),
            ));
    gh.factory<_i34.PostListBloc>(() => _i34.PostListBloc(
          gh<_i35.IPostRepository>(),
          gh<_i32.MyProfileInfoBloc>(),
        ));
    gh.factory<_i36.PostLikeBloc>(
        () => _i36.PostLikeBloc(gh<_i35.IPostRepository>()));
    gh.factory<_i37.MyCommunityListBloc>(() => _i37.MyCommunityListBloc(
          gh<_i25.ICommunityRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i38.MyPostListBloc>(() => _i38.MyPostListBloc(
          gh<_i35.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i39.PostDetailBloc>(() => _i39.PostDetailBloc(
          gh<_i35.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i40.PostCreateBloc>(() => _i40.PostCreateBloc(
          gh<_i35.IPostRepository>(),
          gh<_i18.IProfileInfoRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i41.CommunityCreateBloc>(() => _i41.CommunityCreateBloc(
          gh<_i25.ICommunityRepository>(),
          gh<_i11.IAuthFacade>(),
          gh<_i37.MyCommunityListBloc>(),
          gh<_i31.CommunityListBloc>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i42.FirebaseModule {}
