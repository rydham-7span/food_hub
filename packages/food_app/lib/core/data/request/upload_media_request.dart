import 'package:food_client/food_client.dart';

class UploadMediaRequest {
  UploadMediaRequest({
    this.file,
    this.mediaFor,
  });

  MultipartFile? file;
  String? mediaFor;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['media'] = file;
    data['media_for'] = mediaFor;
    return data;
  }
}
