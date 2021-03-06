import 'package:auto_route/auto_route.dart';

import '../screens/manga_list_screen/mangas_list_screen.dart';
import '../screens/manga_screen/manga_screen.dart';
import '../screens/reader/reader.dart';
import '../screens/unknown_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: MangasListScreen, initial: true),
    AutoRoute(path: '/manga/:mangaId', page: MangaScreen),
    AutoRoute(
      path: '/manga/:mangaId/chapter/:chapterId/read',
      page: Reader,
      name: 'ReaderRoute',
      fullscreenDialog: true,
    ),
    AutoRoute(path: '*', page: UnknownScreen)
  ],
)
class $AppRouter {}
