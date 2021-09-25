import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/domain/entities/no_params.dart';
import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';
import 'package:code_test_datacom_albums/domain/usecases/get_users.dart';
import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsers getUsers;
  final LoadingCubit loadingCubit;

  UsersCubit({required this.getUsers, required this.loadingCubit})
      : super(UsersInital());

  Future<void> getUsersFetch() async {
    loadingCubit.show();
    emit(UsersLoading());
    final Either<AppError, List<UserEntity>> response =
        await getUsers(NoParams());
    emit(response.fold((l) => UsersLoadedFailed(l.appErrorType),
        (r) => UsersLoadedSuccess(r)));
    loadingCubit.hide();
  }
}
