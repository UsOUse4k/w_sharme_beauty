import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/di/injector.config.dart';
import 'package:w_sharme_beauty/features/auth/data/repositories/firebase_auth_facede.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facede.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({String? environment}) =>
    getIt.init(environment: environment);

Future<void> setup() async {
  // External
  getIt.registerLazySingleton<firebase_auth.FirebaseAuth>(
      () => firebase_auth.FirebaseAuth.instance,);
  getIt.registerLazySingleton<firebase_store.FirebaseFirestore>(
      () => firebase_store.FirebaseFirestore.instance,);

  // Repository
  getIt.registerLazySingleton<IAuthFacede>(
    () => FirebaseAuthFacede(
      getIt<firebase_auth.FirebaseAuth>(),
      getIt<firebase_store.FirebaseFirestore>(),
    ),
  );

  // BLoC
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      getIt<IAuthFacede>(),
    ),
  );
}
