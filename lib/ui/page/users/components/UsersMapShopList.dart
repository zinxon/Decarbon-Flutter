import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UsersMapShopList extends StatelessWidget{
  final List<dynamic> merchantData;
  final Function collapseOnTap;
  final Function shopOnTap;

  const UsersMapShopList({Key key, @required this.merchantData, @required this.collapseOnTap, @required this.shopOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: collapseOnTap,
            child: Container(
              color: UsersStyle.mainGreenColor.withOpacity(0.5),
              child: Center(
                child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 200,
            color: UsersStyle.mainGreenColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0; i < merchantData.length; i++)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            shopOnTap(i);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: CachedNetworkImage(
                                    imageUrl: merchantData[i]['photo_url'],
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) => Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: UsersStyle.mainGreenColor,
                                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        merchantData[i]['name'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(Icons.location_on, color: Colors.white, size: 15,),
                                          ),
                                          Flexible(
                                            child: Text(
                                              merchantData[i]['address'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(Icons.east, color: UsersStyle.mainGreenColor, size: 20,),
                                      ),
                                    ),
                                    Text(
                                      '< ${merchantData[i]['distance'].round()}km',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 1,
                        )
                      ],
                    )
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}