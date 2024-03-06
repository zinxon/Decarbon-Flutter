import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsCommonTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const MerchantsCommonTitle({
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
          color: MerchantsStyle.mainGreenColor,
        ),
        Text(
          title,
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
