part of 'albums_cubit.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object> get props => [];
}

class AlbumsInital extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoadedSuccess extends AlbumsState {
  final List<AlbumEntity> albums;

  const AlbumsLoadedSuccess(this.albums);

  @override
  List<Object> get props => [albums];
}

class AlbumsLoadedFailed extends AlbumsState {
  final AppErrorType errorType;

  const AlbumsLoadedFailed(this.errorType);

  @override
  List<Object> get props => [errorType];
}
