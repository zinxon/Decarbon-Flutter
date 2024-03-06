import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_coupon_card.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_unsuccess_dialog.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'bloc/merchants_coupon_bloc.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsCouponsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> dummy = [
    //   {
    //     "coupon_id": "ac6GZBZcBaCWAdLEWtfX79",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "require_coins": 30,
    //     "name": "Test Coupon",
    //     "description": "Description",
    //     "generated_reason": "Reason",
    //     "base_discount": 0,
    //     "percentage_discount": 10,
    //     "photo_url": "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?cs=srgb&dl=pexels-ella-olsson-1640772.jpg&fm=jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/coupon-ac6GZBZcBaCWAdLEWtfX79.jpg",
    //     "status": 1,
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-07-12T10:35:02.000Z",
    //     "updated_date": "2020-07-12T10:35:02.000Z"
    //   }
    // ];

    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
    void getCouponList() {
      return context.bloc<MerchantsCouponBloc>().add(
            GetMerchantsCouponList(
              // merchantsId: merchant['merchant']['merchant_id'],
              // storeId: merchant['store']['store_id'],
              // loginId: merchant['merchant']['login_id'],
              merchantsId: merchantProfile.merchant.merchantId,
              storeId: merchantProfile.store.storeId,
              loginId: merchantProfile.merchant.loginId,
              loginType: 'merchant',
            ),
          );
    }

    getCouponList();

    return BlocListener<MerchantsCouponBloc, MerchantsCouponState>(
      listenWhen: (previous, current) {
        return (previous is MerchantsCouponDeleteLoading ||
            current is MerchantsCouponDeleteLoading);
      },
      listener: (context, state) {
        if (state is MerchantsCouponDeleteLoading) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return BlocBuilder<MerchantsCouponBloc, MerchantsCouponState>(
                buildWhen: (previous, current) {
                  return (previous is MerchantsCouponDeleteLoading ||
                      current is MerchantsCouponDeleteLoading);
                },
                builder: (context, state) {
                  if (state is MerchantsCouponDeleteError) {
                    return MerchantsUnsuccessDialog(
                      actionName: 'deleted',
                      okOnPressed: () {
                        getCouponList();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is MerchantsCouponDeleteLoaded) {
                    return MerchantsSuccessDialog(
                      actionName: 'deleted',
                      okOnPressed: () {
                        getCouponList();
                        Navigator.popUntil(context,
                            ModalRoute.withName(MerchantsHomePage.PATH));
                      },
                    );
                  } else {
                    return MerchantsLoadingDialog();
                  }
                },
              );
            },
          );
        }
      },
      child: BlocBuilder<MerchantsCouponBloc, MerchantsCouponState>(
        buildWhen: (previous, current) {
          return previous is MerchantsCouponListLoading ||
              current is MerchantsCouponListLoading;
        },
        builder: (context, state) {
          if (state is MerchantsCouponListLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return MerchantsCouponCard(
                  couponData: state.result[index],
                );
              },
            );
          } else {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
