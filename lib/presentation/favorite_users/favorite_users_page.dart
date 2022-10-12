import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/injection.dart';
import 'package:display_users/presentation/favorite_users/favorite_users_widgets/favorite_users_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home page to show all the tabs
class FavoriteUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: const Color.fromRGBO(251, 245, 249, 1.0),
      body: BlocProvider(
        create: (context) =>
            getIt<UserBloc>()..add(const UserEvent.getFavoriteUsers()),
        child: FavoriteUsersListWidget(),
      ),
    );
  }
}
