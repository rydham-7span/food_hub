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
// extension GetUsernameExtension on NavigationResolver {
//   bool get rememberMe => getIt<IAuthService>().getUserData().fold(
//         () => false,
//         (model) => model.first.rememberMe ?? false,
//       );
//
//   bool get isEventSelected => getIt<IAuthService>().getUserEvent().fold(
//         () => false,
//         (model) => model.first.uuid?.isNotEmpty ?? false,
//       );
//
//   bool get isUserExists => getIt<IAuthService>().getUserData().fold(
//         () => false,
//         (model) => true,
//       );
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
