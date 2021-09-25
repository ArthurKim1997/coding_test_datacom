import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_search_params.dart';
import 'package:code_test_datacom_albums/domain/repositories/photos_repository.dart';
import 'package:code_test_datacom_albums/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetPhotos extends UseCase<List<PhotoEntity>, PhotosSearchParams> {
  final PhotosRepository repository;

  GetPhotos(this.repository);

  @override
  Future<Either<AppError, List<PhotoEntity>>> call(
      PhotosSearchParams params) async {
    return await repository.getPhotos(params.albumId);
  }
}
