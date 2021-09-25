import 'package:code_test_datacom_albums/data/core/api_client.dart';
import 'package:code_test_datacom_albums/data/core/api_constans.dart';
import 'package:code_test_datacom_albums/data/models/photos_model.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhotoModel>> getPhotos(int albumId);
}

class PhotosRemoteDataSourceImp extends PhotosRemoteDataSource {
  final ApiClient _client;

  PhotosRemoteDataSourceImp(this._client);

  @override
  Future<List<PhotoModel>> getPhotos(int albumId) async {
    List<PhotoModel> convertResponse;
    final List response =
        await _client.get(ApiConstants.PHOTOS, params: {'albumId': albumId});

    convertResponse = PhotosModel.fromJson(response).photos;
    return convertResponse;
  }
}
