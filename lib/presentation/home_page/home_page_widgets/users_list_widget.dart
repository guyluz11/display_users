import 'package:display_users/application/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const Text(
            'Go',
            style: TextStyle(color: Colors.black),
          ),
          loadInProgress: (_) => const SizedBox(
            height: 70,
            width: 70,
            child: CircularProgressIndicator(),
          ),
          gotUsers: (gotUsersSate) {
            return const Text(
              'Users',
              style: TextStyle(color: Colors.black),
            );
          },
          loadFailure: (LoadFailure value) => const Text(
            'Got Failure',
            style: TextStyle(color: Colors.black),
          ),
          error: (_) => const Text(
            'Got Error',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}
