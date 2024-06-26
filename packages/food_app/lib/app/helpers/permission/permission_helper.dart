import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:food_app/app/enum.dart';

class PermissionsHelper {
  /// Request single [permission]
  ///
  /// Returns true if the permission was granted. False otherwise
  Future<PermissionResultData> requestPermission(RuntimePermission permission) async {
    final result = await requestPermissions([permission]);
    return result.values.toList()[0];
  }

  void redirectToSettings() {
    openAppSettings();
  }

  /// Request multiple [permissions]
  ///
  /// Returns the map of [PermissionResultData] of each permission
  Future<Map<RuntimePermission, PermissionResultData>> requestPermissions(List<RuntimePermission> permissions) async {
    final permissionsToAsk = _mapRuntimePermissions(permissions);

    // Request permissions
    final statuses = await permissionsToAsk.request();

    return _mapResult(statuses);
  }

  List<Permission> _mapRuntimePermissions(List<RuntimePermission> runtimePermissions) {
    final permissions = <Permission>[];

    final permissionMapper = RuntimePermissionMapper();
    for (final permission in runtimePermissions) {
      permissions.add(permissionMapper.map(permission));
    }

    return permissions;
  }

  Map<RuntimePermission, PermissionResultData> _mapResult(Map<Permission, PermissionStatus> result) {
    final resultMap = <RuntimePermission, PermissionResultData>{};
    final permissionMapper = RuntimePermissionMapper();
    final permissionResultMapper = PermissionResultMapper();

    result.forEach((key, value) {
      resultMap[permissionMapper.reverseMap(key)] = PermissionResultData(result: permissionResultMapper.map(value));
    });

    return resultMap;
  }
}

class PermissionResultData {
  PermissionResultData({
    required this.result,
  });

  PermissionResult result;
}

class RuntimePermissionMapper extends BaseMapper<RuntimePermission, Permission> {
  Future<int> getData() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt;
  }

  @override
  Permission map(RuntimePermission t) {
    if (t == RuntimePermission.photo) {
      //if (Platform.isIOS) {
      return Permission.photos;
      /*} else if (Platform.isAndroid) {
        return Permission.storage;
      }*/
    } else if (t == RuntimePermission.camera) {
      return Permission.camera;
    } else if (t == RuntimePermission.storage) {
      return Permission.storage;
    }
    throw UnimplementedError('Unknown permission: $t');
  }

  RuntimePermission reverseMap(Permission permission) {
    if (permission == Permission.storage || permission == Permission.photos) {
      return RuntimePermission.photo;
    } else if (permission == Permission.camera) {
      return RuntimePermission.camera;
    }

    throw UnimplementedError('Unknown permission: $permission');
  }
}

class PermissionResultMapper extends BaseMapper<PermissionStatus, PermissionResult> {
  @override
  PermissionResult map(PermissionStatus t) {
    if (t.isGranted) return PermissionResult.granted;
    if (t.isPermanentlyDenied) {
      return PermissionResult.permanentlyDenied;
    }
    if (t.isLimited) return PermissionResult.granted;
    if (t.isDenied && Platform.isIOS) return PermissionResult.permanentlyDenied;
    return PermissionResult.denied;
  }
}

abstract class BaseMapper<T, V> {
  V map(T t);
}
