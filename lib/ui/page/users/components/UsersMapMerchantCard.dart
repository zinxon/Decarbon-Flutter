import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../UsersMerchantDetailsPage.dart';
import 'UsersCommonTag.dart';

class UsersMapMerchantCard extends StatelessWidget{
  final Map<String,dynamic> merchantData;

  const UsersMapMerchantCard({Key key, @required this.merchantData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UsersMerchantDetailsPage.PATH,arguments: {'data': merchantData});
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '< ${merchantData['distance'].round().toString()}km',
                      style: TextStyle(
                        color: UsersStyle.mainGreenColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'More →',
                      style: TextStyle(
                        color: UsersStyle.mainGreenColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: UsersStyle.mainGreenColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(right: 13),
                      child: CachedNetworkImage(
                        imageUrl: merchantData['photo_url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 13),
                            child: Text(
                              merchantData['store_name'],
                              style: TextStyle(
                                color: UsersStyle.mainBlackColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 7),
                                  child: ImageIcon(
                                    AssetImage('assets/icons/address.png'),
                                    size: 18,
                                    color: UsersStyle.mainGreenColor,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    merchantData['address'],
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: UsersStyle.mainGreyColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 7),
                                  child: ImageIcon(
                                    AssetImage('assets/icons/clock2.png'),
                                    size: 17,
                                    color: UsersStyle.mainGreenColor,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    merchantData['opening_period'],
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: UsersStyle.mainGreyColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: UsersStyle.mainGreyColor.withOpacity(0.5),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          'Features',
                          style: TextStyle(
                            color: UsersStyle.mainGreenColor,
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        merchantData['description'],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: UsersStyle.mainGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: merchantData['tags'].toString().trim().split(',').toList().map((e){
                    if(e.trim().isEmpty){
                      return Container();
                    }
                    return UsersCommonTag(
                      title: e,
                      backgroundColor: UsersStyle.mainGreyColor.withOpacity(0.3),
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: Divider(color: UsersStyle.mainFieldBorderColor,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}