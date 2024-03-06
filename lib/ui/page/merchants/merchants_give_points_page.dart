import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_activity_repository.dart';
import 'package:DeCarbon/api/merchants/merchants_profile_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_title.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_give_points_text_field.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_success_dialog.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_unsuccess_dialog.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_home_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_qr_code_scanner_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/merchants_loading_dialog.dart';

class MerchantsGivePointsPage extends StatefulWidget {
  static const PATH = '/merchants/give_points';

  @override
  _MerchantsGivePointsPageState createState() =>
      _MerchantsGivePointsPageState();
}

class _MerchantsGivePointsPageState extends State<MerchantsGivePointsPage> {
  TextEditingController coinsController;
  TextEditingController noteController;
  var arguments;

  @override
  void didChangeDependencies() {
    arguments = ModalRoute.of(context).settings.arguments;
    coinsController = TextEditingController(
        text: arguments == null
            ? ''
            : arguments['coins'] == null
                ? ''
                : arguments['coins']);
    noteController = TextEditingController(
        text: arguments == null
            ? ''
            : arguments['note'] == null
                ? ''
                : arguments['note']);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MerchantsStyle.mainGreenColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Give Points',
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MerchantsCommonTitle(
                title: 'Amount',
                fontSize: 17,
              ),
              MerchantsGivePointsTextField(
                controller: coinsController,
                keyboardType: TextInputType.number,
                readOnly: arguments != null &&
                    arguments['coins'] != null &&
                    arguments['coins'].isNotEmpty,
                icon: Container(
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: MerchantsStyle.mainGreenColor,
                      )),
                  margin: EdgeInsets.only(right: 5),
                  child: Center(
                    child: Text(
                      'C',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: MerchantsStyle.mainGreenColor,
                      ),
                    ),
                  ),
                ),
              ),
              MerchantsCommonTitle(
                title: 'Note',
                fontSize: 17,
              ),
              MerchantsGivePointsTextField(
                controller: noteController,
                readOnly: arguments != null &&
                    arguments['note'] != null &&
                    arguments['note'].isNotEmpty,
                icon: Container(
                    width: 20,
                    margin: EdgeInsets.only(right: 5),
                    child: Image.asset('assets/icons/edit.png')),
              ),
              Container(
                  width: 200,
                  height: 41,
                  margin: EdgeInsets.only(top: 84),
                  child: FlatButton(
                      color: MerchantsStyle.mainGreenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return MerchantsLoadingDialog();
                            });
                        // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
                        final MerchantProfile merchantProfile =
                            MerchantInstance.instance.profile;
                        if (arguments != null && arguments['action'] != null) {
                          switch (arguments['action']) {
                            case 'add_coins':
                              if (coinsController.text.isEmpty) {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return MerchantsUnsuccessDialog(
                                        actionName: '',
                                        okOnPressed: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              } else {
                                MerchantsProfileRepository.addCoins(
                                  // merchantsId : merchant['merchant']['merchant_id'],
                                  // storeId: merchant['store']['store_id'],
                                  // loginId: merchant['merchant']['login_id'],
                                  merchantsId:
                                      merchantProfile.merchant.merchantId,
                                  storeId: merchantProfile.store.storeId,
                                  loginId: merchantProfile.merchant.loginId,
                                  loginType: 'merchant',
                                  userId: arguments['user_id'],
                                  coins: int.parse(coinsController.text),
                                  remarks: noteController.text,
                                ).then((response) {
                                  print(response);
                                  if (response.statusCode < 200 ||
                                      response.statusCode > 299) {
                                    Navigator.pop(context);
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return MerchantsUnsuccessDialog(
                                            actionName: '',
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
                                    if (jsonDecode(
                                        response.toString())['success']) {
                                      Navigator.pop(context);
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return MerchantsSuccessDialog(
                                              actionName: '',
                                              okOnPressed: () {
                                                Navigator.popUntil(
                                                    context,
                                                    ModalRoute.withName(
                                                        MerchantsHomePage
                                                            .PATH));
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
                                              actionName: '',
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
                              break;
                            case 'add_user_to_activity':
                              if (coinsController.text.isEmpty) {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return MerchantsUnsuccessDialog(
                                        actionName: '',
                                        okOnPressed: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              } else {
                                MerchantsActivityRepository.addUserToActivity(
                                  // merchantsId: merchant['merchant']
                                  //     ['merchant_id'],
                                  // storeId: merchant['store']['store_id'],
                                  // loginId: merchant['merchant']['login_id'],
                                  merchantsId:
                                      merchantProfile.merchant.merchantId,
                                  storeId: merchantProfile.store.storeId,
                                  loginId: merchantProfile.merchant.loginId,
                                  loginType: 'merchant',
                                  activityId: arguments['activity_id'],
                                  userId: arguments['user_id'],
                                  coins: int.parse(coinsController.text),
                                  remarks: noteController.text,
                                ).then((response) {
                                  print(response);
                                  if (response.statusCode < 200 ||
                                      response.statusCode > 299) {
                                    Navigator.pop(context);
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return MerchantsUnsuccessDialog(
                                            actionName: '',
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
                                    if (jsonDecode(
                                        response.toString())['success']) {
                                      Navigator.pop(context);
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return MerchantsSuccessDialog(
                                              actionName: '',
                                              okOnPressed: () {
                                                Navigator.popUntil(
                                                    context,
                                                    ModalRoute.withName(
                                                        MerchantsHomePage
                                                            .PATH));
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
                                              actionName: '',
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
                              break;
                            default:
                              Navigator.pop(context);
                              break;
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
