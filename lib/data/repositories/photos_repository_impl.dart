import 'dart:io';

import 'package:code_test_datacom_albums/data/data_sources/photos_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/models/photos_model.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/repositories/photos_repository.dart';
import 'package:dartz/dartz.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  final PhotosRemoteDataSource remoteDataSource;

  PhotosRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<PhotoModel>>> getPhotos(int albumId) async {
    try {
      final photos = await remoteDataSource.getPhotos(albumId);
      return Right(photos);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
