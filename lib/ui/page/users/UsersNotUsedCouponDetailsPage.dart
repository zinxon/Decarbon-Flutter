import 'package:DeCarbon/api/users/UsersCouponRepository.dart';
import 'package:DeCarbon/ui/page/users/UsersMerchantDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersQrCodePage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersCommonTag.dart';

class UsersNotUsedCouponDetailsPage extends StatelessWidget {
  static const String PATH = '/users/notused_coupon_details/:coupon_id/:record_id';

  final String couponId;
  final String recordId;

  const UsersNotUsedCouponDetailsPage({
    Key key,
    @required this.couponId,
    @required this.recordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dummy = {
      "success": true,
      "result": {
        "coupon_id": "enRfWD3vtKaLqmLg4VJ1Mq",
        "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
        "store_id": "jxLZCPUxtchmEB1pjrMdgr",
        "require_coins": 30,
        "name": "Test Coupon",
        "description": "Description",
        "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-enRfWD3vtKaLqmLg4VJ1Mq.jpg",
        "start_date": "2020-06-21",
        "end_date": "2021-06-23",
        "type": "Discount coupon",
        "discount_value": 10,
        "parsed_discount_value": "10% off",
        "merchant": {
          "name": "Richard Restaurant1",
          "address": "Address",
          "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png"
        }
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
          'Details',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          FutureBuilder(
            future: UsersCouponRepository.getSpecificCoupon(couponId: couponId),
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
        future: UsersCouponRepository.getSpecificCoupon(couponId: couponId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data.data['success']){
              Map<String, dynamic> data = snapshot.data.data['result'];
              // Map<String, dynamic> data = dummy['result'];
              return ListView(
                children: [
                  Container(
                    height: 224,
                    margin: EdgeInsets.only(bottom: 21),
                    decoration: BoxDecoration(
                      color: UsersStyle.mainGreenColor,
                      image: DecorationImage(
                        image: NetworkImage(data['photo_url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            data['name'] ?? '',
                            style: TextStyle(
                              fontSize: 24, 
                              color: UsersStyle.mainBlackColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            data['description'] ?? '',
                            style: TextStyle(
                              fontSize: 15, 
                              color: UsersStyle.mainDarkGreyColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: <Widget>[
                              UsersCommonTag(
                                title: data['type'],
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
                                  data['type'].toString().toLowerCase().contains('cash')
                                      ? 'HK\$${data['discount_value']} off'
                                      : data['type'].toString().toLowerCase().contains('discount')
                                          ? '${data['parsed_discount_value']}% off'
                                          : data['description'],
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
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Required ${data['require_coins']}DC',
                            style: TextStyle(
                              fontSize: 12, 
                              color: UsersStyle.mainDarkGreyColor,
                            ),
                          ),
                        ),
                        Divider(color: UsersStyle.mainFieldBorderColor),
                        GestureDetector(
                          onTap: (){
                            // Navigator.pop(context);
                            Navigator.pushNamed(context, UsersMerchantDetailsPage.PATH, arguments: {'data': data});
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Card(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Applicable Store',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: UsersStyle.mainBlackColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'More',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: UsersStyle.mainGreenColor,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward, color: UsersStyle.mainGreenColor,)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: CachedNetworkImage(
                                            imageUrl: data['merchant']['photo_url'],
                                            fit: BoxFit.cover,
                                            imageBuilder: (context, imageProvider) => Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(44),
                                                color: UsersStyle.mainGreenColor,
                                                image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                data['merchant']['name'],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: UsersStyle.mainBlackColor,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.6,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    child: Image.asset('assets/icons/address.png'),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      data['merchant']['address'] + data['merchant']['address'],
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: UsersStyle.mainGreyColor,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 18),
                          child: Text(
                            'Usage Method',
                            style: TextStyle(
                              fontSize: 17, 
                              color: UsersStyle.mainBlackColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(Icons.fiber_manual_record, color: UsersStyle.mainGreenColor, size: 15,),
                              ),
                              Text(
                                data['description'],
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: UsersStyle.mainGreyColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(Icons.fiber_manual_record, color: UsersStyle.mainGreenColor, size: 15,),
                              ),
                              Text(
                                'Available time: ${data['start_date'].replaceAll('-', '/')} - ${data['end_date'].replaceAll('-', '/')}',
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: UsersStyle.mainGreyColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            color: UsersStyle.mainGreenColor,
                            onPressed: (){
                              Navigator.pushNamed(context, UsersQrCodePage.PATH, arguments: {'couponData': data, 'record_id': recordId});
                            },
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Text(
                                  'Use Now',
                                  style: TextStyle(
                                    fontSize: 17, 
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]
                    ),
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
