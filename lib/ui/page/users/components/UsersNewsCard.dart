import 'package:DeCarbon/ui/page/users/UsersNewsDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UsersNewsCard extends StatelessWidget {
  final int listIndex;
  final Map<String, dynamic> newsData;

  const UsersNewsCard({
    Key key,
    @required this.listIndex,
    @required this.newsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> contentBackgroundColors = [
      Color(0xff216411).withOpacity(0.86),
      Color(0xff59AEAB).withOpacity(0.86),
    ];

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UsersNewsDetailsPage.PATH, arguments: {'newsData': newsData});
      },
      child: Container(
        width: 315,
        height: 215,
        margin: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: UsersStyle.mainGreenColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: newsData['photo_url'],
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                width: 315,
                height: 215,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: UsersStyle.mainGreenColor,
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              margin: EdgeInsets.only(top: 9, right: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: 16,
                                  child: Image.asset(
                                    'assets/icons/share.png',
                                    color: UsersStyle.mainDarkGreyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: contentBackgroundColors[listIndex % 2],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(12)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                newsData['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
