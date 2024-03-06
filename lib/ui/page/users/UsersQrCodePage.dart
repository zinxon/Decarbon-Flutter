import 'dart:convert';

import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/bloc/usermycoupon_bloc.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersQrCodePage extends StatelessWidget {
  static const PATH = '/users/qrcode';

  @override
  Widget build(BuildContext context) {
    final User user = UsersInstance.instance.user;
    final Map<String, dynamic> couponData = Map.from(ModalRoute.of(context).settings.arguments)['couponData'];
    final String recordId = Map.from(ModalRoute.of(context).settings.arguments)['record_id'];

    print(md5.convert(utf8.encode('$recordId|${couponData['coupon_id']}|${user.userId}')).toString());
    print('$recordId|${couponData['coupon_id']}|${user.userId}');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: UsersStyle.mainBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            context.bloc<UserMyCouponBloc>().add(GetUserMyCouponList(userId: user.userId, loginId: user.loginId));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: UsersStyle.mainGreenColor,
                ),
                margin: EdgeInsets.only(top: 68),
                child: CachedNetworkImage(
                  imageUrl: couponData['photo_url'] ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: UsersStyle.mainGreenColor,
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  couponData['name'],
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                width: 222,
                margin: EdgeInsets.only(top: 37),
                child: QrImage(data: md5.convert(utf8.encode('$recordId|${couponData['coupon_id']}|${user.userId}')).toString()),
              ),
              Container(
                margin: EdgeInsets.only(top: 37),
                child: Text(
                  couponData['coupon_id'],
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  'Please show it to the waiter when you use it',
                  style: TextStyle(
                    color: UsersStyle.mainDarkGreyColor,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
