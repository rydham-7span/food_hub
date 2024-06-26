// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/app/helpers/injection.dart';
// import 'package:food_app/core/data/services/auth_service.dart';
// import 'package:food_app/core/domain/bloc/roles_permission_state.dart';
// import 'package:food_app/modules/role/model/permission_model.dart';
// import 'package:food_client/food_client.dart';
//
// class RolesPermissionCubit extends Cubit<RolesPermissionState> {
//   RolesPermissionCubit() : super(const RolesPermissionState()) {
//     _fetchPermissions();
//   }
//
//   final _authService = getIt<IAuthService>();
//   Unit _fetchPermissions() {
//     final result =
//         _authService.getPermissionForEvent().fold(() => null, (model) => model);
//     if (result != null) {
//       emit(state.copyWith(permissionModel: result));
//     }
//     return unit;
//   }
//
//   Future<Unit> updatePermission(PermissionModel model) async {
//     await _authService.deletePermission().run();
//     await _authService.setEventWisePermission(model).run();
//     _fetchPermissions();
//     return unit;
//   }
//
//   Future<Unit> clearState()async{
//     await _authService.deletePermission().run();
//     state.permissionModel?.copyWith(
//       rolePermission: RoleModule(),
//       guestPermission: GuestModule(),
//       eventDashboardPermission: EventDashboardModule(),
//       scannerPermission: ScannerModule(),
//     );
//     return unit;
//   }
// }
