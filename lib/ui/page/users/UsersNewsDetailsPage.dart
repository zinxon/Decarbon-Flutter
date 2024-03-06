import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'components/UsersRecordDetailContent.dart';

class UsersNewsDetailsPage extends StatelessWidget {
  static const String PATH = '/users/news_details';
  @override
  Widget build(BuildContext context) {
    final newsData = Map<String, dynamic>.from(ModalRoute.of(context).settings.arguments)['newsData'];
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: UsersStyle.mainGreyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(top: 9, right: 12),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Container(
                  child: Image.asset(
                    'assets/icons/share2.png',
                    color: UsersStyle.mainDarkGreyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                newsData['name'],
                style: TextStyle(
                  fontSize: 20,
                  color: UsersStyle.mainBlackColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    newsData['author'],
                    style: TextStyle(
                      color: UsersStyle.mainGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    newsData['date'],
                    style: TextStyle(
                      color: UsersStyle.mainGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 26),
              height: 215,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: UsersStyle.mainGreenColor,
                image: DecorationImage(
                  image: NetworkImage(
                    newsData['photo_url'],
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              child: Text(
                newsData['content'],
                style: TextStyle(
                  color: UsersStyle.mainGreyColor,
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
