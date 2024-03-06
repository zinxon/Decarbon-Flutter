import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsIconInfoRow extends StatelessWidget {
  final String title;
  final Widget leadingIcon;

  const MerchantsIconInfoRow({
    Key key,
    @required this.title,
    @required this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            margin: EdgeInsets.only(right: 10),
            child: leadingIcon,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: MerchantsStyle.mainDarkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
