import 'package:auto_route/auto_route.dart';
import 'package:rhymer/features/favorites/presentation/favorites_screen.dart';
import 'package:rhymer/features/history/presentation/history_screen.dart';
import 'package:rhymer/features/home/presentation/home_screen.dart';
import 'package:rhymer/features/search/presentation/search_screen.dart';
import 'package:rhymer/features/settings/presentation/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', initial: true, children: [
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: HistoryRoute.page, path: 'history'),
          AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
          AutoRoute(page: SettingsRoute.page, path: 'settings'),
        ]),
      ];
}
