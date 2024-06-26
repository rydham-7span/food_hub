import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:food_app/app/config/app_config.dart';
import 'package:food_app/app/config/app_constants.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/app/helpers/db_helper.dart';
import 'package:food_app/app/helpers/injection.dart';
import 'package:food_app/app/observers/app_bloc_observer.dart';
import 'package:food_app/app/routes/app_router.dart';
import 'package:food_app/core/data/services/auth_service.dart';
import 'package:food_client/food_client.dart';
import 'package:food_localization/food_localization.dart';
import 'package:food_ui/food_ui.dart';
import 'package:food_app/firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, Env env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // AppConfig.setEnvConfig(env);
  initializeSingletons();
  // await getIt<IAuthService>().init();
  // await getIt<DbHelper>().initializeDb(await AppConstants.getDbPath());
  // await getIt<DbHelper>().checkAndInitializeTable();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Bloc.observer = getIt<AppBlocObserver>();
  runApp(await builder());
}

void initializeSingletons() {
  DateTime? firstTimeTriggered;
  getIt
          //       ..registerSingleton<Logger>(
          //         Logger(
          //           filter: ProductionFilter(),
          //           printer: PrettyPrinter(),
          //           output: ConsoleOutput(),
          //         ),
          //       )
          //       ..registerSingleton(AppBlocObserver())
          //       ..registerSingleton<IAuthService>(const AuthService())
          .registerSingleton<AppRouter>(AppRouter())
      //       ..registerSingleton<DbHelper>(DbHelper())
      /* ..registerSingleton<ApiService>(
      ApiService(
        AppConfig.baseApiUrl,
        unauthenticatedCallback: () {
          if (firstTimeTriggered == null ||
              DateTime.now().difference(firstTimeTriggered ?? DateTime.now()).inMilliseconds >
                  2000) {
            firstTimeTriggered = DateTime.now();
            AppConfig.appRouter.replace(
              LoginRoute(firstTimeLogin: true, isFromForcedLogout: true),
            );
            if (getIt<AppRouter>().navigatorKey.currentContext != null) {
              Future.delayed(const Duration(milliseconds: 100)).then(
                (value) => AppUtils.errorDialog(
                  context: getIt<AppRouter>().navigatorKey.currentContext!,
                  contentMsg: LocaleKeys.session_expired.tr(),
                  isInformative: true,
                ),
              );
            }
          }
        },
      ),
    )*/
      ;
}
