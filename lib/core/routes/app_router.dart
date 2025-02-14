import 'package:auto_route/auto_route.dart';
import 'package:pharmarx/core/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', children: [
          AutoRoute(page: HomePage.page, path: 'home'),
          AutoRoute(page: SearchPage.page, path: 'search'),
          AutoRoute(page: CartPage.page, path: 'cart'),
          AutoRoute(page: ProfilePage.page, path: 'profile'),
        ]),
        AutoRoute(page: RegisterRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: VerifyOTPRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
