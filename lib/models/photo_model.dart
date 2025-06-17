class PhotoModel {
  PhotoModel({required this.link});
  final String link;

  factory PhotoModel.fromJson(Map<String, dynamic> data) {
    return PhotoModel(
      link: data['urls']['full'],
    );
  }
}
