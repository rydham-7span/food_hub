import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app/app/routes/route_guards/auth_guard.dart';
import 'package:food_app/app/routes/route_guards/dashboard_guard.dart';
import 'package:food_app/core/presentation/widgets/image_cropper/custom_image_cropper.dart';
import 'package:food_app/modules/splash/screen/splash.dart';

part 'app_router.gr.dart';

/// [Doc Link](abc)
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(
        //   path: '/login',
        //   page: LoginRoute.page,
        // ),
        // AutoRoute(
        //   path: '/update',
        //   page: UpdateRoute.page,
        // ),
        // AutoRoute(
        //   path: '/reset',
        //   page: ResetPasswordRoute.page,
        // ),
        // AutoRoute(
        //   path: '/reset-password/:token',
        //   guards: [
        //     ResetGuard(),
        //   ],
        //   page: ResetPwdDeeplinkRoute.page,
        // ),
        AutoRoute(
          path: '/splash',
          initial: true,
          page: SplashRoute.page,
        ),
        // AutoRoute(
        //   page: SettingRoute.page,
        // ),
        // AutoRoute(
        //   page: SellAndScanSettingRoute.page,
        // ),
        // AutoRoute(
        //   page: ScanModeRoute.page,
        // ),
        // AutoRoute(
        //   page: RequiredBuyerInformationRoute.page,
        // ),
        // AutoRoute(
        //   page: SelectScanModeRoute.page,
        // ),
        // AutoRoute(
        //   page: HelpRoute.page,
        // ),
        // AutoRoute(
        //   page: LegalRoute.page,
        // ),
        // AutoRoute(
        //   page: SyncRoute.page,
        // ),
        // AutoRoute(
        //   path: '/dashboard_event_bottom',
        //   page: DashboardEventBottomRoute.page,
        //   children: [
        //     AutoRoute(
        //       path: 'dashboard_event',
        //       page: DashboardEventRoute.page,
        //       initial: true,
        //     ),
        //     AutoRoute(
        //       path: 'setting',
        //       page: SettingRoute.page,
        //     ),
        //   ],
        // ),
        // AutoRoute(
        //   guards: [
        //     DashboardGuard(),
        //   ],
        //   path: '/dashboard_statastics_bottom',
        //   page: DashboardStatisticsBottomRoute.page,
        //   children: [
        //     AutoRoute(
        //       path: 'dashboard_statastic',
        //       page: DashboardStatisticsRoute.page,
        //       initial: true,
        //     ),
        //     AutoRoute(
        //       path: 'guest_empty',
        //       page: GuestEmptyRoute.page,
        //       children: [
        //         AutoRoute(path: '', page: GuestListHomeRoute.page),
        //         AutoRoute(
        //           path: 'guest_profile',
        //           page: GuestProfileRoute.page,
        //         ),
        //         AutoRoute(
        //           path: 'guest_contact_info',
        //           page: GuestContactInfoRoute.page,
        //         ),
        //       ],
        //     ),
        //     AutoRoute(
        //       path: 'scanner',
        //       page: ScannerRoute.page,
        //     ),
        //     AutoRoute(
        //       path: 'setting',
        //       page: SettingEmptyRoute.page,
        //       children: [
        //         AutoRoute(path: '', page: SettingRoute.page),
        //         AutoRoute(path: 'scan_setting', page: SellAndScanSettingRoute.page),
        //         AutoRoute(path: 'scan_mode', page: ScanModeRoute.page),
        //       ],
        //     ),
        //     AutoRoute(
        //       path: 'roles',
        //       page: RolesEmptyRoute.page,
        //       children: [
        //         AutoRoute(path: '', page: RoleHomeRoute.page),
        //         AutoRoute(
        //           page: CreateRoleRoute.page,
        //         ),
        //         AutoRoute(
        //           page: SelectRoleRoute.page,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ];
}

@RoutePage()
class GuestEmptyScreen extends AutoRouter {
  const GuestEmptyScreen({super.key});
}

@RoutePage()
class SettingEmptyScreen extends AutoRouter {
  const SettingEmptyScreen({super.key});
}

@RoutePage()
class RolesEmptyScreen extends AutoRouter {
  const RolesEmptyScreen({super.key});
}
