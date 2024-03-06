import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersCommonTag extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double rightMargin;
  final double titleFontSize;
  final Color fontColor;

  UsersCommonTag({
    Key key,
    this.title = '',
    this.backgroundColor = UsersStyle.mainGreenColor,
    this.rightMargin = 7,
    this.titleFontSize = 12,
    this.fontColor = UsersStyle.mainGreenColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(right: rightMargin),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
        child: Text(
          title,
          style: TextStyle(
            color: fontColor,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
