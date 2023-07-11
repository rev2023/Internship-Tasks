// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:counter_app/screens/about_screen.dart' as _i1;
import 'package:counter_app/screens/appearance_screen.dart' as _i2;
import 'package:counter_app/screens/fact_screen.dart' as _i3;
import 'package:counter_app/screens/home_screen.dart' as _i4;
import 'package:counter_app/screens/preferences_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    AppearanceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppearanceScreen(),
      );
    },
    FactRoute.name: (routeData) {
      final args = routeData.argsAs<FactRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FactScreen(
          key: args.key,
          count: args.count,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    PreferencesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PreferencesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i6.PageRouteInfo<void> {
  const AboutRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppearanceScreen]
class AppearanceRoute extends _i6.PageRouteInfo<void> {
  const AppearanceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AppearanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppearanceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FactScreen]
class FactRoute extends _i6.PageRouteInfo<FactRouteArgs> {
  FactRoute({
    _i7.Key? key,
    required int count,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          FactRoute.name,
          args: FactRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'FactRoute';

  static const _i6.PageInfo<FactRouteArgs> page =
      _i6.PageInfo<FactRouteArgs>(name);
}

class FactRouteArgs {
  const FactRouteArgs({
    this.key,
    required this.count,
  });

  final _i7.Key? key;

  final int count;

  @override
  String toString() {
    return 'FactRouteArgs{key: $key, count: $count}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PreferencesScreen]
class PreferencesRoute extends _i6.PageRouteInfo<void> {
  const PreferencesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreferencesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
