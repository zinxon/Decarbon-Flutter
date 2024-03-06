import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'merchants_edit_popup_menu.dart';

class MerchantsCouponCard extends StatelessWidget {
  final Map<String, dynamic> couponData;

  const MerchantsCouponCard({
    Key key,
    @required this.couponData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String couponId = couponData['coupon_id'] ?? '';
    final String couponPhotoUrl = couponData['photo_url'] ?? '';
    final String couponRequireCoins =
        (couponData['require_coins'] ?? '').toString();
    final String couponDescription = couponData['description'] ?? '';
    final String couponName = couponData['name'] ?? '';
    final String couponType = couponData['type'] ?? '';
    final String couponBaseDiscount =
        couponData['base_discount'].toString() ?? '';
    final String couponPercentageDiscount =
        couponData['percentage_discount'].toString() ?? '';
    final String couponDiscountDescription =
        couponData['coupon_discount_description'] ?? '';
    final String couponSales =
        (couponData['participation_count'] ?? '').toString();
    // final String couponSales = (couponData['total_user_redeemed_count'] ?? '').toString() ?? '';

    return GestureDetector(
      onTap: () {
        AppProvider.getRouter(context).navigateTo(
            context, "/merchants/coupon_details/${couponData['coupon_id']}",
            transition: TransitionType.inFromRight);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      couponPhotoUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: MerchantsStyle.mainGreenColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        ),
                        color: MerchantsStyle.mainGreenColor.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          '$couponRequireCoins DC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                height: 100,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            couponName,
                            style: TextStyle(
                              fontSize: 15,
                              color: MerchantsStyle.mainBlackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          child: MerchantsEditPopupMenu(
                            category: 'coupon',
                            couponId: couponId,
                            couponData: couponData,
                          ),
                        )
                      ],
                    ),
                    Text(
                      couponDescription,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff999999),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: <Widget>[
                        couponType.isNotEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                width: 80,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xff999999).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  couponType,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: MerchantsStyle.mainGreenColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        Flexible(
                          child: Text(
                            // couponType == 'Cash Coupon'
                            //   ? 'HK\$$couponBaseDiscount off'
                            //   : couponType == 'Discount Coupon'
                            //     ? '$couponPercentageDiscount% off'
                            //     : couponDiscountDescription ,
                            couponDiscountDescription.isNotEmpty
                                ? couponDiscountDescription
                                : couponType == 'Cash'
                                    ? 'HK\$$couponBaseDiscount off'
                                    : couponType == 'Discount'
                                        ? '$couponPercentageDiscount% off'
                                        : couponDiscountDescription,
                            style: TextStyle(
                              fontSize: 13,
                              color: MerchantsStyle.mainGreenColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Required $couponRequireCoins DC',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff989898),
                          ),
                        ),
                        Text(
                          'sales $couponSales',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
