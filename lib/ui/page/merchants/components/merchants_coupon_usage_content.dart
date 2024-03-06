import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsCouponUsageContent extends StatelessWidget {
  final String content;

  const MerchantsCouponUsageContent({Key key, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 12, top: 2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: MerchantsStyle.mainGreenColor),
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                color: MerchantsStyle.mainDarkGreyColor,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
