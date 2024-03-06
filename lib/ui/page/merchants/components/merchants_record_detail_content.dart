import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsRecordDetailContent extends StatelessWidget {
  final String header;
  final String content;

  const MerchantsRecordDetailContent({
    Key key,
    @required this.header,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(
              header,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MerchantsStyle.mainDarkGreyColor,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MerchantsStyle.mainBlackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
