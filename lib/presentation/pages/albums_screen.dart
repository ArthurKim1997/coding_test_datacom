import 'package:code_test_datacom_albums/common/route_constans.dart';
import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';
import 'package:code_test_datacom_albums/presentation/blocs/albums/albums_cubit.dart';
import 'package:code_test_datacom_albums/presentation/pages/app_error_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/loading_screen.dart';
import 'package:code_test_datacom_albums/presentation/widget/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatefulWidget {
  final UserEntity userEntity;

  const AlbumsScreen({Key? key, required this.userEntity}) : super(key: key);
  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AlbumsCubit>().getPhotosFetch(widget.userEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsCubit, AlbumsState>(
        builder: (BuildContext context, state) {
      if (state is AlbumsLoadedFailed) {
        return AppErrorScreen(
          errorType: state.errorType,
          onPressed: () {
            context.read<AlbumsCubit>().getPhotosFetch(widget.userEntity.id);
          },
        );
      } else if (state is AlbumsLoadedSuccess) {
        return CustomView(
            appBar: AppBar(
              title: Text(widget.userEntity.username + "'s albums"),
            ),
            body: ListView.builder(
                itemCount: state.albums.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteList.photos,
                          arguments: state.albums[index]);
                    },
                    child: ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(state.albums[index].title),
                    ),
                  );
                }));
      } else if (state is AlbumsLoading) {
        return const LoadingScreen();
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
