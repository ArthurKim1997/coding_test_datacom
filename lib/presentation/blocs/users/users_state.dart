part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInital extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoadedSuccess extends UsersState {
  final List<UserEntity> users;

  const UsersLoadedSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class UsersLoadedFailed extends UsersState {
  final AppErrorType errorType;

  const UsersLoadedFailed(this.errorType);

  @override
  List<Object> get props => [errorType];
}
