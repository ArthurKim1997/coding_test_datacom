import 'package:code_test_datacom_albums/common/route_constans.dart';
import 'package:code_test_datacom_albums/presentation/blocs/users/users_cubit.dart';
import 'package:code_test_datacom_albums/presentation/pages/app_error_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/loading_screen.dart';
import 'package:code_test_datacom_albums/presentation/widget/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsersFetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
        builder: (BuildContext context, state) {
      if (state is UsersLoadedFailed) {
        return AppErrorScreen(
          errorType: state.errorType,
          onPressed: () {
            context.read<UsersCubit>().getUsersFetch();
          },
        );
      } else if (state is UsersLoadedSuccess) {
        return CustomView(
            appBar: AppBar(
              title: const Text("users"),
            ),
            body: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteList.albums,
                          arguments: state.users[index]);
                    },
                    child: ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(state.users[index].username),
                    ),
                  );
                }));
      } else if (state is UsersLoading) {
        return const LoadingScreen();
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
