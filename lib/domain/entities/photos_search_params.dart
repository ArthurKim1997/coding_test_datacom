import 'package:equatable/equatable.dart';

class PhotosSearchParams extends Equatable {
  final int albumId;

  const PhotosSearchParams({required this.albumId});

  @override
  List<Object?> get props => [albumId];
}
