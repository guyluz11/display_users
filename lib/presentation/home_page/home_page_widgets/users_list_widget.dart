import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

class UsersListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.map(
          loadInProgress: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Fetching all users',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
          gotUsers: (gotUsersSate) {
            final KtList<UserEntity> usersList = gotUsersSate.userList;

            return HorizontalDataTable(
              leftHandSideColumnWidth: 70,
              rightHandSideColumnWidth: 1000,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: (BuildContext context, int index) {
                return _generateFirstColumnRow(
                  context,
                  index,
                  usersList[index],
                );
              },
              rightSideItemBuilder: (BuildContext context, int index) {
                return _generateRightHandSideColumnRow(
                  context,
                  index,
                  usersList[index],
                );
              },
              itemCount: usersList.size,
              rowSeparatorWidget: const Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
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

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Id', 70),
      _getTitleItemWidget('Avatar', 80),
      _getTitleItemWidget('User Name', 200),
      _getTitleItemWidget('Title', 200),
      _getTitleItemWidget('Key Skill', 200),
      _getTitleItemWidget('Date Of Birth', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _generateFirstColumnRow(
    BuildContext context,
    int index,
    UserEntity userEntity,
  ) {
    return Container(
      width: 100,
      height: 52,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
      child: Text(
        userEntity.id!.getOrCrash()!,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(
    BuildContext context,
    int index,
    UserEntity userEntity,
  ) {
    return Row(
      children: <Widget>[
        Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          child: Image.network(userEntity.avatar!.getOrCrash()!),
        ),
        Container(
          width: 200,
          height: 52,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            userEntity.username!.getOrCrash()!,
            style: const TextStyle(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
        Container(
          width: 200,
          height: 52,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            userEntity.employmentTitle!.getOrCrash()!,
            style: const TextStyle(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
        Container(
          width: 200,
          height: 52,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            userEntity.employmentKeySkill!.getOrCrash()!,
            style: const TextStyle(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
        Container(
          width: 200,
          height: 52,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            userEntity.dateOfBirth!.getOrCrash()!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
