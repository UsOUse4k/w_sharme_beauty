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
    as _i7;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i9;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i6;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i12;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i8;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i11;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/profile/data/data/firebase_post_facade.dart'
    as _i14;
import 'package:w_sharme_beauty/features/profile/domain/repositories/repositories.dart'
    as _i13;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/post_bloc/post_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/firebase_module.dart' as _i16;

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
    gh.lazySingleton<_i6.IAuthFacade>(() => _i7.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i8.LogoutUC>(
        () => _i8.LogoutUC(repository: gh<_i9.IAuthFacade>()));
    gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(gh<_i9.IAuthFacade>()));
    gh.factory<_i11.RegisterWithEmailUC>(
        () => _i11.RegisterWithEmailUC(repository: gh<_i6.IAuthFacade>()));
    gh.factory<_i12.LoginWithEmailUC>(
        () => _i12.LoginWithEmailUC(repository: gh<_i6.IAuthFacade>()));
    gh.lazySingleton<_i13.PostRepository>(() => _i14.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i15.PostBloc>(() => _i15.PostBloc(gh<_i13.PostRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i16.FirebaseModule {}
