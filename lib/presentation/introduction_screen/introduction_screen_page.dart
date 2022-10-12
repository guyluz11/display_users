import 'package:flutter/material.dart';
import 'package:display_users/presentation/introduction_screen/introduction_screen_body.dart';

class IntroductionScreenPage extends StatelessWidget {
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreenBody(),
    );
  }
}
