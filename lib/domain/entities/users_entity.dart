import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;

  const UserEntity(
      {required this.id, required this.name, required this.username});
  @override
  List<Object?> get props => [id, name, username];
}
