import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersCommonDetailContent extends StatelessWidget {
  final String content;

  const UsersCommonDetailContent({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 13,
        top: 10,
        bottom: 10,
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 15,
          color: UsersStyle.mainDarkGreyColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
