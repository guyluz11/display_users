import 'package:auto_route/auto_route.dart';
import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/injection.dart';
import 'package:display_users/presentation/routes/app_router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  static final _rootRouter = AppRouter();

  MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<UserBloc>()..add(const UserEvent.getAllUsers()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _rootRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _rootRouter.defaultRouteParser(),
        title: 'Display Users',
        // builder: ExtendedNavigator(
        //   router: AppRouter(),
        // ),
        // initialRoute:
        // auth.currentU1`ser != null ? '/$homePage' : '/$loginPage',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //      darkTheme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: createMaterialColor(Colors.redAccent),
          primaryColorDark: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white70),
          ),
          fontFamily: 'gidole_regular',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(Colors.blue),
          ).copyWith(
            secondary: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
