import 'dart:io';

import 'package:code_test_datacom_albums/data/data_sources/users_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/models/users_model.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/repositories/users_reppository.dart';
import 'package:dartz/dartz.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersRemoteDataSource remoteDataSource;

  UsersRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError, List<UserModel>>> getUsers() async {
    try {
      final users = await remoteDataSource.getUsers();
      return Right(users);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
