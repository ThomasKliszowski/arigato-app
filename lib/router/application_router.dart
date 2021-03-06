import 'package:flutter/material.dart';

import '../screens/manga_list_screen/mangas_list_screen.dart';
import '../screens/manga_screen/manga_screen.dart';
import '../screens/unknown_screen.dart';

class ApplicationRouterDelegate extends RouterDelegate<ApplicationRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ApplicationRoutePath> {
  ApplicationRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  String _selectedMangaId;
  bool show404 = false;

  @override
  ApplicationRoutePath get currentConfiguration {
    if (show404) {
      return ApplicationRoutePath.unknown();
    }
    return _selectedMangaId == null
        ? ApplicationRoutePath.home()
        : ApplicationRoutePath.manga(_selectedMangaId);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('MangasListScreen'),
          child: MangasListScreen(),
        ),
        if (show404)
          const MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
        else if (_selectedMangaId != null)
          MaterialPage(
            key: ValueKey('MangaScreenPage_$_selectedMangaId'),
            child: MangaScreen(mangaId: _selectedMangaId),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedMangaId = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<void> setNewRoutePath(ApplicationRoutePath path) async {
    if (path.isUnknown) {
      _selectedMangaId = null;
      show404 = true;
      return;
    }

    if (path.isMangaPage) {
      show404 = true;
      return;
    } else {
      _selectedMangaId = null;
    }

    show404 = false;
  }

  void pushMangaDetails(String mangaId) {
    _selectedMangaId = mangaId;
    notifyListeners();
  }
}

class ApplicationRoutePath {
  ApplicationRoutePath.home()
      : mangaId = null,
        isUnknown = false;

  ApplicationRoutePath.manga(this.mangaId) : isUnknown = false;

  ApplicationRoutePath.unknown()
      : mangaId = null,
        isUnknown = true;

  final String mangaId;
  final bool isUnknown;

  bool get isHomePage => mangaId == null;

  bool get isMangaPage => mangaId != null;
}

class ApplicationRouteInformationParser
    extends RouteInformationParser<ApplicationRoutePath> {
  @override
  Future<ApplicationRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return ApplicationRoutePath.home();
    }

    // Handle '/manga/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'manga') {
        return ApplicationRoutePath.unknown();
      }
      final remaining = uri.pathSegments[1];
      final id = remaining;
      if (id == null) {
        return ApplicationRoutePath.unknown();
      }
      return ApplicationRoutePath.manga(id);
    }

    // Handle unknown routes
    return ApplicationRoutePath.unknown();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  RouteInformation restoreRouteInformation(ApplicationRoutePath path) {
    if (path.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (path.isMangaPage) {
      return RouteInformation(location: '/manga/${path.mangaId}');
    }
    return null;
  }
}
