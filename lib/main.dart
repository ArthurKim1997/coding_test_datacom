import 'package:code_test_datacom_albums/common/route_constans.dart';
import 'package:code_test_datacom_albums/di/injection_container.dart' as get_it;
import 'package:code_test_datacom_albums/presentation/blocs/albums/albums_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/photos/photos_cubit.dart';
import 'package:code_test_datacom_albums/presentation/blocs/users/users_cubit.dart';
import 'package:code_test_datacom_albums/presentation/fade_page_route_builder.dart';
import 'package:code_test_datacom_albums/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>(create: (_) => get_it.getItInstance()),
        BlocProvider<UsersCubit>(create: (_) => get_it.getItInstance()),
        BlocProvider<AlbumsCubit>(create: (_) => get_it.getItInstance()),
        BlocProvider<PhotosCubit>(create: (_) => get_it.getItInstance()),
      ],
      child: MaterialApp(
        title: 'Album App',
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteList.initial,
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
