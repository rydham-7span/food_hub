import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app/core/presentation/widgets/image_cropper/image_picker_utils.dart';
import 'package:food_client/food_client.dart';

// States
abstract class ImagePickerState {
  const ImagePickerState();
}

class ImagePickerInitial extends ImagePickerState {}

class FilePickerInitial extends ImagePickerState {
  const FilePickerInitial({this.file});

  final File? file;
}

class ImagePickedSuccess extends ImagePickerState {
  const ImagePickedSuccess({required this.image});

  final XFile image;
}

class ImagePickerRemove extends ImagePickerState {}

class ImagePickedError extends ImagePickerState {}

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());

  Future<void> pickImage({required bool isCamera, required BuildContext context}) async {
    try {
      final image = await ImagePickerUtils.pickImage(
        useCamera: isCamera,
        context: context,
      );
      if (image != null) {
        emit(ImagePickedSuccess(image: XFile(image)));
      }
    } catch (error) {
      emit(ImagePickedError());
    }
  }

  Unit updateFilePreview({File? file}) {
    if (file != null) {
      emit(ImagePickedSuccess(image: XFile(file.path)));
    } else {
      emit(ImagePickerInitial());
    }

    return unit;
  }

  void clearImage() {
    emit(ImagePickerRemove());
  }
}
