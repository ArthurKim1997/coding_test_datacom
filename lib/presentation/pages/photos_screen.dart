import 'package:code_test_datacom_albums/common/route_constans.dart';
import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';
import 'package:code_test_datacom_albums/presentation/blocs/photos/photos_cubit.dart';
import 'package:code_test_datacom_albums/presentation/pages/app_error_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/loading_screen.dart';
import 'package:code_test_datacom_albums/presentation/widget/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatefulWidget {
  final AlbumEntity albumEntity;

  const PhotosScreen({Key? key, required this.albumEntity}) : super(key: key);
  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PhotosCubit>().getPhotosFetch(widget.albumEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
        builder: (BuildContext context, state) {
      if (state is PhotosLoadedFailed) {
        return AppErrorScreen(
          errorType: state.errorType,
          onPressed: () {
            context.read<PhotosCubit>().getPhotosFetch(widget.albumEntity.id);
          },
        );
      } else if (state is PhotosLoadedSuccess) {
        return CustomView(
            appBar: AppBar(
              title: Text(widget.albumEntity.title),
            ),
            body: GridView.builder(
              itemCount: state.photos.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteList.photosDetail,
                        arguments: state.photos[index]);
                  },
                  child: Image.network(state.photos[index].thumbnailUrl),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
            ));
      } else if (state is PhotosLoading) {
        return const LoadingScreen();
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
