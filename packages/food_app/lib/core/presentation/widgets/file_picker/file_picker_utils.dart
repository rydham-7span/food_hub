import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/app/helpers/permission/permission_helper.dart';
import 'package:food_app/app/helpers/permission/permission_manager.dart';

class FilePickerUtils {
  FilePickerUtils._();

  static final _permissionManager = PermissionManager();
  static late BuildContext? _buildContext;

  static Future<String?> chooseFile(BuildContext context, String fileType) async {
    _buildContext = context;
    final permission = await _requestPermission();

    if (permission.result == PermissionResult.granted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: fileType == 'pdf' ? ['pdf'] : ['png', 'jpg', 'jpeg', 'heic'],
      );
      if (result != null) {
        if (result.files.first.extension?.contains('pdf') ?? false) {
          return result.files.first.path;
        } else {
          return ImageCropper().cropImage(
            sourcePath: result.files.first.path ?? '',
            compressFormat: ImageCompressFormat.png,
            aspectRatio: const CropAspectRatio(
              ratioX: 1,
              ratioY: 1,
            ),
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.white,
                toolbarWidgetColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Cropper',
              ),
            ],
          ).then((value) {
            if (value != null) {
              return value.path;
            }
            return null;
          });
        }
      }
    }
    return null;
  }

  static Future<PermissionResultData> _requestPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        return _permissionManager.requestPermission(RuntimePermission.storage, _buildContext!);
      } else {
        return _permissionManager.requestPermission(RuntimePermission.photo, _buildContext!);
      }
    } else {
      return _permissionManager.requestPermission(RuntimePermission.storage, _buildContext!);
    }
  }
}
