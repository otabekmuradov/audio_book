// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audio_book/features/audio_list/presentation/pages/audio_list_page.dart'
    as _i1;
import 'package:audio_book/features/player/presentation/pages/player_page.dart'
    as _i2;
import 'package:audio_book/features/saved/presentation/pages/saved_page.dart'
    as _i3;
import 'package:audio_book/features/splash/presentation/pages/splash_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i5;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AudioListRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.AudioListPage()),
      );
    },
    PlayerRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PlayerPage(),
      );
    },
    SavedRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SavedPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AudioListPage]
class AudioListRoute extends _i5.PageRouteInfo<void> {
  const AudioListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AudioListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioListRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PlayerPage]
class PlayerRoute extends _i5.PageRouteInfo<void> {
  const PlayerRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PlayerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SavedPage]
class SavedRoute extends _i5.PageRouteInfo<void> {
  const SavedRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SavedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
