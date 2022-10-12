import 'package:auto_route/auto_route.dart';
import 'package:display_users/presentation/favorite_users/favorite_users_page.dart';
import 'package:display_users/presentation/home_page/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: FavoriteUsersPage, initial: true),
  ],
)
class $AppRouter {
  late HomePage homePage;
  late FavoriteUsersPage favoriteUsersPage;
}
