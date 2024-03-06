import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/UsersMerchantRepository.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/bloc/userfavourite_bloc.dart';
import 'package:DeCarbon/ui/page/users/components/UsersActivityCard.dart';
import 'package:DeCarbon/ui/page/users/components/UsersCommonTag.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'components/UsersCouponCard.dart';


class UsersMerchantDetailsPage extends StatefulWidget{
  static const String PATH = '/users/merchant_detail';

  @override
  _UsersMerchantDetailsPageState createState() => _UsersMerchantDetailsPageState();
}

class _UsersMerchantDetailsPageState extends State<UsersMerchantDetailsPage> {
  final dummy = [
    {
      "success": true,
      "result": {
        "merchant_id": "fMn6HhoqPKDwURzwB3kfLM",
        "store_id": "s8bHkttCeMXpeLFuwDkdCJ",
        "name": "Tim Restaurant",
        "description": "Description",
        "opening_period": "09:00-17:00",
        "phone": "29191919",
        "latitude": 23.54647,
        "longitude": 114.05082,
        "address": "Address",
        "email": "testemail@email.com",
        "photo_url": "https://media.glassdoor.com/l/70/77/9f/3f/mcdonalds.jpg",
        "website": "https://google.com",
        "openrice": "",
        "facebook": "",
        "instagram": "",
        "tags": "\$1-\$10, Green, I LOVE HK",
        "distance": 123.25066855226508,
        "raw_opening_period": "{\"monday\":\"09:00-17:00\", \"tuesday\":\"09:00-17:00\"}",
        "store_name": "Second Store",
        "is_opening": false,
        "is_liked": true
      }
    },
    {
      "success": true,
      "result": [
        {
          "activity_id": "imVQUdohYDr3MRU1BpVy6n",
          "type": "Consump",
          "name": "Test Activity5",
          "description": "Description",
          "reward_coins": 30,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-imVQUdohYDr3MRU1BpVy6n.jpg",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        },
        {
          "activity_id": "rpavdRuKbpdKzXi9vXctHa",
          "type": "Consump",
          "name": "Test Activity",
          "description": "Description",
          "reward_coins": 1,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-rpavdRuKbpdKzXi9vXctHa.jpg",
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
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        },
        {
          "activity_id": "hnCQmvg9BCiPs2ySKQdtdM",
          "type": "Consump",
          "name": "Test Activity",
          "description": "Description",
          "reward_coins": 1,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-hnCQmvg9BCiPs2ySKQdtdM.jpg",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        },
        {
          "activity_id": "xcgT4FxPsWkXPLtxu59c8q",
          "type": "Consump",
          "name": "Test Activity",
          "description": "Description",
          "reward_coins": 1,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-xcgT4FxPsWkXPLtxu59c8q.jpg",
          "start_date": "2020-06-21",
          "end_date": "2021-06-23"
        }
      ]
    },
    {
      "success": true,
      "result": [
        {
          "coupon_id": "n7xqQaE9B3qJn2UF6A9nm4",
          "type": "Discount coupon",
          "discount_value": 10,
          "parsed_discount_value": "10% off",
          "name": "Test Coupon",
          "description": "Description",
          "require_coins": 30,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-n7xqQaE9B3qJn2UF6A9nm4.jpg"
        },
        {
          "coupon_id": "enRfWD3vtKaLqmLg4VJ1Mq",
          "type": "Discount coupon",
          "discount_value": 10,
          "parsed_discount_value": "10% off",
          "name": "Test Coupon",
          "description": "Description",
          "require_coins": 30,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-enRfWD3vtKaLqmLg4VJ1Mq.jpg"
        },
        {
          "coupon_id": "cSVd4ymZnthLJP2T4SkQEt",
          "type": "Discount coupon",
          "discount_value": 10,
          "parsed_discount_value": "10% off",
          "name": "Test Coupon1",
          "description": "Description",
          "require_coins": 30,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-cSVd4ymZnthLJP2T4SkQEt.jpg"
        },
        {
          "coupon_id": "v8UDtZp4GXkAb26KxwaGK",
          "type": "Discount coupon",
          "discount_value": 10,
          "parsed_discount_value": "10% off",
          "name": "Test Coupon",
          "description": "Description",
          "require_coins": 30,
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-v8UDtZp4GXkAb26KxwaGK.jpg"
        }
      ]
    }
  ];
  final User userProfile = UsersInstance.instance.user;
  final Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  String showType;
  bool isLiked = false;
  Map<String, dynamic> argumentsData;
  // Map<String, dynamic> merchantData = snapshot.data[0];
  // Map<String, dynamic> merchantActivityData = snapshot.data[1];
  // Map<String, dynamic> merchantCouponData = snapshot.data[2];
  Map<String, dynamic> merchantData;
  Map<String, dynamic> merchantActivityData;
  Map<String, dynamic> merchantCouponData;
  
  
  @override
  void didChangeDependencies() {
    setState(() {
      argumentsData = Map.from(ModalRoute.of(context).settings.arguments)['data'];
    });
    super.didChangeDependencies();
  }
  
  @override
  void initState() {
    super.initState();
    showType  = 'activity';

    location.serviceEnabled().then((value){
      if(!value){
        location.requestService().then((value){
          setState(() {
            _serviceEnabled = value;
          });
        });
      }else{
        setState(() {
          _serviceEnabled = value;
        });
      }
    });

    location.hasPermission().then((value){
      if(value == PermissionStatus.denied){
        location.requestPermission().then((value){
          setState(() {
            _permissionGranted = value;
          });
        });
      }else{
        setState(() {
          _permissionGranted = value;
        });
      }
    });

    location.getLocation().then((value){
      setState(() {
        _locationData = value;
      });

      try{
        UsersMerchantRepository.getSpecificMerchant(
          merchantId: argumentsData['merchant_id'], 
          storeId: argumentsData['store_id'], 
          userId: userProfile.userId, 
          loginId: userProfile.loginId,
          latitude: _locationData.latitude ?? '',
          longitude: _locationData.longitude ?? '',
        ).then((value){
          setState((){
            merchantData = value.data;
            isLiked = merchantData['result']['is_liked'];
          });
        });

      }catch(e){
        setState(() {
          merchantData = {'success' : false, 'result': {}};
          isLiked = false;
        });
      }
      try{
        UsersMerchantRepository.getSpecificMerchantActivityList(merchantId: argumentsData['merchant_id']).then((value) => setState((){merchantActivityData = value.data;}));
      }catch(e){
        setState(() {
          merchantActivityData = {'success' : false, 'result': {}};
        });
      }
      try{
        UsersMerchantRepository.getSpecificMerchantCouponList(merchantId: argumentsData['merchant_id']).then((value) => setState((){merchantCouponData = value.data;}));
      }catch(e){
        setState(() {
          merchantCouponData = {'success' : false, 'result': {}};
        });
      }
    }).timeout(Duration(seconds: 3), onTimeout: (){
      try{
        UsersMerchantRepository.getSpecificMerchant(
          merchantId: argumentsData['merchant_id'], 
          storeId: argumentsData['store_id'], 
          userId: userProfile.userId, 
          loginId: userProfile.loginId,
          latitude: '',
          longitude:'',
        ).then((value){
          setState((){
            merchantData = value.data;
            isLiked = merchantData['result']['is_liked'];
          });
        });

      }catch(e){
        setState(() {
          merchantData = {'success' : false, 'result': {}};
          isLiked = false;
        });
      }
      try{
        UsersMerchantRepository.getSpecificMerchantActivityList(merchantId: argumentsData['merchant_id']).then((value) => setState((){merchantActivityData = value.data;}));
      }catch(e){
        setState(() {
          merchantActivityData = {'success' : false, 'result': {}};
        });
      }
      try{
        UsersMerchantRepository.getSpecificMerchantCouponList(merchantId: argumentsData['merchant_id']).then((value) => setState((){merchantCouponData = value.data;}));
      }catch(e){
        setState(() {
          merchantCouponData = {'success' : false, 'result': {}};
        });
      }
      return;
    });
    // setState(() {
    //   merchantData = dummy[0];
    //   merchantActivityData = dummy[1];
    //   merchantCouponData = dummy[2];
    //   isLiked = merchantData['result']['is_liked'];
    // });
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
          'Merchant',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: ImageIcon(
                AssetImage('assets/icons/share2.png'),
                color: UsersStyle.mainGreyColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isLiked = !isLiked;
              });
              context.bloc<UserFavouriteBloc>().add(
                UpdateUserFavouriteList(
                  userId: userProfile.userId, 
                  loginId: userProfile.loginId, 
                  storeId: merchantData['result']['store_id'], 
                  merchantId: merchantData['result']['merchant_id'],
                  status: isLiked ? 1 : 0,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: ImageIcon(
                AssetImage('assets/icons/favourite.png'),
                color: isLiked ? UsersStyle.mainGreenColor : UsersStyle.mainGreyColor
              ),
            ),
          ),
        ],
      ),
      body: Builder(
        builder: (context){
          if (merchantData != null && merchantData['success'] != null && merchantActivityData != null && merchantCouponData != null) {
            Map<String, dynamic> merchantDataResult = merchantData['result'];
            List<dynamic> merchantActivityDataResult = merchantActivityData['result'];
            List<dynamic> merchantCouponDataResult = merchantCouponData['result'];

            return ListView(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        child: CachedNetworkImage(
                          imageUrl: merchantDataResult['photo_url'],
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 150, left: 21, right: 21),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${merchantDataResult['name']}- ',
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: UsersStyle.mainBlackColor,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${merchantDataResult['distance'].round().toString()} km away',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: UsersStyle.mainGreenColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    UsersCommonTag(
                                      title: 'Feature',
                                      backgroundColor: UsersStyle.mainGreyColor.withOpacity(0.3),
                                    ),
                                    Flexible(
                                      child: Text(
                                        merchantDataResult['description'],
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
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    UsersCommonTag(
                                      title: 'Open',
                                      backgroundColor: UsersStyle.mainGreenColor.withOpacity(0.3),
                                    ),
                                    Flexible(
                                      child: Text(
                                        merchantDataResult['raw_opening_period'].toString().replaceAll('{', "").replaceAll('}', "").replaceAll(",", "\n"),
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
                                child: Row(
                                  children: merchantDataResult['tags'].toString().trim().split(',').toList().map((e){
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
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 1,
                                color: UsersStyle.mainFieldBorderColor,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 21,
                                      child: ImageIcon(
                                        AssetImage('assets/icons/address.png'),
                                        color: UsersStyle.mainGreenColor,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        merchantDataResult['address'],
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
                                margin: EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 21,
                                      margin: EdgeInsets.only(right: 10),
                                      child: ImageIcon(
                                        AssetImage('assets/icons/phone.png'),
                                        color: UsersStyle.mainGreenColor,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        merchantDataResult['phone'],
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
                                margin: EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 21,
                                      margin: EdgeInsets.only(right: 10),
                                      child: ImageIcon(
                                        AssetImage('assets/icons/website.png'),
                                        color: UsersStyle.mainGreenColor,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        merchantDataResult['website'],
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
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset('assets/icons/openrice_link.png'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset('assets/icons/facebook_link.png'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset('assets/icons/instagram_link.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            showType = 'activity';
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                                Text(
                                'Activity',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: showType == 'activity' ? UsersStyle.mainGreenColor : UsersStyle.mainGreyColor,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 2,
                                width: 70,
                                color: showType == 'activity' ? UsersStyle.mainGreenColor : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            showType = 'coupon';
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                                Text(
                                'Coupon',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: showType == 'coupon' ? UsersStyle.mainGreenColor : UsersStyle.mainGreyColor,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 2,
                                width: 70,
                                color: showType == 'coupon' ? UsersStyle.mainGreenColor : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                showType == 'activity' ? Container(
                  child: Column(
                    children: [
                      for(int i = 0; i < merchantActivityDataResult.length; i++)
                        UsersActivityCard(listIndex: i, activityData: merchantActivityDataResult[i], bottomMargin: 21,)
                    ],
                  ),
                ) : Container(),
                showType == 'coupon' ? Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 21),
                    child: Column(
                      children: [
                        for(int i = 0; i < merchantCouponDataResult.length; i++)
                          UsersCouponCard(couponData: merchantCouponDataResult[i])
                      ],
                    ),
                  ),
                ) : Container(),
              ],
            );
          }else{
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
    );
  }
}