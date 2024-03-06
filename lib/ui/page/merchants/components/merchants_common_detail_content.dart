import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsCommonDetailContent extends StatelessWidget {
  final String content;

  const MerchantsCommonDetailContent({
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
          color: MerchantsStyle.mainDarkGreyColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
