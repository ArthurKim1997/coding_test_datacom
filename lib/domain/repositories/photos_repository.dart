import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PhotosRepository {
  Future<Either<AppError, List<PhotoEntity>>> getPhotos(int albumId);
}
