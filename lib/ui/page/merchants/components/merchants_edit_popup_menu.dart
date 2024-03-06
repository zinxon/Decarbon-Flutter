import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_activity_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_coupon_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_edit_activity_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../merchants_qr_code_scanner_page.dart';
import 'merchants_delete_confirm_dialog.dart';

class MerchantsEditPopupMenu extends StatelessWidget {
  final String activityId;
  final String couponId;
  final dynamic activityData;
  final dynamic couponData;
  final String category;

  const MerchantsEditPopupMenu(
      {Key key,
      this.activityId,
      this.couponId,
      this.activityData,
      this.couponData,
      this.category = 'activity'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (dynamic value) {
        if (category == 'activity') {
          switch (value) {
            case 'edit':
              Navigator.pushNamed(
                  context, '/merchants/edit_activity/$activityId',
                  arguments: {
                    'activity': activityData,
                  });
              break;
            case 'delete':
              showDialog(
                  context: context,
                  builder: (context) {
                    return MerchantsDeleteConfirmDialog(
                      actionTarget: 'activity',
                      yesOnPressed: () {
                        Navigator.pop(context);
                        // final dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
                        final MerchantProfile merchantProfile =
                            MerchantInstance.instance.profile;
                        context.bloc<MerchantsActivityBloc>()
                          ..add(DeleteSpecificMerchantsActivity(
                            // merchantsId: merchant['merchant']['merchant_id'],
                            // storeId: merchant['store']['store_id'],
                            // loginId: merchant['merchant']['login_id'],
                            merchantsId: merchantProfile.merchant.merchantId,
                            storeId: merchantProfile.store.storeId,
                            loginId: merchantProfile.merchant.loginId,
                            loginType: 'merchant',
                            activityId: activityId,
                          ));
                      },
                    );
                  });
              break;
            default:
              break;
          }
        } else if (category == 'coupon') {
          switch (value) {
            case 'edit':
              Navigator.pushNamed(context, '/merchants/edit_coupon/$couponId',
                  arguments: {
                    'coupon': couponData,
                  });
              break;
            case 'delete':
              showDialog(
                  context: context,
                  builder: (context) {
                    return MerchantsDeleteConfirmDialog(
                      actionTarget: 'coupon',
                      yesOnPressed: () {
                        Navigator.pop(context);
                        // final dynamic merchant = Map<String, dynamic>.of(
                        //     MerchantInstance.instance.profile);
                        final MerchantProfile merchantProfile =
                            MerchantInstance.instance.profile;
                        context.bloc<MerchantsCouponBloc>()
                          ..add(
                            DeleteSpecificMerchantsCoupon(
                              // merchantsId: merchant['merchant']['merchant_id'],
                              // storeId: merchant['store']['store_id'],
                              // loginId: merchant['merchant']['login_id'],
                              merchantsId: merchantProfile.merchant.merchantId,
                              storeId: merchantProfile.store.storeId,
                              loginId: merchantProfile.merchant.loginId,
                              loginType: 'merchant',
                              couponId: couponId,
                            ),
                          );
                      },
                    );
                  });
              break;
            case 'scan':
              Navigator.pushNamed(context, MerchantsQrCodeScannerPage.PATH,
                  arguments: {
                    'action': 'redeem_coupon',
                  });
              break;
            default:
              break;
          }
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: Color(0xff989898),
      child: Icon(
        Icons.more_horiz,
        color: MerchantsStyle.mainDarkGreyColor,
      ),
      offset: Offset(0, 40),
      elevation: 0,
      itemBuilder: (context) {
        return <PopupMenuEntry<dynamic>>[
          category == 'activity' || category == 'coupon'
              ? PopupMenuItem<dynamic>(
                  value: 'edit',
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 20,
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/icons/edit2.png',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          category == 'activity' || category == 'coupon'
              ? PopupMenuItem<dynamic>(
                  value: 'delete',
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 20,
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/icons/bin.png',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          category == 'coupon'
              ? PopupMenuItem<dynamic>(
                  value: 'scan',
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 20,
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/icons/scan.png',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Scan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : null
        ];
      },
    );
  }
}
