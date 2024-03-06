import 'package:DeCarbon/ui/page/merchants/components/merchants_record_detail_content.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsRecordDetailPage extends StatelessWidget {
  static const String PATH = '/merchants/record_detail';
  @override
  Widget build(BuildContext context) {
    final data = Map<String, dynamic>.from(
        ModalRoute.of(context).settings.arguments)['data'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: MerchantsStyle.mainGreenColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'My Recent Record',
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                '${data['user_first_name']} ${data['user_last_name']}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: MerchantsStyle.mainBlackColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                '${data['coins'] > 0 ? '+':''}${data['coins']} DC',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: MerchantsStyle.mainBlackColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 10, right: 10),
              child: Divider(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 54, vertical: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MerchantsRecordDetailContent(
                    header: 'Name',
                    content: data['name'] ?? '',
                  ),
                  MerchantsRecordDetailContent(
                    header: 'Customer',
                    content:
                        '${data['user_first_name']} ${data['user_last_name']}' ??
                            '',
                  ),
                  MerchantsRecordDetailContent(
                    header: 'Time',
                    content: data['date'] ?? '',
                  ),
                  MerchantsRecordDetailContent(
                    header: 'Type',
                    content: data['parsed_type'] ?? '',
                  ),
                  MerchantsRecordDetailContent(
                    header: 'Status',
                    content: data['parsed_status'] ?? '',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
