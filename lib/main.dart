import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/bootstrap.dart';
import 'package:w_sharme_beauty/core/utils/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  lazyBootstrap(
    WidgetsFlutterBinding.ensureInitialized(),
    Environment.dev,
  );
}
