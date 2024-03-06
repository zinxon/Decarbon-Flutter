import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/bloc/usermycoupon_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersCouponTicket.dart';
import 'style/UsersStyle.dart';

class UsersMyCouponsPage extends StatefulWidget {
  static const String PATH = '/user/mycoupons';

  @override
  _UsersMyCouponsPageState createState() => _UsersMyCouponsPageState();
}

class _UsersMyCouponsPageState extends State<UsersMyCouponsPage> {
  final Map<String, dynamic> dummy = {
    "success": true,
    "result": {
      "w1jKSQDsuuyVLmAddnxfzF": {
        "data": [
          {
            "record_id": 15,
            "coupon_id": "enRfWD3vtKaLqmLg4VJ1Mq",
            "type": "Discount coupon",
            "discount_value": 10,
            "parsed_discount_value": "10% off",
            "name": "Test Coupon",
            "description": "Description",
            "require_coins": 30,
            "photo_url":
                "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-enRfWD3vtKaLqmLg4VJ1Mq.jpg",
            "start_date": "2020-06-21",
            "end_date": "2021-06-23"
          }
        ],
        "merchant_photo_url":
            "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "merchant_name": "Richard Restaurant1",
        "merchant_id": "w1jKSQDsuuyVLmAddnxfzF"
      },
      "w1jKSQDsuuyVLmAddnxfzA": {
        "data": [
          {
            "record_id": 15,
            "coupon_id": "enRfWD3vtKaLqmLg4VJ1Mq",
            "type": "Discount coupon",
            "discount_value": 10,
            "parsed_discount_value": "10% off",
            "name": "Test Coupon",
            "description": "Description",
            "require_coins": 30,
            "photo_url":
                "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-enRfWD3vtKaLqmLg4VJ1Mq.jpg",
            "start_date": "2020-06-21",
            "end_date": "2021-06-23"
          }
        ],
        "merchant_photo_url":
            "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
        "merchant_name": "Richard Restaurant2",
        "merchant_id": "w1jKSQDsuuyVLmAddnxfzF"
      }
    }
  };

  final User userProfile = UsersInstance.instance.user;
  String showType;

  @override
  void initState() {
    setState(() {
      showType = 'unused';
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.bloc<UserMyCouponBloc>().add(GetUserMyCouponList(
        userId: userProfile.userId, loginId: userProfile.loginId));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
          'My Coupons',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<UserMyCouponBloc, UserMyCouponState>(
        builder: (context, state) {
          if (state is UserMyCouponListLoaded) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showType = 'unused';
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Unused',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: showType == 'unused'
                                          ? UsersStyle.mainGreenColor
                                          : UsersStyle.mainGreyColor,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 2,
                                    width: 70,
                                    color: showType == 'unused'
                                        ? UsersStyle.mainGreenColor
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showType = 'used';
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Used',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: showType == 'used'
                                          ? UsersStyle.mainGreenColor
                                          : UsersStyle.mainGreyColor,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 2,
                                    width: 70,
                                    color: showType == 'used'
                                        ? UsersStyle.mainGreenColor
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    showType == 'unused'
                        ? SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  for (int i = 0;
                                      i < state.notUsedCouponList.length;
                                      i++)
                                    // for(int i = 0; i < dummy['result'].values.toList().length; i++)
                                    Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 44,
                                              height: 44,
                                              margin: EdgeInsets.only(
                                                  right: 10, top: 20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(44),
                                                color:
                                                    UsersStyle.mainGreenColor,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    state.notUsedCouponList
                                                            .values
                                                            .toList()[i]
                                                        ['merchant_photo_url'],
                                                // imageUrl: dummy['result'].values.toList()[i]['merchant_photo_url'],
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              44),
                                                      color: UsersStyle
                                                          .mainGreenColor,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              state.notUsedCouponList.values
                                                  .toList()[i]['merchant_name'],
                                              // dummy['result'].values.toList()[i]['merchant_name'],
                                              style: TextStyle(
                                                color:
                                                    UsersStyle.mainBlackColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        for (int j = 0;
                                            j <
                                                state.notUsedCouponList.values
                                                    .toList()[i]['data']
                                                    .length;
                                            j++)
                                          // for(int j = 0; j < dummy['result'].values.toList()[i]['data'].length; j++)
                                          UsersCouponTicket(
                                              couponData: state
                                                  .notUsedCouponList.values
                                                  .toList()[i]['data'][j],
                                              used: false)
                                        // UsersCouponTicket(couponData: dummy['result'].values.toList()[i]['data'][j], used: false)
                                      ],
                                    )),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    showType == 'used'
                        ? SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  for (int i = 0;
                                      i < state.usedCouponList.length;
                                      i++)
                                    // for(int i = 0; i < dummy['result'].values.toList().length; i++)
                                    Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 44,
                                              height: 44,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(44),
                                                color:
                                                    UsersStyle.mainGreenColor,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: state
                                                        .usedCouponList.values
                                                        .toList()[i]
                                                    ['merchant_photo_url'],
                                                // imageUrl: dummy['result'].values.toList()[i]['merchant_photo_url'],
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              44),
                                                      color: UsersStyle
                                                          .mainGreenColor,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              state.usedCouponList.values
                                                  .toList()[i]['merchant_name'],
                                              // dummy['result'].values.toList()[i]['merchant_name'],
                                              style: TextStyle(
                                                color:
                                                    UsersStyle.mainBlackColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        for (int j = 0;
                                            j <
                                                state.usedCouponList.values
                                                    .toList()[i]['data']
                                                    .length;
                                            j++)
                                          // for(int j = 0; j < dummy['result'].values.toList()[i]['data'].length; j++)
                                          UsersCouponTicket(
                                              couponData: state
                                                  .usedCouponList.values
                                                  .toList()[i]['data'][j],
                                              used: true)
                                        // UsersCouponTicket(couponData: dummy['result'].values.toList()[i]['data'][j], used: true)
                                      ],
                                    )),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
    );
  }
}
