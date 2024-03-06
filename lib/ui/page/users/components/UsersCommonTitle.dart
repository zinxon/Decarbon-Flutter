import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersCommonTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const UsersCommonTitle({
    Key key,
    @required this.title,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 3,
          height: 30,
          color: UsersStyle.mainGreenColor,
        ),
        Text(
          title,
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
