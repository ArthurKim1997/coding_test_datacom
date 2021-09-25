import 'package:code_test_datacom_albums/data/core/api_client.dart';
import 'package:code_test_datacom_albums/data/core/api_constans.dart';
import 'package:code_test_datacom_albums/data/models/users_model.dart';

abstract class UsersRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UsersRemoteDataSourceImp extends UsersRemoteDataSource {
  final ApiClient _client;

  UsersRemoteDataSourceImp(this._client);

  @override
  Future<List<UserModel>> getUsers() async {
    List<UserModel> convertResponse;
    final List response = await _client.get(ApiConstants.USER);

    convertResponse = UsersModel.fromJson(response).users;
    return convertResponse;
  }
}
