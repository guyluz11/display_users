import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Home page to show all the tabs
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromRGBO(251, 245, 249, 1.0),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              // toolbarHeight: 0,
              // backgroundColor: Colors.white,
              title: const Text('app_name'),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            backgroundColor: Colors.brown.withOpacity(0.6),
            body: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'App_name',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: FaIcon(FontAwesomeIcons.signInAlt),
                          labelText: 'User Name',
                        ),
                        autocorrect: false,
                        onChanged: (value) {
                          // context
                          //     .read<UserNameSignInFormBloc>()
                          //     .add(UserNameSignInFormEvent.userNameChanged(value)),
                          // validator: (_) => context
                          //     .read<UserNameSignInFormBloc>()
                          //     .state
                          //     .UserNameUserName
                          //     .value
                          //     .fold(
                          // (CoreLoginFailure f) => 'Validation error',
                          // //   f.maybeMap(
                          // // invalidEmail: (result) => result.failedValue,
                          // // containsSpace: (result) => result.failedValue,
                          // // orElse: () => null,
                          // // ),
                          // (r) => null,
                          // ),
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: FaIcon(FontAwesomeIcons.signInAlt),
                          labelText: 'Password',
                        ),
                        autocorrect: false,
                        onChanged: (value) {
                          // context
                          //     .read<UserNameSignInFormBloc>()
                          //     .add(UserNameSignInFormEvent.userNameChanged(value)),
                          // validator: (_) => context
                          //     .read<UserNameSignInFormBloc>()
                          //     .state
                          //     .UserNameUserName
                          //     .value
                          //     .fold(
                          // (CoreLoginFailure f) => 'Validation error',
                          // //   f.maybeMap(
                          // // invalidEmail: (result) => result.failedValue,
                          // // containsSpace: (result) => result.failedValue,
                          // // orElse: () => null,
                          // // ),
                          // (r) => null,
                          // ),
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
