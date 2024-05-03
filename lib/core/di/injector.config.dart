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
    as _i19;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i18;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/communities/data/data/firebase_community_repository.dart'
    as _i17;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i16;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i21;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i20;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i14;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i13;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/firebase_module.dart' as _i27;

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
    gh.factory<_i6.CommunityListBloc>(() => _i6.CommunityListBloc());
    gh.factory<_i7.CommunityLikeBloc>(() => _i7.CommunityLikeBloc());
    gh.factory<_i8.QuestionBloc>(() => _i8.QuestionBloc());
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
    gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i16.ICommunityRepository>(
        () => _i17.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i18.RegisterWithEmailUC>(
        () => _i18.RegisterWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i19.LoginWithEmailUC>(
        () => _i19.LoginWithEmailUC(repository: gh<_i9.IAuthFacade>()));
    gh.lazySingleton<_i20.IPostRepository>(() => _i21.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i22.PostLikeBloc>(
        () => _i22.PostLikeBloc(gh<_i20.IPostRepository>()));
    gh.factory<_i23.CommunityCreateBloc>(() => _i23.CommunityCreateBloc(
          gh<_i16.ICommunityRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i24.MyPostListBloc>(() => _i24.MyPostListBloc(
          gh<_i20.IPostRepository>(),
          gh<_i12.IAuthFacade>(),
        ));
    gh.factory<_i25.PostListBloc>(
        () => _i25.PostListBloc(gh<_i20.IPostRepository>()));
    gh.factory<_i26.PostCreateBloc>(
        () => _i26.PostCreateBloc(gh<_i20.IPostRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i27.FirebaseModule {}
