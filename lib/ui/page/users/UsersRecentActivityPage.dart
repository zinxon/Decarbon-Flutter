import 'package:DeCarbon/api/users/UsersActivityRepository.dart';
import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersActivityCard.dart';

class UsersRecentActivityPage extends StatelessWidget {
  static const String PATH = '/users/recent_activity';

  @override
  Widget build(BuildContext context) {
    final User userProfile = UsersInstance.instance.user;
    final Map<String, dynamic> dummy = {
      "success": true,
      "result": [
        {
          "activity_id": "imVQUdohYDr3MRU1BpVy6n",
          "type": "Consump",
          "name": "Test Activity5",
          "description": "Description",
          "reward_coins": 30,
          // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-imVQUdohYDr3MRU1BpVy6n.jpg",
          "photo_url": "https://www.azocleantech.com/images/Article_Images/ImageForArticle_912(1).jpg",
          "date": "2020-06-30",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        },
        {
          "activity_id": "9ztnSfd38QgW4AgjVYMyyp",
          "type": "Consump",
          "name": "Test Activity",
          "description": "Description",
          "reward_coins": 1,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-9ztnSfd38QgW4AgjVYMyyp.jpg",
          "date": "2020-06-28",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        },
        {
          "activity_id": "9ztnSfd38QgW4AgjVYMyyp",
          "type": "Consump",
          "name": "Test Activity",
          "description": "Description",
          "reward_coins": 1,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-9ztnSfd38QgW4AgjVYMyyp.jpg",
          "date": "2020-06-28",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        }
      ]
    };

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
          'My Recent Activity',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: UsersActivityRepository.getUserActivityRecordList(userId: userProfile.userId, loginId: userProfile.loginId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data.data['success']){
              return ListView.builder(
                itemCount: snapshot.data.data['result'].length,
                // itemCount: dummy['result'].length,
                itemBuilder: (context, index){
                  return Container(
                    child: Column(
                      children: [
                        Text(
                          snapshot.data.data['result'][index]['date'],
                          // dummy['result'][index]['date'],
                          style: TextStyle(
                            color: UsersStyle.mainGreyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        UsersActivityCard(
                          listIndex: index,
                          activityData: snapshot.data.data['result'][index],
                          // activityData: dummy['result'][index],
                        ),
                      ],
                    ),
                  );
                },
              );
            }else{
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
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
