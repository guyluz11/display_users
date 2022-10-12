import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:display_users/injection.dart';
import 'package:display_users/presentation/core/app_widget.dart';

Future<void> main() async {
  configureDependencies(Env.prod);
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  //  debugPaintSizeEnabled = true;

  runApp(
    /// Use https://lingohub.com/developers/supported-locales/language-designators-with-regions
    /// Or https://www.contentstack.com/docs/developers/multilingual-content/list-of-supported-languages/
    /// To find your language letters, and add the file letters below
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('he', 'IL'),
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: const Locale('en', 'US'),
      child: AppWidget(),
    ),
  );
  // const MyApp());
}
