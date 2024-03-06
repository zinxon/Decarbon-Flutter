import 'package:DeCarbon/api/users/UsersNewsRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersNewsCard.dart';

class UsersNewsView extends StatelessWidget{
  final Map<String, dynamic> dummy = {
    "success": true,
    "result": [
      {
        "news_id": 1,
        "name": "What can recycling bring to the earth?",
        "content": "Luyao Light Food Restaurant values the concept of health, and advocates a light, balanced, healthy and nutritious diet. If you stick to Luyao Restaurant for a while, you may be surprised by the beautiful changes it brings to your body. Luyao Light Food Restaurant provides a fresh and elegant shop environment for you.",
        "photo_url": "https://trimtab.living-future.org/wp-content/uploads/2020/04/person-holding-an-iphone-3850587-768x512.jpg",
        "author": "Green Ecological Website",
        "date": "2020-07-13"
      },
      {
        "news_id": 2,
        "name": "What can recycling bring to the earth? 2",
        "content": "Luyao Light Food Restaurant values the concept of health, and advocates a light, balanced, healthy and nutritious diet. If you stick to Luyao Restaurant for a while, you may be surprised by the beautiful changes it brings to your body. Luyao Light Food Restaurant provides a fresh and elegant shop environment for you.",
        "photo_url": "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/12/breaking-news-1576197867.jpg",
        "author": "Green Ecological Website 2",
        "date": "2020-07-13"
      }
    ]
  };
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UsersNewsRepository.getNewsList(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> newsData = snapshot.data.data;
          // Map<String, dynamic> newsData = dummy;
          if(newsData['success']){
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 21),
              children: [
                for(int i = 0; i < newsData['result'].toList().length; i++)
                  UsersNewsCard(listIndex: i, newsData: newsData['result'][i])
              ],
            );
          }else{
            return Center(child: PlatformCircularProgressIndicator(),);
          }
        }else{
          return Center(child: PlatformCircularProgressIndicator(),);
        }
      },
    );
  }
}