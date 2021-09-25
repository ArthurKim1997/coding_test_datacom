import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/no_params.dart';
import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';
import 'package:code_test_datacom_albums/domain/repositories/users_reppository.dart';
import 'package:code_test_datacom_albums/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetUsers extends UseCase<List<UserEntity>, NoParams> {
  final UsersRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<AppError, List<UserEntity>>> call(NoParams params) async {
    return await repository.getUsers();
  }
}
