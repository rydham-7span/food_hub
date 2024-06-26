import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/config/app_config.dart';
import 'package:food_app/app/config/app_constants.dart';
import 'package:food_app/core/domain/bloc/connectivity_cubit.dart';
import 'package:food_app/core/domain/bloc/roles_permission_cubit.dart';
import 'package:food_app/core/domain/bloc/theme_bloc.dart';
import 'package:food_localization/food_localization.dart';
import 'package:food_ui/food_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'packages/food_localization/assets/l10n',
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (BuildContext context) => ThemeBloc(),
          ),
          // BlocProvider<ConnectivityCubit>(
          //   create: (BuildContext context) => ConnectivityCubit(),
          //   lazy: false,
          // ),
          // BlocProvider<RolesPermissionCubit>(
          //   create: (BuildContext context) => RolesPermissionCubit(),
          //   lazy: false,
          // ),
        ],
        child: BlocBuilder<ThemeBloc, AppThemeColorMode>(
          builder: (BuildContext context, AppThemeColorMode themeMode) {
            return AppResponsiveTheme(
              colorMode: themeMode,
              child: MaterialApp.router(
                routerConfig: AppConfig.appRouter.config(
                    // rebuildStackOnDeepLink: true,
                    // deepLinkBuilder: (deeplink) {
                    //   return deeplink;
                    // },
                    ),
                title: AppConstants.appName,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  splashFactory: InkRipple.splashFactory,
                  textSelectionTheme: TextSelectionThemeData(
                    selectionHandleColor: context.colorScheme.blackColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
