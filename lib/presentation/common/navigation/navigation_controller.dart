import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/presentation/common/navigation/main_screen_navigation.dart';
import 'package:moviealike/presentation/screens/about/about_entry.dart';
import 'package:moviealike/presentation/screens/home/home_entry.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_entry.dart';
import 'package:moviealike/presentation/screens/search/search_entry.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_entry.dart';

class NavigationController {
  static final NavigationController _instance =
      NavigationController._internal();

  static NavigationController get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> watchListTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> aboutTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory NavigationController() {
    return _instance;
  }

  NavigationController._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: HomeEntry.path,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomeEntry(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchTabNavigatorKey,
            routes: [
              GoRoute(
                path: SearchEntry.path,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const SearchEntry(
                      searchType: SearchType.movie,
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: watchListTabNavigatorKey,
            routes: [
              GoRoute(
                path: WatchListEntry.path,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const WatchListEntry(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: aboutTabNavigatorKey,
            routes: [
              GoRoute(
                path: AboutEntry.path,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const AboutEntry(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: MainScreenNavigation(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '/movie_details/:movieId',
        pageBuilder: (context, state) {
          return getPage(
            child: MovieDetailsEntry(
              movieId: int.parse(state.pathParameters['movieId'] ?? "0"),
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '/search/:query/:filter',
        pageBuilder: (context, state) {
          final query = state.pathParameters['query'];
          final filter = state.pathParameters['filter'];
          return getPage(
            child: SearchEntry(
              searchType: SearchType.movie,
              initialQuery: query,
              filter: SearchFilter.getFilterFromName(filter ?? ""),
            ),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: HomeEntry.path,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
