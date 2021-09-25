import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_search_params.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_photos.dart';
import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final GetPhotos getPhotos;
  final LoadingCubit loadingCubit;

  PhotosCubit({required this.getPhotos, required this.loadingCubit})
      : super(PhotosInitial());

  Future<void> getPhotosFetch(int albumId) async {
    loadingCubit.show();
    emit(PhotosLoading());
    final Either<AppError, List<PhotoEntity>> response =
        await getPhotos(PhotosSearchParams(albumId: albumId));
    emit(response.fold((l) => PhotosLoadedFailed(l.appErrorType),
        (r) => PhotosLoadedSuccess(r)));
    loadingCubit.hide();
  }
}
