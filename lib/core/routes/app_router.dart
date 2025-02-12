import 'package:auto_route/auto_route.dart';
import 'package:mobile/core/routes/app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: RegisterRoute.page, path: '/register',  initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login',),
        AutoRoute(page: VerifyOTPRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}