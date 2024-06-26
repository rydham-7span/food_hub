import 'package:auto_route/auto_route.dart';
import 'package:food_app/app/helpers/extensions/extensions.dart';
import 'package:food_app/app/routes/app_router.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (resolver.rememberMe) {
//       resolver.next();
//     } else {
//       resolver.redirect(LoginRoute(firstTimeLogin: true));
//     }
//   }
// }
//
// class ResetGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (router.current.path == '/dashboard_event_bottom' || router.current.path == '/dashboard_statastics_bottom') {
//       if (router.current.path == '/dashboard_event_bottom') {
//         router.replace(const DashboardEventBottomRoute());
//       } else {
//         router.replace(const DashboardStatisticsBottomRoute());
//       }
//     } else {
//       resolver.next();
//     }
//   }
// }
