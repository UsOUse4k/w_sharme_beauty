import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';

Future<void> lazyBootstrap(
  WidgetsBinding widgetsBinding,
  String environment,
) async {
  configureDependencies(environment: environment);

  runApp(const App());
}
