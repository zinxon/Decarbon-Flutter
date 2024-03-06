import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/usersRecordRepository.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/UsersRecentRecordPage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'UsersRecordDetailPage.dart';

class UsersMyCarbonPointsPage extends StatelessWidget{
  static const PATH = '/users/mycarbonpoints';
  
  final Map<String, dynamic> dummy = {
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
          'My Carbon Points',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 122,
                      margin: EdgeInsets.only(top: 58, bottom: 21),
                      child: Image.asset('assets/images/banner.png'),
                    ),
                    Container(
                      width: 166,
                      child: QrImage(
                        data: UsersInstance.instance.user.userId,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60, right: 60, bottom: 20, top: 10),
                      child: Text(
                        'Present this QR code to the merchant to receive your points',
                        style: TextStyle(
                          color: UsersStyle.mainGreyColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: UsersStyle.mainGreyColor,),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Record',
                            style: TextStyle(
                              fontSize: 17,
                              color: UsersStyle.mainBlackColor,
                            ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, UsersRecentRecordPage.PATH);
                          },
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: UsersStyle.mainGreyColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Icon(Icons.chevron_right, color: UsersStyle.mainGreyColor,)
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: UsersRecordRepository.getUserRecordList(userId: userProfile.userId, loginId:userProfile.loginId),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.done){
                            if (snapshot.data.data['success']) {
                              return SingleChildScrollView(
                                  child: Container(
                                    child: Column(
                                      // children: dummy['result'].toList().map<Widget>((dynamic record) {
                                      children: snapshot.data.data['result'].toList().map<Widget>((dynamic record) {
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
                                                Container(
                                                  // flex: 1,
                                                  margin: EdgeInsets.only(right: 15),
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
                                    ),
                              );
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}