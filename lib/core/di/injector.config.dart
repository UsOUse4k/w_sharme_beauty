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
    as _i21;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i10;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i20;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i16;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i18;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/bloc/community_list_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i23;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i22;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i27;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_profile_facade.dart'
    as _i15;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i14;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i13;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i12;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/firebase_module.dart' as _i31;

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
    gh.lazySingleton<_i8.IAuthFacade>(() => _i9.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i10.LogoutUC>(
        () => _i10.LogoutUC(repository: gh<_i11.IAuthFacade>()));
    gh.lazySingleton<_i12.AddQuestionRepository>(
        () => _i13.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i14.IProfileInfoRepository>(
        () => _i15.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(gh<_i11.IAuthFacade>()));
    gh.lazySingleton<_i17.ICommentRepository>(() => _i18.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i19.CommentCreateBloc>(() => _i19.CommentCreateBloc(
          gh<_i17.ICommentRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.factory<_i20.RegisterWithEmailUC>(
        () => _i20.RegisterWithEmailUC(repository: gh<_i8.IAuthFacade>()));
    gh.factory<_i21.LoginWithEmailUC>(
        () => _i21.LoginWithEmailUC(repository: gh<_i8.IAuthFacade>()));
    gh.lazySingleton<_i22.IPostRepository>(() => _i23.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i24.ProfileInfoUpdateBloc>(() => _i24.ProfileInfoUpdateBloc(
          gh<_i14.IProfileInfoRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.factory<_i25.MyProfileInfoBloc>(() => _i25.MyProfileInfoBloc(
          gh<_i11.IAuthFacade>(),
          gh<_i14.IProfileInfoRepository>(),
        ));
    gh.factory<_i26.PostLikeBloc>(
        () => _i26.PostLikeBloc(gh<_i22.IPostRepository>()));
    gh.factory<_i27.MyPostListBloc>(() => _i27.MyPostListBloc(
          gh<_i22.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i28.PostDetailBloc>(() => _i28.PostDetailBloc(
          gh<_i22.IPostRepository>(),
          gh<_i11.IAuthFacade>(),
        ));
    gh.factory<_i29.PostListBloc>(
        () => _i29.PostListBloc(gh<_i22.IPostRepository>()));
    gh.factory<_i30.PostCreateBloc>(
        () => _i30.PostCreateBloc(gh<_i22.IPostRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i31.FirebaseModule {}
