import 'package:auto_route/auto_route.dart';
import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/injection.dart';
import 'package:display_users/presentation/home_page/home_widgets/users_list_widget.dart';
import 'package:display_users/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Home page to show all the tabs
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display 100 Users'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          TextButton(
            child: const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
            onPressed: () {
              context.router.push(const FavoriteUsersRoute());
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(251, 245, 249, 1.0),
      body: BlocProvider(
        create: (context) =>
            getIt<UserBloc>()..add(const UserEvent.getAllUsers()),
        child: UsersListWidget(),
      ),
    );
  }
}
