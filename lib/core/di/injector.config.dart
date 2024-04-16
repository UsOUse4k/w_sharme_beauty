// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facede.dart'
    as _i4;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i6;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i7;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i3;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i5;

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
    gh.factory<_i3.LogoutUC>(
        () => _i3.LogoutUC(repository: gh<_i4.IAuthFacede>()));
    gh.factory<_i5.RegisterWithEmailUC>(
        () => _i5.RegisterWithEmailUC(repository: gh<_i6.IAuthFacede>()));
    gh.factory<_i7.LoginWithEmailUC>(
        () => _i7.LoginWithEmailUC(repository: gh<_i6.IAuthFacede>()));
    return this;
  }
}
