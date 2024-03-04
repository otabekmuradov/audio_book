import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'routes.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: Routes.splash,
          initial: true,
        ),
        AutoRoute(
          page: AudioListRoute.page,
          path: Routes.audioList,
        ),
        AutoRoute(
          page: PlayerRoute.page,
          path: Routes.player,
        ),
      ];
}
