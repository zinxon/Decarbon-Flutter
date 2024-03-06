import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_coupon_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_date_range_picker.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_dropdown_button.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_image_picker_field.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/merchants_common_text_field.dart';
import 'components/merchants_common_title.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsAddCouponPage extends StatefulWidget {
  static const String PATH = '/merchants/add_coupon';

  @override
  _MerchantsAddCouponPageState createState() => _MerchantsAddCouponPageState();
}

class _MerchantsAddCouponPageState extends State<MerchantsAddCouponPage> {
  final List<String> couponTypeOptions = <String>[
    'Discount',
    'Cash',
    'Exchange',
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController redeemPointsController = TextEditingController();
  // TextEditingController generatedReasonController = TextEditingController();
  TextEditingController baseDiscountController = TextEditingController();
  TextEditingController percentageDiscountController = TextEditingController();
  TextEditingController discountDescriptionController = TextEditingController();

  String selectedImageBase64;
  String couponType;
  String couponStartDate;
  String couponEndDate;

  final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
  // final dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
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

  @override
  void initState() {
    super.initState();
    couponType = couponTypeOptions[0];
  }

  @override
  void dispose() {
    titleController?.dispose();
    descriptionController?.dispose();
    redeemPointsController?.dispose();
    baseDiscountController?.dispose();
    percentageDiscountController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantsCouponBloc, MerchantsCouponState>(
      listener: (context, state) {
        if (state is MerchantsCouponUploading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return BlocBuilder<MerchantsCouponBloc, MerchantsCouponState>(
                buildWhen: (previous, current) {
                  return (previous is MerchantsCouponUploading ||
                      current is MerchantsCouponUploading);
                },
                builder: (context, state) {
                  if (state is MerchantsCouponUploadError) {
                    return MerchantsUnsuccessDialog(
                      actionName: 'added',
                      okOnPressed: () {
                        getCouponList();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is MerchantsCouponUploaded) {
                    return MerchantsSuccessDialog(
                      actionName: 'added',
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
            'Add Coupon',
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
                context.bloc<MerchantsCouponBloc>().add(
                      CreateMerchantsCoupon(postData: {
                        // "merchant_id": merchant['merchant']['merchant_id'],
                        // "store_id": merchant['store']['store_id'],
                        "merchant_id": merchantProfile.merchant.merchantId,
                        "store_id": merchantProfile.store.storeId,
                        "name": titleController.text,
                        "description": descriptionController.text,
                        "generated_reason": couponType,
                        "type": couponType,
                        "require_coins": redeemPointsController.text,
                        "status": "1",
                        "base_discount": couponType == 'Cash'
                            ? baseDiscountController.text
                            : '0',
                        "percentage_discount": couponType == 'Discount'
                            ? percentageDiscountController.text
                            : '0',
                        "coupon_discount_description":
                            discountDescriptionController.text,
                        "start_date": couponStartDate,
                        "end_date": couponEndDate,
                        "login_id": merchantProfile.merchant.loginId,
                        // "login_id": merchant['merchant']['login_id'],
                        "login_type": "merchant",
                        "image": selectedImageBase64 ?? null,
                      }),
                    );
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
              dropdownItems: couponTypeOptions,
              onDropdownValueChanged: ({newValue}) {
                setState(() {
                  couponType = newValue;
                  percentageDiscountController.clear();
                  baseDiscountController.clear();
                  discountDescriptionController.clear();
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
                                '${percentageDiscountController.text}% off';
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
              onDateRangeChanged: ({startDate, endDate}) {
                setState(() {
                  couponStartDate = startDate;
                  couponEndDate = endDate;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
