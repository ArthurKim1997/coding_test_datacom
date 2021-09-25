import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class AlbumsRepository {
  Future<Either<AppError, List<AlbumEntity>>> getAlbums(int userId);
}
