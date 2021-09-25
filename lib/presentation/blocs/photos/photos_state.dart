part of 'photos_cubit.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosLoadedSuccess extends PhotosState {
  final List<PhotoEntity> photos;

  const PhotosLoadedSuccess(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotosLoadedFailed extends PhotosState {
  final AppErrorType errorType;

  const PhotosLoadedFailed(this.errorType);

  @override
  List<Object> get props => [errorType];
}
