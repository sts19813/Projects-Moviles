import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/pages/catalog_page.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/pages/component_detail_page.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flutter_ui_catalog/features/home/presentation/pages/home_page.dart';
import 'package:flutter_ui_catalog/features/navigation/presentation/widgets/responsive_scaffold.dart';
import 'package:flutter_ui_catalog/features/search/presentation/pages/search_page.dart';
import 'package:flutter_ui_catalog/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_ui_catalog/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const splash = '/splash';
  static const home = '/';
  static const search = '/search';
  static const catalog = '/catalog';
  static const favorites = '/favorites';
  static const settings = '/settings';

  static String category(String categoryId) => '/catalog/$categoryId';

  static String component(String categoryId, String componentId) {
    return '/catalog/$categoryId/$componentId';
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ResponsiveScaffold(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.catalog,
                builder: (context, state) => const CatalogPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: ':categoryId',
                    builder: (context, state) => CatalogPage(
                      categoryId: state.pathParameters['categoryId'],
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: ':componentId',
                        builder: (context, state) => ComponentDetailPage(
                          componentId:
                              state.pathParameters['componentId'] ?? '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.favorites,
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
