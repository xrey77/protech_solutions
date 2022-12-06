// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:protech_solutions/aboutus.dart';
import 'package:protech_solutions/home.dart';
import 'package:protech_solutions/login.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: AboutusPage),
  ],
)
class $AppRouter {}
