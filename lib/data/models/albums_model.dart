import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';

class AlbumsModel {
  final List<AlbumModel> albums;

  AlbumsModel({required this.albums});

  factory AlbumsModel.fromJson(List<dynamic> parasedJson) {
    List<AlbumModel> albums;
    albums = parasedJson.map((i) => AlbumModel.fromJson(i)).toList();

    return AlbumsModel(albums: albums);
  }
}

class AlbumModel extends AlbumEntity {
  final int userId;
  final int id;
  final String title;

  AlbumModel({required this.userId, required this.id, required this.title})
      : super(userId: userId, id: id, title: title);

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title']);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
      };
}
