import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_coupon_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/merchants_coupon_bloc.dart';
import 'components/merchants_common_date_range_picker.dart';
import 'components/merchants_common_dropdown_button.dart';
import 'components/merchants_common_text_field.dart';
import 'components/merchants_common_title.dart';
import 'components/merchants_image_picker_field.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';

class MerchantsEditCouponPage extends StatefulWidget {
  static const String PATH = '/merchants/edit_coupon/:coupon_id';
  final String couponId;

  const MerchantsEditCouponPage({Key key, @required this.couponId})
      : super(key: key);

  @override
  _MerchantsEditCouponPageState createState() =>
      _MerchantsEditCouponPageState();
}

class _MerchantsEditCouponPageState extends State<MerchantsEditCouponPage> {
  var arguments;

  final List<String> couponTypeOptions = <String>[
    'Discount',
    'Cash',
    'Exchange',
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController redeemPointsController = TextEditingController();
  TextEditingController baseDiscountController = TextEditingController();
  TextEditingController percentageDiscountController = TextEditingController();
  TextEditingController discountDescriptionController = TextEditingController();

  String selectedImageBase64;
  String couponType;
  String couponStartDate;
  String couponEndDate;
  String couponPhotoUrl;

  // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
  final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
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

  void getCouponDetail() {
    return context.bloc<MerchantsCouponBloc>().add(
          GetMerchantsCouponDetails(
            // merchantsId: merchant['merchant']['merchant_id'],
            // storeId: merchant['store']['store_id'],
            // loginId: merchant['merchant']['login_id'],
            merchantsId: merchantProfile.merchant.merchantId,
            storeId: merchantProfile.store.storeId,
            loginId: merchantProfile.merchant.loginId,
            loginType: 'merchant',
            couponId: widget.couponId,
          ),
        );
  }

  @override
  void didChangeDependencies() {
    arguments = ModalRoute.of(context).settings.arguments;
    couponPhotoUrl = arguments['coupon']['photo_url'] ?? '';
    couponType = arguments['coupon']['type'] ?? couponTypeOptions[0];
    titleController =
        TextEditingController(text: arguments['coupon']['name'] ?? '');
    descriptionController =
        TextEditingController(text: arguments['coupon']['description'] ?? '');
    redeemPointsController = TextEditingController(
        text: arguments['coupon']['require_coins'].toString() ?? '');
    baseDiscountController = TextEditingController(
        text: arguments['coupon']['base_discount'].toString() ?? '');
    percentageDiscountController = TextEditingController(
        text: arguments['coupon']['percentage_discount'].toString() ?? '');
    discountDescriptionController = TextEditingController(
        text: arguments['coupon']['coupon_discount_description'] ?? '');
    couponStartDate = arguments['coupon']['start_date'] ?? '';
    couponEndDate = arguments['coupon']['end_date'] ?? '';

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    titleController?.dispose();
    descriptionController?.dispose();
    redeemPointsController?.dispose();
    super.dispose();
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
          'Edit Coupon',
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            child: Center(
              child: Text(
                'Done',
                style: TextStyle(
                  color: MerchantsStyle.mainGreenColor,
                  fontSize: 15,
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return MerchantsLoadingDialog();
                  });
              MerchantsCouponRepository.updateSpecificCoupon(data: {
                "coupon_id": widget.couponId,
                // "merchant_id": merchant['merchant']['merchant_id'],
                // "store_id": merchant['store']['store_id'],
                // "login_id": merchant['merchant']['login_id'],
                "merchant_id": merchantProfile.merchant.merchantId,
                "store_id": merchantProfile.store.storeId,
                "login_id": merchantProfile.merchant.loginId,
                "login_type": "merchant",
                "name": titleController.text,
                "description": descriptionController.text,
                "generated_reason": couponType,
                "require_coins": redeemPointsController.text,
                "status": "1",
                "type": couponType,
                "base_discount":
                    couponType == 'Cash' ? baseDiscountController.text : '0',
                "percentage_discount": couponType == 'Discount'
                    ? percentageDiscountController.text
                    : '0',
                "coupon_discount_description":
                    discountDescriptionController.text,
                "start_date": DateFormat('yyyy/MM/dd HH:mm:ss')
                    .format(DateTime.tryParse(couponStartDate)),
                "end_date": DateFormat('yyyy/MM/dd HH:mm:ss')
                    .format(DateTime.tryParse(couponEndDate)),
                "image": selectedImageBase64 ?? ''
              }).then((response) {
                if (response.statusCode < 200 || response.statusCode > 299) {
                  Navigator.pop(context);
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return MerchantsUnsuccessDialog(
                          actionName: 'updated',
                          okOnPressed: () {
                            Navigator.popUntil(
                                context,
                                ModalRoute.withName(
                                    '/merchants/edit_coupon/${widget.couponId}'));
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
                            actionName: 'updated',
                            okOnPressed: () {
                              imageCache.clear();
                              getCouponDetail();
                              getCouponList();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              // Navigator.popUntil(context, ModalRoute.withName('/merchants/coupon_details/${widget.couponId}'));
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
                            actionName: 'updated',
                            okOnPressed: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      '/merchants/edit_coupon/${widget.couponId}'));
                            },
                          );
                        });
                  }
                }
              });
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: <Widget>[
          MerchantsCommonTitle(
            title: 'Image',
          ),
          MerchantsImagePickerField(
            imagePlaceholderUrl: couponPhotoUrl,
            onImageSelected: ({imageBase64}) {
              setState(() {
                selectedImageBase64 = imageBase64;
              });
            },
          ),
          MerchantsCommonTitle(
            title: 'Coupon Type',
          ),
          MerchantsCommonDropdownButton(
            dropdownPlaceholder: couponType,
            dropdownItems: couponTypeOptions,
            onDropdownValueChanged: ({newValue}) {
              setState(() {
                couponType = newValue;
                // percentageDiscountController.clear();
                // baseDiscountController.clear();
                // discountDescriptionController.clear();
              });
            },
          ),
          MerchantsCommonTitle(
            title: 'Title',
          ),
          MerchantsCommonTextField(
            controller: titleController,
          ),
          MerchantsCommonTitle(
            title: 'Description',
          ),
          MerchantsCommonTextField(
            controller: descriptionController,
          ),
          MerchantsCommonTitle(
            title: 'Redeem Points',
          ),
          MerchantsCommonTextField(
            keyboardType: TextInputType.number,
            controller: redeemPointsController,
          ),
          couponType == 'Cash'
              ? Column(
                  children: <Widget>[
                    MerchantsCommonTitle(
                      title: 'Base Discount',
                    ),
                    MerchantsCommonTextField(
                      onChanged: (value) {
                        setState(() {
                          discountDescriptionController.text =
                              'HK\$${baseDiscountController.text} off';
                        });
                      },
                      keyboardType: TextInputType.number,
                      controller: baseDiscountController,
                    ),
                  ],
                )
              : Container(),
          couponType == 'Discount Coupon'
              ? Column(
                  children: <Widget>[
                    MerchantsCommonTitle(
                      title: 'Percentage Discount',
                    ),
                    MerchantsCommonTextField(
                      onChanged: (value) {
                        setState(() {
                          discountDescriptionController.text =
                              'HK\$${percentageDiscountController.text} off';
                        });
                      },
                      keyboardType: TextInputType.number,
                      controller: percentageDiscountController,
                    ),
                  ],
                )
              : Container(),
          MerchantsCommonTitle(
            title: 'Discount Description',
          ),
          MerchantsCommonTextField(
            controller: discountDescriptionController,
          ),
          MerchantsCommonTitle(
            title: 'Available Date',
          ),
          MerchantsCommonDateRangePicker(
            dateRangePlaceholder:
                '${DateFormat('yyyy/MM/dd').format(DateTime.tryParse(couponStartDate))} - ${DateFormat('yyyy/MM/dd').format(DateTime.tryParse(couponEndDate))}',
            onDateRangeChanged: ({startDate, endDate}) {
              setState(() {
                couponStartDate = startDate;
                couponEndDate = endDate;
              });
            },
          ),
        ],
      ),
    );
  }
}
