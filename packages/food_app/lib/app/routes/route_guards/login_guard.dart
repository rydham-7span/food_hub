// import 'package:auto_route/auto_route.dart';
// import 'package:fitness_app/app/helpers/extensions/extensions.dart';
// import 'package:fitness_app/app/routes/app_router.dart';
//
// class LoginGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (resolver.isEmailVerified == null) {
//       resolver.redirect(const LoginRoute());
//     } else {
//       if (resolver.isCoach ?? false) {
//         if ((resolver.isEmailVerified ?? false) && (resolver.isCoachVerified ?? false) && (resolver.isUserOnboarded ?? false)) {
//           resolver.next();
//         } else if ((resolver.isEmailVerified ?? false) && (resolver.isUserOnboarded ?? false)) {
//           resolver.redirect(const ProfileReviewRoute());
//         } else if ((resolver.isEmailVerified ?? false) && !(resolver.isUserOnboarded ?? false)) {
//           resolver.redirect(const PostLoginRoute());
//         } else {
//           resolver.redirect(VerifyAccountRoute());
//         }
//       } else {
//         if ((resolver.isEmailVerified ?? false) && (resolver.isUserOnboarded ?? false)) {
//           resolver.next();
//         } else if (!(resolver.isEmailVerified ?? false)) {
//           resolver.redirect(VerifyAccountRoute());
//         } else {
//           resolver.redirect(const ProfileOnboardingRoute());
//         }
//       }
//     }
//   }
// }
