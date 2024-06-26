import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_localization/food_localization.dart';
import 'package:food_ui/food_ui.dart';

@RoutePage()
class SplashScreen extends StatefulWidget /*implements AutoRouteWrapper*/ {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    // _decideRoute(context);
    super.didChangeDependencies();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.mainThemeColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.maxFinite,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Assets.icons.iconSvg.svg(
                height: 110,
                width: 110,
                color: context.colorScheme.mainThemeColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: AppText(
              LocaleKeys.food_hub.tr().toUpperCase(),
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

// Future<u.Unit> _decideRoute(BuildContext context) async {
//   // final isRememberMe = context.rememberMe;
//   final router = context.router;
//   if (router.current.name != ResetPwdDeeplinkRoute.name) {
//     if (isRememberMe) {
//       final auth = LocalAuthentication();
//       final isSupported = await auth.isDeviceSupported();
//       if (isSupported) {
//         await router.pushAndPopUntil(
//           LoginRoute(firstTimeLogin: false),
//           predicate: (_) => false,
//         );
//       } else {
//         await router.pushAndPopUntil(
//           const DashboardStatisticsBottomRoute(),
//           predicate: (_) => false,
//         );
//       }
//     } else {
//       await router.pushAndPopUntil(
//         LoginRoute(firstTimeLogin: true),
//         predicate: (_) => false,
//       );
//     }
//   }
//   return u.unit;
// }
}
