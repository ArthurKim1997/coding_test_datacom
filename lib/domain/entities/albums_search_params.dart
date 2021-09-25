import 'package:equatable/equatable.dart';

class AlbumsSearchParams extends Equatable {
  final int userId;

  const AlbumsSearchParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
