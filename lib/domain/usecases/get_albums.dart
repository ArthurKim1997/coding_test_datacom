import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/albums_search_params.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/repositories/albums_repository.dart';
import 'package:code_test_datacom_albums/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetAlbums extends UseCase<List<AlbumEntity>, AlbumsSearchParams> {
  final AlbumsRepository repository;

  GetAlbums(this.repository);

  @override
  Future<Either<AppError, List<AlbumEntity>>> call(
      AlbumsSearchParams params) async {
    return await repository.getAlbums(params.userId);
  }
}
