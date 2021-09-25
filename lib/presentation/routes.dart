import 'package:code_test_datacom_albums/common/route_constans.dart';
import 'package:code_test_datacom_albums/domain/entities/albums_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';
import 'package:code_test_datacom_albums/domain/entities/users_entity.dart';
import 'package:code_test_datacom_albums/presentation/pages/albums_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/photos_detail_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/photos_screen.dart';
import 'package:code_test_datacom_albums/presentation/pages/users_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => UsersScreen(),
        RouteList.users: (context) => UsersScreen(),
        RouteList.albums: (context) =>
            AlbumsScreen(userEntity: setting.arguments as UserEntity),
        RouteList.photos: (context) =>
            PhotosScreen(albumEntity: setting.arguments as AlbumEntity),
        RouteList.photosDetail: (context) =>
            PhotoDetailScreen(photoEntity: setting.arguments as PhotoEntity),
      };
}
