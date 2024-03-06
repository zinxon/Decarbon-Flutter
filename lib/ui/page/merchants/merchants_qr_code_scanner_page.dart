import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_coupon_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_coupon_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_give_points_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsQrCodeScannerPage extends StatefulWidget {
  static const String PATH = '/merchants/qrcodescanner';

  @override
  _MerchantsQrCodeScannerPageState createState() =>
      _MerchantsQrCodeScannerPageState();
}

class _MerchantsQrCodeScannerPageState
    extends State<MerchantsQrCodeScannerPage> {
  var arguments;
  String action;
  String activityId;
  String coins;
  String note;

  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String qrText = '';

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void didChangeDependencies() {
    arguments = ModalRoute.of(context).settings.arguments;
    action = arguments == null
        ? ''
        : arguments['action'] == null
            ? ''
            : arguments['action'];
    activityId = arguments == null
        ? ''
        : arguments['activity_id'] == null
            ? ''
            : arguments['activity_id'];
    coins = arguments == null
        ? ''
        : arguments['coins'] == null
            ? ''
            : arguments['coins'];
    note = arguments == null
        ? ''
        : arguments['note'] == null
            ? ''
            : arguments['note'];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      qrText = '';
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.close,
                  color: Color(0xff5E7362),
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Scan QR Code to give carbon points',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      print(qrText);
                      if (qrText.isNotEmpty) {
                        if (action == 'add_user_to_activity') {
                          Navigator.pushNamed(
                              context, MerchantsGivePointsPage.PATH,
                              arguments: {
                                'action': action,
                                'activity_id': activityId,
                                'user_id': qrText,
                                'coins': coins,
                                'note': note,
                              });
                        } else if (action == 'add_coins') {
                          Navigator.pushNamed(
                              context, MerchantsGivePointsPage.PATH,
                              arguments: {
                                'action': action,
                                'user_id': qrText,
                              });
                        } else if (action == 'redeem_coupon') {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return MerchantsLoadingDialog();
                              });
                          // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
                          final MerchantProfile merchantProfile =
                              MerchantInstance.instance.profile;
                          MerchantsCouponRepository.redeemCoupon(
                            // merchantsId : merchant['merchant']['merchant_id'],
                            // storeId: merchant['store']['store_id'],
                            // loginId: merchant['merchant']['login_id'],
                            merchantsId: merchantProfile.merchant.merchantId,
                            storeId: merchantProfile.store.storeId,
                            loginId: merchantProfile.merchant.loginId,
                            loginType: 'merchant',
                            hash: qrText,
                          ).then((response) {
                            print(response);
                            if (response.statusCode < 200 ||
                                response.statusCode > 299) {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return MerchantsUnsuccessDialog(
                                      actionName: 'redeemed',
                                      okOnPressed: () {
                                        Navigator.popUntil(
                                            context,
                                            ModalRoute.withName(
                                                MerchantsQrCodeScannerPage
                                                    .PATH));
                                      },
                                    );
                                  });
                            } else {
                              if (jsonDecode(response.toString())['success']) {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return MerchantsSuccessDialog(
                                        actionName: 'redeemed',
                                        okOnPressed: () {
                                          context
                                              .bloc<MerchantsCouponBloc>()
                                              .add(
                                                GetMerchantsCouponList(
                                                  // merchantsId:
                                                  //     merchant['merchant']
                                                  //         ['merchant_id'],
                                                  // storeId: merchant['store']
                                                  //     ['store_id'],
                                                  // loginId: merchant['merchant']
                                                  //     ['login_id'],
                                                  merchantsId: merchantProfile
                                                      .merchant.merchantId,
                                                  storeId: merchantProfile
                                                      .store.storeId,
                                                  loginId: merchantProfile
                                                      .merchant.loginId,
                                                  loginType: 'merchant',
                                                ),
                                              );
                                          Navigator.popUntil(
                                              context,
                                              ModalRoute.withName(
                                                  MerchantsHomePage.PATH));
                                        },
                                      );
                                    });
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return MerchantsUnsuccessDialog(
                                        actionName: 'redeemed',
                                        okOnPressed: () {
                                          Navigator.popUntil(
                                              context,
                                              ModalRoute.withName(
                                                  MerchantsQrCodeScannerPage
                                                      .PATH));
                                        },
                                      );
                                    });
                              }
                            }
                          });
                        }
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.all(30),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MerchantsStyle.mainGreenColor,
                        ),
                        child: Container(
                          width: 40,
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/scan.png',
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
