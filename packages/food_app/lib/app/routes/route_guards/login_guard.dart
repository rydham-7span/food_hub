import 'package:auto_route/auto_route.dart';
import 'package:food_app/app/helpers/extensions/extensions.dart';
import 'package:food_app/app/routes/app_router.dart';

class LoginGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAdmin = await resolver.isUserAdmin;

    if (isAdmin) {
      await resolver.redirect(const AdminHomeRoute());
    } else {
      resolver.next();
    }
  }
}
