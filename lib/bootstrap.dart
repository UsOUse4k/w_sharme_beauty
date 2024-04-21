import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';
import 'package:w_sharme_beauty/firebase_options.dart';

Future<void> lazyBootstrap(
  WidgetsBinding widgetsBinding,
  String environment,
) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies(environment: environment);

  runApp(const App());
}
