// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:food_app/app/config/app_constants.dart';
// import 'package:food_app/app/enum.dart';
// import 'package:food_app/core/domain/failure_impl.dart';
// import 'package:food_app/modules/auth/model/event_model.dart';
// import 'package:food_app/modules/auth/model/user_model.dart';
// import 'package:food_app/modules/role/model/permission_model.dart';
// import 'package:food_client/food_client.dart';
//
// abstract interface class IAuthService {
//   Future<Unit> init();
//
//   TaskEither<Failure, Unit> setAccessToken(String accessToken);
//
//   TaskEither<Failure, Unit> setScannerCode(String scannerCode);
//
//   TaskEither<Failure, Unit> setLastSyncTime(int lastSyncTime);
//
//   TaskEither<Failure, Unit> setUserData(UserModel userModel);
//
//   TaskEither<Failure, Unit> setUserEvent(EventModel eventModel);
//
//   TaskEither<Failure, Unit> setEventWisePermission(
//     PermissionModel permissionModel,
//   );
//
//   Task<Unit> deleteUserData();
//
//   Task<Unit> deleteEventData();
//
//   Task<Unit> deleteSyncData();
//
//   Task<Unit> deletePermission();
//
//   Option<String?> getAccessToken();
//
//   Option<String?> getScannerCode();
//
//   Option<int?> getLastSyncTime();
//
//   Option<List<UserModel>> getUserData();
//
//   Option<List<EventModel>> getUserEvent();
//
//   Option<PermissionModel> getPermissionForEvent();
//
//   Task<Unit> clearData();
//
//   static QRViewController? qrViewController;
// }
//
// final class AuthService implements IAuthService {
//   const AuthService();
//
//   @override
//   Future<Unit> init() async {
//     await Hive.initFlutter();
//     Hive
//       ..registerAdapter(UserModelAdapter())
//       ..registerAdapter(EventModelAdapter())
//       ..registerAdapter(PermissionModelAdapter())
//       ..registerAdapter(ScannerModuleAdapter())
//       ..registerAdapter(GuestModuleAdapter())
//       ..registerAdapter(EventDashboardModuleAdapter())
//       ..registerAdapter(RoleModuleAdapter());
//     await Hive.openBox<UserModel>(USER.data.value);
//     await Hive.openBox<EventModel>(USER.event.value);
//     await Hive.openBox<PermissionModel>(USER.permission.value);
//     await Hive.openBox<String>(USER.token.value);
//     await Hive.openBox<String>(USER.scannerCode.value);
//     await Hive.openBox<int>(USER.lastSyncTime.value);
//     if (getAccessToken().isSome()) {
//       ApiConfig.service
//           .setAccessToken(getAccessToken().fold(() => '', (token) => token));
//     }
//     return unit;
//   }
//
//   @override
//   Option<String> getAccessToken() {
//     final box = Hive.box<String>(USER.token.value);
//     final key = box.get(AppConstants.tokenKey);
//     return key != null ? some(key) : none();
//   }
//
//   @override
//   Option<String> getScannerCode() {
//     final box = Hive.box<String>(USER.scannerCode.value);
//     final key = box.get(AppConstants.scannerCodeKey);
//     return key != null ? some(key) : none();
//   }
//
//   @override
//   Option<List<UserModel>> getUserData() {
//     final box = Hive.box<UserModel>(USER.data.value);
//     final data = box.values.toList();
//     return data.isEmpty ? none() : some(data);
//   }
//
//   @override
//   TaskEither<Failure, Unit> setAccessToken(String value) =>
//       TaskEither<Failure, Unit>.tryCatch(
//         () async {
//           final box = Hive.box<String>(USER.token.value);
//           await box.put(AppConstants.tokenKey, value);
//           return unit;
//         },
//         (error, stackTrace) => UserSaveFailure(
//           error: error,
//           stackTrace: stackTrace,
//         ),
//       );
//
//   @override
//   TaskEither<Failure, Unit> setEventWisePermission(
//     PermissionModel permissionModel,
//   ) =>
//       TaskEither<Failure, Unit>.tryCatch(
//         () async {
//           final box = Hive.box<PermissionModel>(USER.permission.value);
//           await box.put(AppConstants.eventWisePermissionKey, permissionModel);
//           return unit;
//         },
//         (error, stackTrace) => UserSaveFailure(
//           error: error,
//           stackTrace: stackTrace,
//         ),
//       );
//
//   @override
//   TaskEither<Failure, Unit> setScannerCode(String value) =>
//       TaskEither<Failure, Unit>.tryCatch(
//         () async {
//           final box = Hive.box<String>(USER.scannerCode.value);
//           await box.put(AppConstants.scannerCodeKey, value);
//           return unit;
//         },
//         (error, stackTrace) => UserSaveFailure(
//           error: error,
//           stackTrace: stackTrace,
//         ),
//       );
//
//   @override
//   TaskEither<Failure, Unit> setUserData(UserModel userModel) =>
//       TaskEither.tryCatch(
//         () async {
//           final box = Hive.box<UserModel>(USER.data.value);
//           await box.add(userModel);
//           await userModel.save();
//           return unit;
//         },
//         (error, stackTrace) => UserSaveFailure(
//           error: error,
//           stackTrace: stackTrace,
//         ),
//       );
//
//   @override
//   Task<Unit> clearData() => Task(
//         () async {
//           // await Hive.box<UserModel>(USER.data.value).clear();
//           // await Hive.box<RoleModel>(USER.role.value).clear();
//           // await Hive.box<String>(USER.token.value).clear();
//           return unit;
//         },
//       );
//
//   @override
//   Task<Unit> deleteUserData() => Task(() async {
//         await Hive.box<UserModel>(USER.data.value).clear();
//         return unit;
//       });
//
//   @override
//   Task<Unit> deletePermission() => Task(() async {
//         await Hive.box<PermissionModel>(USER.permission.value).clear();
//         return unit;
//       });
//
//   @override
//   Task<Unit> deleteSyncData() => Task(() async {
//         await Hive.box<int>(USER.lastSyncTime.value).clear();
//         return unit;
//       });
//
//   @override
//   Task<Unit> deleteEventData() => Task(() async {
//         await Hive.box<EventModel>(USER.event.value).clear();
//         return unit;
//       });
//
//   @override
//   TaskEither<Failure, Unit> setUserEvent(EventModel eventModel) {
//     return TaskEither.tryCatch(
//       () async {
//         final box = Hive.box<EventModel>(USER.event.value);
//         await box.add(eventModel);
//         await eventModel.save();
//         return unit;
//       },
//       (error, stackTrace) => UserSaveFailure(
//         error: error,
//         stackTrace: stackTrace,
//       ),
//     );
//   }
//
//   @override
//   Option<List<EventModel>> getUserEvent() {
//     final box = Hive.box<EventModel>(USER.event.value);
//     final data = box.values.toList();
//     return data.isEmpty ? none() : some(data);
//   }
//
//   @override
//   Option<PermissionModel> getPermissionForEvent() {
//     final box = Hive.box<PermissionModel>(USER.permission.value);
//     final data = box.values.toList();
//     return data.isEmpty ? none() : some(data.first);
//   }
//
//   @override
//   TaskEither<Failure, Unit> setLastSyncTime(int lastSyncTime) =>
//       TaskEither<Failure, Unit>.tryCatch(
//         () async {
//           final box = Hive.box<int>(USER.lastSyncTime.value);
//           await box.put(AppConstants.lastSyncTimeKey, lastSyncTime);
//           return unit;
//         },
//         (error, stackTrace) => UserSaveFailure(
//           error: error,
//           stackTrace: stackTrace,
//         ),
//       );
//
//   @override
//   Option<int> getLastSyncTime() {
//     final box = Hive.box<int>(USER.lastSyncTime.value);
//     final key = box.get(AppConstants.lastSyncTimeKey);
//     return key != null ? some(key) : none();
//   }
// }
