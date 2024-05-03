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
    as _i24;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i23;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i17;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i19;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i18;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i22;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i26;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i25;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_profile_facade.dart'
    as _i16;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i15;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i27;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i14;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i13;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/firebase_module.dart' as _i35;

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
    gh.factory<_i6.QuestionBloc>(() => _i6.QuestionBloc());
    gh.factory<_i7.CommunityListBloc>(() => _i7.CommunityListBloc());
    gh.factory<_i8.CommunityLikeBloc>(() => _i8.CommunityLikeBloc());
    gh.lazySingleton<_i9.IAuthFacade>(() => _i10.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i11.LogoutUC>(
        () => _i11.LogoutUC(repository: gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i13.AddQuestionRepository>(
        () => _i14.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i15.IProfileInfoRepository>(
        () => _i16.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i18.ICommentRepository>(() => _i19.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i20.CommentCreateBloc>(() => _i20.CommentCreateBloc(
          gh<_i18.ICommentRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.lazySingleton<_i21.ICommunityRepository>(
        () => _i22.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i23.RegisterWithEmailUC>(
        () => _i23.RegisterWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i24.LoginWithEmailUC>(
        () => _i24.LoginWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.lazySingleton<_i25.IPostRepository>(() => _i26.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i27.ProfileInfoUpdateBloc>(() => _i27.ProfileInfoUpdateBloc(
          gh<_i15.IProfileInfoRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i28.MyProfileInfoBloc>(() => _i28.MyProfileInfoBloc(
          gh<_i12.IAuthFacade>(),
          gh<_i15.IProfileInfoRepository>(),
        ));
    gh.factory<_i29.PostListBloc>(() => _i29.PostListBloc(
          gh<_i25.IPostRepository>(),
          gh<_i28.MyProfileInfoBloc>(),
        ));
    gh.factory<_i30.PostLikeBloc>(
        () => _i30.PostLikeBloc(gh<_i25.IPostRepository>()));
    gh.factory<_i31.CommunityCreateBloc>(() => _i31.CommunityCreateBloc(
          gh<_i21.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i32.PostDetailBloc>(() => _i32.PostDetailBloc(
          gh<_i25.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i33.MyPostListBloc>(() => _i33.MyPostListBloc(
          gh<_i25.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i34.PostCreateBloc>(() => _i34.PostCreateBloc(
          gh<_i25.IPostRepository>(),
          gh<_i15.IProfileInfoRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i35.FirebaseModule {}
