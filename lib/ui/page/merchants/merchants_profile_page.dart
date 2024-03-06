import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/LoginPage.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_qr_code_scanner_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_recent_record_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'bloc/merchants_profile_bloc.dart';
import 'components/merchants_icon_info_row.dart';
import 'components/merchants_profile_list_tile.dart';

class MerchantsProfilePage extends StatelessWidget {
  static const String PATH = '/merchants/profile';

  // final Map<String, dynamic> dummy = {
  //   "merchant": {
  //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
  //     "login_id": "demoshop",
  //     "name": "Richard Restaurant1",
  //     "description": "Description",
  //     "address": "Address",
  //     "phone": "29191919",
  //     "email": "testemail@email.com",
  //     "opening_period": "{monday:'09:00-17:00'}",
  //     "photo_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRnlS2Dp5p46xyjDpGD__fYPGnhZypIJN-Ydg&usqp=CAU",
  //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coverpic.png",
  //     "website": "https://google1.com",
  //     "openrice": "1",
  //     "facebook": "3",
  //     "instagram": "2",
  //     "tags": "",
  //     "business_registration_number": "",
  //     "created_date": "2020-06-28T00:15:25.000Z",
  //     "updated_date": "2020-07-12T10:29:33.000Z"
  //   },
  //   "store": {
  //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
  //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
  //     "login_id": "demoshop",
  //     "name": "First Store",
  //     "opening_period": "{\"monday\":\"09:00-17:00\"}",
  //     "phone": "29191919",
  //     "latitude": 22.44647,
  //     "longitude": 114.04082,
  //     "address": "Address",
  //     "created_date": "2020-06-28T00:15:25.000Z",
  //     "updated_date": "2020-06-28T00:15:25.000Z"
  //   }
  // };

  @override
  Widget build(BuildContext context) {
    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // dynamic merchant =
    //     Map<String, dynamic>.of(MerchantInstance.instance.profile);
    context.bloc<MerchantsProfileBloc>()
      ..add(
        GetMerchantsProfile(
          // loginId: merchant['merchant']['login_id'],
          loginId: merchantProfile.merchant.loginId,
        ),
      );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Container(
              width: 20,
              child: Image.asset('assets/icons/scan.png'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MerchantsQrCodeScannerPage.PATH,
                  arguments: {
                    'action': 'add_coins',
                  });
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              child: BlocBuilder<MerchantsProfileBloc, MerchantsProfileState>(
                builder: (context, state) {
                  if (state is MerchantsProfileLoaded) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 70,
                                  height: 70,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      state.result['merchant']['photo_url'],
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    state.result['merchant']['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: MerchantsStyle.mainBlackColor,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/merchants/edit_profile',
                                      arguments: {
                                        'profile': state.result,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 20,
                                    child: Image.asset('assets/icons/edit.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC3C3C3)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text(
                                          'Feature',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color:
                                                MerchantsStyle.mainGreenColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.result['merchant']['tags'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: MerchantsStyle.mainDarkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: MerchantsStyle.mainGreenColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text(
                                          'Open',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color:
                                                MerchantsStyle.mainGreenColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        (state.result['merchant']
                                                ['opening_period'])
                                            .toString(),
                                        // .substring(1, state.result['merchant']['opening_period'].length -1)
                                        // .replaceAll(',', '\n')
                                        // .replaceAll('\'', ''),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color:
                                              MerchantsStyle.mainDarkGreyColor,
                                        ),
                                        softWrap: true,
                                        maxLines: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MerchantsIconInfoRow(
                                leadingIcon:
                                    Image.asset('assets/icons/address.png'),
                                title: state.result['merchant']['address'],
                              ),
                              MerchantsIconInfoRow(
                                leadingIcon:
                                    Image.asset('assets/icons/phone.png'),
                                title: state.result['merchant']['phone'],
                              ),
                              MerchantsIconInfoRow(
                                leadingIcon:
                                    Image.asset('assets/icons/website.png'),
                                title: state.result['merchant']['website'],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset(
                                            'assets/icons/openrice_link.png'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset(
                                            'assets/icons/facebook_link.png'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset(
                                            'assets/icons/instagram_link.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      height: 331,
                      child: Center(
                        child: PlatformCircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          MerchantsProfileListTile(
            leadingIcon: Image.asset('assets/icons/clock.png'),
            title: 'My recent record',
            onTap: () {
              Navigator.pushNamed(context, MerchantsRecentRecordPage.PATH);
            },
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 13),
          //   child: Divider(),
          // ),
          // MerchantsProfileListTile(
          //   leadingIcon: Image.asset('assets/icons/clock.png'),
          //   title: 'My activity',
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 13),
          //   child: Divider(),
          // ),
          // MerchantsProfileListTile(
          //   leadingIcon: Image.asset('assets/icons/coupon.png'),
          //   title: 'My coupon',
          // ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            child: Divider(),
          ),
          MerchantsProfileListTile(
            leadingIcon: Image.asset('assets/icons/logout.png'),
            title: 'Log out',
            onTap: () {
              Amplify.Auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.PATH, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}
