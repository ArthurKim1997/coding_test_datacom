import 'dart:io';

import 'package:code_test_datacom_albums/data/data_sources/albums_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/models/albums_model.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/repositories/albums_repository.dart';
import 'package:dartz/dartz.dart';

class AlbumsRepositoryImpl extends AlbumsRepository {
  final AlbumsRemoteDataSource remoteDataSource;

  AlbumsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<AlbumModel>>> getAlbums(int userId) async {
    try {
      final albums = await remoteDataSource.getAlbums(userId);
      return Right(albums);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
