import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_coupon_usage_content.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';

import 'bloc/merchants_coupon_bloc.dart';
import 'components/merchants_edit_popup_menu.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsCouponDetailsPage extends StatelessWidget {
  static const String PATH = '/merchants/coupon_details/:coupon_id';

  final String couponId;

  const MerchantsCouponDetailsPage({
    Key key,
    @required this.couponId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
    context.bloc<MerchantsCouponBloc>()
      ..add(
        GetMerchantsCouponDetails(
          // merchantsId : merchant['merchant']['merchant_id'],
          // storeId: merchant['store']['store_id'],
          // loginId: merchant['merchant']['login_id'],
          merchantsId: merchantProfile.merchant.merchantId,
          storeId: merchantProfile.store.storeId,
          loginId: merchantProfile.merchant.loginId,
          loginType: 'merchant',
          couponId: couponId,
        ),
      );
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
      child: Scaffold(
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
            'Coupon Details',
            style: TextStyle(
              color: MerchantsStyle.mainBlackColor,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            BlocBuilder<MerchantsCouponBloc, MerchantsCouponState>(
                buildWhen: (previous, current) {
              return (previous is MerchantsCouponDetailsLoading ||
                  current is MerchantsCouponDetailsLoading);
            }, builder: (context, state) {
              if (state is MerchantsCouponDetailsLoaded) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: MerchantsEditPopupMenu(
                    category: 'coupon',
                    couponId: couponId,
                    couponData: state.result,
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
        body: BlocBuilder<MerchantsCouponBloc, MerchantsCouponState>(
          buildWhen: (previous, current) {
            return (previous is MerchantsCouponDetailsLoading ||
                current is MerchantsCouponDetailsLoading);
          },
          builder: (context, state) {
            if (state is MerchantsCouponDetailsLoaded) {
              print(state.result);
              final String couponPhotoUrl = state.result['photo_url'] ?? '';
              final String couponName = state.result['name'] ?? '';
              // final String couponAddress =
              //     merchant['merchant']['address'] ?? '';
              final String couponAddress =
                  merchantProfile.merchant.address ?? '';
              final String couponType = state.result['type'] ?? '';
              final String couponRewardCoins =
                  '${(state.result['require_coins'] ?? '').toString()}DC';
              final String couponDescription =
                  state.result['description'] ?? '';
              final String couponBaseDiscount =
                  state.result['base_discount'].toString() ?? '';
              final String couponPercentageDiscount =
                  state.result['percentage_discount'].toString() ?? '';
              final String couponDiscountDescription =
                  state.result['coupon_discount_description'] ?? '';
              final String couponSales =
                  (state.result['participation_count'] ?? '').toString();
              final String couponStartDate = DateFormat('yyyy/MM/dd')
                      .format(DateTime.tryParse(state.result['start_date'])) ??
                  '';
              final String couponEndDate = DateFormat('yyyy/MM/dd')
                      .format(DateTime.tryParse(state.result['end_date'])) ??
                  '';

              return ListView(
                // padding: EdgeInsets.symmetric(horizontal: 30,  vertical: 30),
                children: <Widget>[
                  Container(
                    height: 224,
                    margin: EdgeInsets.only(bottom: 21),
                    decoration: BoxDecoration(
                        color: MerchantsStyle.mainGreenColor,
                        image: DecorationImage(
                            image: NetworkImage(
                              couponPhotoUrl,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 21),
                          child: Text(
                            couponName,
                            style: TextStyle(
                              color: MerchantsStyle.mainBlackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 20,
                                child: Image.asset('assets/icons/address.png'),
                              ),
                              Text(
                                couponAddress,
                                style: TextStyle(
                                  color: MerchantsStyle.mainDarkGreyColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              couponType.isNotEmpty
                                  ? Container(
                                      margin: EdgeInsets.only(right: 5),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 7,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xff999999).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        couponType,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: MerchantsStyle.mainGreenColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Text(
                                couponDiscountDescription.isNotEmpty
                                    ? couponDiscountDescription
                                    : couponType == 'Cash'
                                        ? 'HK\$$couponBaseDiscount off'
                                        : couponType == 'Discount'
                                            ? '$couponPercentageDiscount% off'
                                            : couponDiscountDescription,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: MerchantsStyle.mainGreenColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 49),
                          child: Text(
                            'Require $couponRewardCoins',
                            style: TextStyle(
                              fontSize: 15,
                              color: MerchantsStyle.mainDarkGreyColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 19),
                          child: Text(
                            'Usage Method',
                            style: TextStyle(
                              color: MerchantsStyle.mainBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        MerchantsCouponUsageContent(
                          content: couponDescription,
                        ),
                        MerchantsCouponUsageContent(
                          content:
                              'Usage Time: ${merchantProfile.merchant.openingPeriod}',
                        ),
                        MerchantsCouponUsageContent(
                          content:
                              'Available Data: $couponStartDate - $couponEndDate',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
