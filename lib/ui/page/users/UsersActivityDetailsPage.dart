import 'package:DeCarbon/api/users/UsersActivityRepository.dart';
import 'package:DeCarbon/ui/page/users/UsersMerchantDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersCommonDetailContent.dart';
import 'components/UsersCommonTitle.dart';

class UsersActivityDetailsPage extends StatelessWidget {
  static const String PATH = '/users/activity_details/:activity_id';

  final String activityId;

  const UsersActivityDetailsPage({
    Key key,
    @required this.activityId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dummy = {
      "success": true,
      "result": {
        "activity_id": "imVQUdohYDr3MRU1BpVy6n",
        "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
        "store_id": "jxLZCPUxtchmEB1pjrMdgr",
        "name": "Test Activity5",
        "address": "Address",
        "reward_coins": 30,
        // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-imVQUdohYDr3MRU1BpVy6n.jpg",
        "photo_url": "https://www.azocleantech.com/images/Article_Images/ImageForArticle_912(1).jpg",
        "description": "Description",
        "form_of_participation": "Form of partition",
        "type": "Consump",
        "start_date": "2020-06-21",
        "end_date": "2021-06-23",
        "merchant_name": "Richard Restaurant1"
      }
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
          'Activity Details',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          FutureBuilder(
            future: UsersActivityRepository.getSpecificActivity(activityId: activityId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // if(snapshot.data.data['success']){
                  return IconButton(
                    icon: Container(
                      width: 40,
                      child: Image.asset('assets/icons/share2.png'),
                    ),
                    onPressed: () {
                    },
                  );
                // }
              }
              return Container();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: UsersActivityRepository.getSpecificActivity(activityId: activityId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data.data['success']){
              Map<String, dynamic> data = snapshot.data.data['result'];
              // Map<String, dynamic> data = dummy['result'];
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                children: [
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(bottom: 21),
                    decoration: BoxDecoration(
                      color: UsersStyle.mainGreenColor,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(data['photo_url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 21),
                    child: Text(
                      '\u2003 ${data['description']}',
                      style: TextStyle(
                        color: UsersStyle.mainDarkGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, UsersMerchantDetailsPage.PATH,arguments: {'data': data});
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: UsersStyle.mainGreenColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Organizer',
                              style: TextStyle(
                                color: UsersStyle.mainGreenColor.withOpacity(0.8),
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              data['merchant_name'],
                              style: TextStyle(
                                color: UsersStyle.mainBlackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage('assets/icons/address.png'),
                          color: UsersStyle.mainGreenColor,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          data['address'],
                          style: TextStyle(
                            color: UsersStyle.mainBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 21, bottom: 21),
                    child: Divider(),
                  ),
                  UsersCommonTitle(
                    title: 'Activity Type',
                  ),
                  UsersCommonDetailContent(
                    content: data['type'],
                  ),
                  UsersCommonTitle(
                    title: 'Activity Name',
                  ),
                  UsersCommonDetailContent(
                    content: data['name'],
                  ),
                  UsersCommonTitle(
                    title: 'Activity Date',
                  ),
                  UsersCommonDetailContent(
                    content: '${data['start_date']} - ${data['end_date']}',
                  ),
                  UsersCommonTitle(
                    title: 'Form of participation',
                  ),
                  UsersCommonDetailContent(
                    content: data['form_of_participation'],
                  ),
                  UsersCommonTitle(
                    title: 'Reward Points',
                  ),
                  UsersCommonDetailContent(
                    content: data['reward_coins'].toString(),
                  ),
                ],
              );
            }else{
              return Center(child: PlatformCircularProgressIndicator());
            }
          } else {
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
    );
  }
}
