import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:kt_dart/kt.dart';

class FavoriteUsersTable extends StatelessWidget {
  FavoriteUsersTable(this.usersList);

  final KtList<UserEntity> usersList;

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 100,
      rightHandSideColumnWidth: 930,
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
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Id', 50),
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
      height: 52,
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
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          TextButton(
            child: Container(
              height: 52,
              alignment: Alignment.center,
              child: const FaIcon(
                FontAwesomeIcons.squareMinus,
                size: 30,
                color: Colors.red,
              ),
            ),
            onPressed: () {
              context
                  .read<UserBloc>()
                  .add(UserEvent.deleteFavoriteUser(userEntity));
            },
          ),
          Container(
            height: 52,
            alignment: Alignment.center,
            child: Text(
              userEntity.id!.getOrCrash()!,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
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
          height: 52,
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
