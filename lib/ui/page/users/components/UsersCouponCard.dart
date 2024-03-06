import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/users/components/UsersCommonTag.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersCouponCard extends StatelessWidget{
  final Map<String, dynamic> couponData;

  const UsersCouponCard({Key key, @required this.couponData}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppProvider.getRouter(context).navigateTo(
          context,"/users/coupon_details/${couponData['coupon_id']}",
          // transition: TransitionType.inFromRight,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      couponData['photo_url'],
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: UsersStyle.mainGreenColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        ),
                        color: UsersStyle.mainGreenColor.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          '${couponData['require_coins']} DC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                height: 100,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            couponData['name'],
                            style: TextStyle(
                              fontSize: 15,
                              color: UsersStyle.mainBlackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 25,
                          child: Image.asset(
                            'assets/icons/share2.png'
                          ),
                        ),
                      ],
                    ),
                    Text(
                      couponData['description'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff999999),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: <Widget>[
                        UsersCommonTag(
                          title: couponData['type'],
                          backgroundColor: UsersStyle.mainGreyColor.withOpacity(0.3),
                          titleFontSize: 8,
                        ),
                        Flexible(
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
                              color: UsersStyle.mainGreenColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Required ${couponData['require_coins']} DC',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff989898),
                          ),
                        ),
                        // Text(
                        //   'sales $couponSales',
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //     color: Color(0xff999999),
                        //     fontWeight: FontWeight.w300,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}