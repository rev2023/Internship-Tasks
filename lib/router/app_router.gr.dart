// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:counter_app/screens/about_screen.dart' as _i1;
import 'package:counter_app/screens/appearance_screen.dart' as _i2;
import 'package:counter_app/screens/fact_screen.dart' as _i3;
import 'package:counter_app/screens/home_screen.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    AppearanceRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppearanceScreen(),
      );
    },
    FactRoute.name: (routeData) {
      final args = routeData.argsAs<FactRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FactScreen(
          key: args.key,
          count: args.count,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i5.PageRouteInfo<void> {
  const AboutRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppearanceScreen]
class AppearanceRoute extends _i5.PageRouteInfo<void> {
  const AppearanceRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AppearanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppearanceRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FactScreen]
class FactRoute extends _i5.PageRouteInfo<FactRouteArgs> {
  FactRoute({
    _i6.Key? key,
    required int count,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          FactRoute.name,
          args: FactRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'FactRoute';

  static const _i5.PageInfo<FactRouteArgs> page =
      _i5.PageInfo<FactRouteArgs>(name);
}

class FactRouteArgs {
  const FactRouteArgs({
    this.key,
    required this.count,
  });

  final _i6.Key? key;

  final int count;

  @override
  String toString() {
    return 'FactRouteArgs{key: $key, count: $count}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
