import 'package:auto_route/auto_route.dart';
import 'package:display_users/presentation/home_page/home_page.dart';
import 'package:display_users/presentation/introduction_screen/introduction_screen_page.dart';
import 'package:display_users/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: IntroductionScreenPage),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {
  late SplashPage splashPage;
  late IntroductionScreenPage introductionScreenPage;
  late HomePage homePage;
}
