import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either<AppError, List<UserEntity>>> getUsers();
}
