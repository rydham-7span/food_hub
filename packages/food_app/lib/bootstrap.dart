import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/app/helpers/injection.dart';
import 'package:food_app/app/routes/app_router.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_localization/food_localization.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, Env env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initializeSingletons();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(await builder());
}

void initializeSingletons() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
