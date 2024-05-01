// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:w_sharme_beauty/features/auth/data/repositories/firebase_auth_facade.dart'
    as _i6;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i8;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i5;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i7;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i14;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i10;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i9;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i16;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i13;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/firebase_module.dart' as _i17;

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
    gh.lazySingleton<_i5.IAuthFacade>(() => _i6.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i7.LogoutUC>(
        () => _i7.LogoutUC(repository: gh<_i8.IAuthFacade>()));
    gh.lazySingleton<_i9.IPostRepository>(() => _i10.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i12.PostListBloc>(
        () => _i12.PostListBloc(gh<_i9.IPostRepository>()));
    gh.factory<_i13.PostCreateBloc>(
        () => _i13.PostCreateBloc(gh<_i9.IPostRepository>()));
    gh.factory<_i14.RegisterWithEmailUC>(
        () => _i14.RegisterWithEmailUC(repository: gh<_i5.IAuthFacade>()));
    gh.factory<_i15.LoginWithEmailUC>(
        () => _i15.LoginWithEmailUC(repository: gh<_i5.IAuthFacade>()));
    gh.factory<_i16.MyPostListBloc>(() => _i16.MyPostListBloc(
          gh<_i9.IPostRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i17.FirebaseModule {}
