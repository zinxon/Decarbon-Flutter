// stores ExpansionPanel state information
import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/UsersRecordRepository.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/UsersRecordDetailPage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  dynamic expandedValue;
  dynamic headerValue;
  bool isExpanded;
}

class UsersRecentRecordPage extends StatelessWidget {
  static const String PATH = '/users/recent_records';

  final dummy = {
    "success": true,
    "result": [
      {
        "record_id": 15,
        "date": "2020/07/12 10:27",
        "coins": -30,
        "type": "coupon",
        "status": 1,
        "merchant_name": "Richard Restaurant1",
        "merchant_photo_url": "https://miro.medium.com/fit/c/336/336/0*Aha4ji-MvM9Y-kmj",
        "parsed_type": "Merchandise coupon",
        "name": "Test Coupon",
        "parsed_status": "Not used"
      },
      {
        "record_id": 14,
        "date": "2020/07/05 00:59",
        "coins": 30,
        "type": "activity",
        "status": 1,
        "merchant_name": "Richard Restaurant1",
        "merchant_photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "parsed_type": "Consump",
        "name": "Test Activity5",
        "parsed_status": "Done"
      },
      {
        "record_id": 12,
        "date": "2020/07/05 00:57",
        "coins": 1,
        "type": "activity",
        "status": 1,
        "merchant_name": "Richard Restaurant1",
        "merchant_photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "parsed_type": "Consump",
        "name": "Test Activity",
        "parsed_status": "Done"
      },
      {
        "record_id": 11,
        "date": "2020/07/05 00:37",
        "coins": 1,
        "type": "activity",
        "status": 1,
        "merchant_name": "Richard Restaurant1",
        "merchant_photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "parsed_type": "Consump",
        "name": "Test Activity",
        "parsed_status": "Done"
      },
      {
        "record_id": 9,
        "date": "2020/07/03 23:26",
        "coins": -30,
        "type": "coupon",
        "status": 0,
        "merchant_name": "Richard Restaurant1",
        "merchant_photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "parsed_type": "Merchandise coupon",
        "name": "Test Coupon",
        "parsed_status": "Used"
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final User userProfile = UsersInstance.instance.user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
      body: FutureBuilder(
        future: UsersRecordRepository.getUserRecordList(userId: userProfile.userId, loginId:userProfile.loginId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if (snapshot.data.data['success']) {
                var newRecordList = [];
                var newRecordMap;
                newRecordMap = groupBy(
                  // dummy['result'],
                  snapshot.data.data['result'],
                  (obj) => DateFormat('yyyy/MM').format(DateFormat("yyyy/MM/dd HH:mm").parse(obj['date'])),
                );
                newRecordMap.forEach(
                  (key, value) => newRecordList.add(
                    Item(
                      headerValue: key,
                      expandedValue: value,
                      isExpanded: false,
                    ),
                  ),
                );
                return StatefulBuilder(builder: (context, setState) {
                  return ListView(
                    children: newRecordList.map<Widget>((dynamic item) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          item.isExpanded = !item.isExpanded;
                        }),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: item.isExpanded ? null : 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  item.headerValue,
                                  style: TextStyle(
                                    color: UsersStyle.mainBlackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: item.isExpanded
                                    ? Icon(Icons.expand_less)
                                    : Icon(Icons.expand_more),
                              ),
                              item.isExpanded
                                  ? Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        children: item.expandedValue.map<Widget>((dynamic record) {
                                          return GestureDetector(
                                            onTap: () {
                                              print(record);
                                              Navigator.pushNamed(context, UsersRecordDetailPage.PATH, arguments: {'data': record});
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(vertical: 11),
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 2,
                                                    // margin: EdgeInsets.only(right: 23),
                                                    child: CircleAvatar(
                                                      backgroundColor: record['coins'] > 0
                                                          ? UsersStyle.mainGreenColor
                                                          : UsersStyle.mainRedColor,
                                                      maxRadius: 7,
                                                      child: record['coins'] > 0
                                                          ? Icon(Icons.add, size: 10)
                                                          : Icon(Icons.remove, size: 10),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    // margin: EdgeInsets.only(right: 31),
                                                    child: Text(
                                                      record['coins'].abs().toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: record['coins'] > 0
                                                            ? UsersStyle.mainGreenColor
                                                            : UsersStyle.mainRedColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          record['name'] ?? '',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Container(
                                                              margin: EdgeInsets.only(right: 3),
                                                              child: Text(
                                                                record['date'],
                                                                style: TextStyle(
                                                                  color: UsersStyle.mainDarkGreyColor,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w300,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: UsersStyle.mainGreenColor.withOpacity(0.5),
                                                              ),
                                                              child: Text(
                                                                record['parsed_type'] ?? '',
                                                                style: TextStyle(
                                                                  color: UsersStyle.mainGreenColor,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w300,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                      }).toList()),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                    );
                  }).toList());
                });
              } else {
                return Center(child: PlatformCircularProgressIndicator());
              }
          }else{
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
