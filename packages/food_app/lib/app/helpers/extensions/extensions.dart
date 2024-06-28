// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/app/helpers/injection.dart';
// import 'package:food_app/core/data/services/auth_service.dart';
// import 'package:food_app/core/domain/bloc/connectivity_cubit.dart';
// import 'package:food_app/core/domain/bloc/roles_permission_cubit.dart';
// import 'package:food_app/core/domain/bloc/roles_permission_state.dart';
// import 'package:food_app/modules/auth/model/event_model.dart';
// import 'package:food_app/modules/auth/model/user_model.dart';
// import 'package:food_app/modules/role/model/permission_model.dart';
//
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/app/helpers/injection.dart';
import 'package:food_app/core/data/services/auth_service.dart';

extension GetUsernameExtension on NavigationResolver {
  Future<bool> get isUserAdmin async {
    final db = FirebaseFirestore.instance;
    final data = await db.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).get();
    final isAdmin = data.data()?.values.first as bool;
    return isAdmin;
    // return ;
  }

// bool get isUserAdmin {
//   TaskEither(_run)
//
//   final db = FirebaseFirestore.instance;
//   final data = await db.collection('user').doc(value).get();
//   final isAdmin = data.data()?.values.first as bool;
//   return isAdmin;
// return getIt<IAuthService>().checkForAdmin(FirebaseAuth.instance.currentUser?.uid ?? '').fold(
//       () => false,
//       (model) => true,
//     );
}
// }
//
// extension GetCurrentUser on BuildContext {
//   UserModel? get user => getIt<IAuthService>().getUserData().fold(() => null, (model) => model.first);
//
//   String? get currentCurrency => getIt<IAuthService>().getUserData().fold(() => null, (model) => model.first.currency);
//
//   bool get rememberMe => getIt<IAuthService>().getUserData().fold(
//         () => false,
//         (model) => model.first.rememberMe ?? false,
//       );
//
//   EventModel? get currentEvent => getIt<IAuthService>().getUserEvent().fold(
//         () => null,
//         (model) => model.first,
//       );
//
//   int get scanMode => getIt<IAuthService>().getUserData().fold(
//         () => 0,
//         (model) => model.first.scanMode ?? 0,
//       );
//
//   PermissionModel? get permissionsFromDb => getIt<IAuthService>().getPermissionForEvent().fold(
//         () => null,
//         (model) => model,
//   );
//
//   bool get isOffline => read<ConnectivityCubit>().isOffline;
//   bool get isYetToSync => read<ConnectivityCubit>().state.isYetToSync;
//   RolesPermissionState get permissions => read<RolesPermissionCubit>().state;
// }
