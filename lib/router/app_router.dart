import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/screens/home_screen.dart', page: HomeRoute.page, initial: true),
    AutoRoute(path: '/screens/appearance_screen.dart', page: AppearanceRoute.page),
    AutoRoute(path: '/screens/about_screen.dart', page: AboutRoute.page),
    AutoRoute(path: '/screens/fact_screen.dart', page: FactRoute.page),



  ];
}