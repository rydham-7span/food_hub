// ignore_for_file: non_constant_identifier_names

import 'package:envied/envied.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/app/helpers/injection.dart';
import 'package:food_app/app/routes/app_router.dart';
import 'package:food_client/food_client.dart';

// part 'app_config.g.dart';

final class AppConfig {
//   const AppConfig();
//   static String get environmentName => _getEnvironmentName;
//   static String get baseApiUrl => _getBaseApiUrl;
//   static String get seatsIoKey => _getSeatsKey;
//   static Env environment = Env.development;
  static AppRouter appRouter = getIt<AppRouter>();
}
//
//   /// This variable is used to ensure that a user can setup the config only one time.
//   static bool _isSetupComplete = false;
//
//   static Unit setEnvConfig(Env env) {
//     if (!_isSetupComplete) {
//       environment = env;
//       _isSetupComplete = true;
//     }
//     return unit;
//   }
//
//   static String get _getSeatsKey {
//     switch (environment) {
//       case Env.development:
//         return EnvDev.ENV_SEATS_IO_KEY;
//       case Env.staging:
//         return EnvDev.ENV_SEATS_IO_KEY;
//       case Env.production:
//         return EnvProd.ENV_SEATS_IO_KEY;
//     }
//   }
//
//   static String get _getEnvironmentName {
//     switch (environment) {
//       case Env.development:
//         return EnvDev.ENV_NAME;
//       case Env.production:
//         return EnvProd.ENV_NAME;
//       case Env.staging:
//         return EnvProd.ENV_NAME;
//     }
//   }
//
//   static String get _getBaseApiUrl {
//     switch (environment) {
//       case Env.development:
//         return EnvDev.ENV_BASE_API_URL;
//       case Env.production:
//         return EnvProd.ENV_BASE_API_URL;
//       case Env.staging:
//         return EnvProd.ENV_BASE_API_URL;
//     }
//   }
// }
//
// @Envied(path: '.env.dev')
// abstract class EnvDev {
//   @EnviedField(varName: 'BASE_API_URL', obfuscate: true)
//   static final String ENV_BASE_API_URL = _EnvDev.ENV_BASE_API_URL;
//   @EnviedField(varName: 'ENV', obfuscate: true)
//   static final String ENV_NAME = _EnvDev.ENV_NAME;
//   @EnviedField(varName: 'SEATS_IO_KEY', obfuscate: true)
//   static final String ENV_SEATS_IO_KEY = _EnvDev.ENV_SEATS_IO_KEY;
// }
//
// @Envied(path: '.env.prod')
// abstract class EnvProd {
//   @EnviedField(varName: 'BASE_API_URL', obfuscate: true)
//   static final String ENV_BASE_API_URL = _EnvProd.ENV_BASE_API_URL;
//   @EnviedField(varName: 'ENV', obfuscate: true)
//   static final String ENV_NAME = _EnvProd.ENV_NAME;
//   @EnviedField(varName: 'SEATS_IO_KEY', obfuscate: true)
//   static final String ENV_SEATS_IO_KEY = _EnvProd.ENV_SEATS_IO_KEY;
// }
