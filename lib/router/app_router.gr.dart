// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

import '../screens/manga_list_screen/mangas_list_screen.dart' as _i2;
import '../screens/manga_screen/manga_screen.dart' as _i3;
import '../screens/reader/reader.dart' as _i4;
import '../screens/unknown_screen.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MangasListRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i2.MangasListScreen());
    },
    MangaRoute.name: (entry) {
      var route = entry.routeData.as<MangaRoute>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.MangaScreen(key: route.key, mangaId: route.mangaId));
    },
    ReaderRoute.name: (entry) {
      var route = entry.routeData.as<ReaderRoute>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.Reader(
              key: route.key,
              mangaId: route.mangaId,
              chapterId: route.chapterId),
          fullscreenDialog: true);
    },
    UnknownRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i5.UnknownScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<MangasListRoute>(MangasListRoute.name,
            path: '/',
            routeBuilder: (match) => MangasListRoute.fromMatch(match)),
        _i1.RouteConfig<MangaRoute>(MangaRoute.name,
            path: '/manga/:mangaId',
            routeBuilder: (match) => MangaRoute.fromMatch(match)),
        _i1.RouteConfig<ReaderRoute>(ReaderRoute.name,
            path: '/manga/:mangaId/chapter/:chapterId/read',
            routeBuilder: (match) => ReaderRoute.fromMatch(match)),
        _i1.RouteConfig<UnknownRoute>(UnknownRoute.name,
            path: '*', routeBuilder: (match) => UnknownRoute.fromMatch(match))
      ];
}

class MangasListRoute extends _i1.PageRouteInfo {
  const MangasListRoute() : super(name, path: '/');

  MangasListRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'MangasListRoute';
}

class MangaRoute extends _i1.PageRouteInfo {
  MangaRoute({this.key, this.mangaId})
      : super(name, path: '/manga/:mangaId', params: {'mangaId': mangaId});

  MangaRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        mangaId = match.pathParams.getString('mangaId'),
        super.fromMatch(match);

  final _i6.Key key;

  final String mangaId;

  static const String name = 'MangaRoute';
}

class ReaderRoute extends _i1.PageRouteInfo {
  ReaderRoute({this.key, this.mangaId, this.chapterId})
      : super(name,
            path: '/manga/:mangaId/chapter/:chapterId/read',
            params: {'mangaId': mangaId, 'chapterId': chapterId});

  ReaderRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        mangaId = match.pathParams.getString('mangaId'),
        chapterId = match.pathParams.getString('chapterId'),
        super.fromMatch(match);

  final _i6.Key key;

  final String mangaId;

  final String chapterId;

  static const String name = 'ReaderRoute';
}

class UnknownRoute extends _i1.PageRouteInfo {
  const UnknownRoute() : super(name, path: '*');

  UnknownRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'UnknownRoute';
}
