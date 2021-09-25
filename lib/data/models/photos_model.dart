import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';

class PhotosModel {
  late final List<PhotoModel> photos;

  PhotosModel({required this.photos});

  factory PhotosModel.fromJson(List<dynamic> parasedJson) {
    List<PhotoModel> photos;
    photos = parasedJson.map((i) => PhotoModel.fromJson(i)).toList();

    return PhotosModel(photos: photos);
  }
}

class PhotoModel extends PhotoEntity {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl})
      : super(
            albumId: albumId,
            id: id,
            title: title,
            url: url,
            thumbnailUrl: thumbnailUrl);

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json["albumId"] as int,
      id: json["id"] as int,
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
