import 'package:code_test_datacom_albums/data/core/api_client.dart';
import 'package:code_test_datacom_albums/data/core/api_constans.dart';
import 'package:code_test_datacom_albums/data/models/albums_model.dart';

abstract class AlbumsRemoteDataSource {
  Future<List<AlbumModel>> getAlbums(int userId);
}

class AlbumsRemoteDataSourceImp extends AlbumsRemoteDataSource {
  final ApiClient _client;

  AlbumsRemoteDataSourceImp(this._client);

  @override
  Future<List<AlbumModel>> getAlbums(int userId) async {
    List<AlbumModel> convertResponse;
    final List response =
        await _client.get(ApiConstants.ALBUMS, params: {'userId': userId});

    convertResponse = AlbumsModel.fromJson(response).albums;
    return convertResponse;
  }
}
