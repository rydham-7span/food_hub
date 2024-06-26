class MetaResponseModel {
  const MetaResponseModel({this.currentPage, this.lastPage});

  factory MetaResponseModel.fromMap(Map<String, dynamic> map) {
    return MetaResponseModel(
      currentPage: map['current_page'] as int?,
      lastPage: map['last_page'] as int?,
    );
  }
  final int? currentPage;
  final int? lastPage;
}
