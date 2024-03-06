import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

import 'components/UsersRecordDetailContent.dart';

class UsersRecordDetailPage extends StatelessWidget {
  static const String PATH = '/users/record_detail';
  @override
  Widget build(BuildContext context) {
    final data = Map<String, dynamic>.from(ModalRoute.of(context).settings.arguments)['data'];
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: UsersStyle.mainGreenColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'My Recent Record',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 70,
              height: 70,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  data['merchant_photo_url'],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                '${data['merchant_name']}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: UsersStyle.mainBlackColor,
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
                  color: UsersStyle.mainBlackColor,
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
                  UsersRecordDetailContent(
                    header: 'Name',
                    content: data['name'] ?? '',
                  ),
                  UsersRecordDetailContent(
                    header: 'Merchant',
                    content: data['merchant_name'] ?? '',
                  ),
                  UsersRecordDetailContent(
                    header: 'Time',
                    content: data['date'] ?? '',
                  ),
                  UsersRecordDetailContent(
                    header: 'Type',
                    content: data['parsed_type'] ?? '',
                  ),
                  UsersRecordDetailContent(
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
