import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/albums_search_params.dart';
import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_albums.dart';
import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  final GetAlbums getAlbums;
  final LoadingCubit loadingCubit;

  AlbumsCubit({required this.getAlbums, required this.loadingCubit})
      : super(AlbumsInital());

  Future<void> getPhotosFetch(int userId) async {
    loadingCubit.show();
    emit(AlbumsLoading());
    final Either<AppError, List<AlbumEntity>> response =
        await getAlbums(AlbumsSearchParams(userId: userId));
    emit(response.fold((l) => AlbumsLoadedFailed(l.appErrorType),
        (r) => AlbumsLoadedSuccess(r)));
    loadingCubit.hide();
  }
}
