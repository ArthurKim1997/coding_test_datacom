import 'package:code_test_datacom_albums/data/core/api_client.dart';
import 'package:code_test_datacom_albums/data/data_sources/albums_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/data_sources/photos_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/data_sources/users_remote_data_source.dart';
import 'package:code_test_datacom_albums/data/repositories/albums_repository_impl.dart';
import 'package:code_test_datacom_albums/data/repositories/photos_repository_impl.dart';
import 'package:code_test_datacom_albums/data/repositories/users_repository_impl.dart';
import 'package:code_test_datacom_albums/domain/repositories/albums_repository.dart';
import 'package:code_test_datacom_albums/domain/repositories/photos_repository.dart';
import 'package:code_test_datacom_albums/domain/repositories/users_reppository.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_albums.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_photos.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_users.dart';
import 'package:code_test_datacom_albums/presentation/blocs/albums/albums_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/photos/photos_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/users/users_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///external
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  ///core
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  ///data source
  getItInstance.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImp(getItInstance()));
  getItInstance.registerLazySingleton<AlbumsRemoteDataSource>(
      () => AlbumsRemoteDataSourceImp(getItInstance()));
  getItInstance.registerLazySingleton<PhotosRemoteDataSource>(
      () => PhotosRemoteDataSourceImp(getItInstance()));

  ///usecases
  getItInstance
      .registerLazySingleton<GetUsers>(() => GetUsers(getItInstance()));
  getItInstance
      .registerLazySingleton<GetAlbums>(() => GetAlbums(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPhotos>(() => GetPhotos(getItInstance()));

  ///repository
  getItInstance.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<AlbumsRepository>(
      () => AlbumsRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<PhotosRepository>(
      () => PhotosRepositoryImpl(getItInstance()));

  ///cubit
  getItInstance.registerFactory(() => LoadingCubit());
  getItInstance.registerFactory(() =>
      UsersCubit(getUsers: getItInstance(), loadingCubit: getItInstance()));
  getItInstance.registerFactory(() =>
      AlbumsCubit(getAlbums: getItInstance(), loadingCubit: getItInstance()));
  getItInstance.registerFactory(() =>
      PhotosCubit(getPhotos: getItInstance(), loadingCubit: getItInstance()));
}
