import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';

class UsersModel {
  late final List<UserModel> users;

  UsersModel({required this.users});

  factory UsersModel.fromJson(List<dynamic> parasedJson) {
    List<UserModel> users;
    users = parasedJson.map((i) => UserModel.fromJson(i)).toList();

    return UsersModel(users: users);
  }
}

class UserModel extends UserEntity {
  final int id;
  final String name;
  final String username;

  UserModel({required this.id, required this.name, required this.username})
      : super(id: id, name: name, username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] as int, name: json['name'], username: json['username']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
      };
}
