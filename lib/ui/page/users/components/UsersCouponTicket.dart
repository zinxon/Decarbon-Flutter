import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'UsersCommonTag.dart';

class UsersCouponTicket extends StatelessWidget{
  final Map<String, dynamic> couponData;
  final bool used;

  const UsersCouponTicket({Key key, @required this.couponData, @required this.used}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(couponData);
    return GestureDetector(
      onTap:(){
        if(!used && couponData['deleted'] != 1){
          AppProvider.getRouter(context).navigateTo(
            context,"/users/notused_coupon_details/${couponData['coupon_id']}/${couponData['record_id']}",
            // transition: TransitionType.inFromRight,
          );
        }
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: used ? UsersStyle.mainGreyColor.withOpacity(0.3) : couponData['deleted'] == 1 ? Colors.red.withOpacity(0.3) :UsersStyle.mainGreenColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: used ? UsersStyle.mainGreyColor : couponData['deleted'] == 1 ? Colors.red :UsersStyle.mainGreenColor)
            ),
            child: Center(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: UsersStyle.mainGreenColor,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: couponData['photo_url'],
                        imageBuilder: (context, imageProvider) => Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: couponData['deleted'] == 1 ? Colors.red :UsersStyle.mainGreenColor,
                            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                couponData['name'],
                                style: TextStyle(
                                  color: UsersStyle.mainBlackColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                couponData['description'],
                                style: TextStyle(
                                  color: UsersStyle.mainBlackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      // couponData['type'] == 'Cash Coupon'
                                      //   ? 'HK\$$couponBaseDiscount off'
                                      //   : couponData['type'] == 'Discount Coupon'
                                      //     ? '$couponPercentageDiscount% off'
                                      //     : couponData['description'] ,
                                      couponData['type'].toString().toLowerCase().contains('cash')
                                          ? 'HK\$${couponData['discount_value']} off'
                                          : couponData['type'].toString().toLowerCase().contains('discount')
                                              ? '${couponData['parsed_discount_value']}% off'
                                              : couponData['description'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: couponData['deleted'] == 1 ? UsersStyle.mainBlackColor :UsersStyle.mainGreenColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  UsersCommonTag(
                                    title: couponData['type'],
                                    backgroundColor: UsersStyle.mainGreyColor.withOpacity(0.3),
                                    titleFontSize: 8,
                                    fontColor: couponData['deleted'] == 1 ? UsersStyle.mainBlackColor : UsersStyle.mainGreenColor,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 3),
                              child: DottedLine(
                                dashColor: UsersStyle.mainFieldBorderColor,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Expiration ${couponData['start_date'].toString().replaceAll('-', '/')} - ${couponData['end_date'].toString().replaceAll('-', '/')}',
                                style: TextStyle(
                                  color: UsersStyle.mainGreyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          used ? Positioned.fill(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ) : Container(),
          couponData['deleted'] == 1 ? Positioned(
            top: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Deleted',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.red,
                ),
              ),
            ),
          ) : Container()
        ],
      )
    );
  }
}