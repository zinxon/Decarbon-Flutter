import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_activity_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_date_range_picker.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_dropdown_button.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_common_text_field.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_image_picker_field.dart';
import 'package:DeCarbon/ui/page/merchants/components/merchants_success_dialog.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_home_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/merchants_common_title.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';

class MerchantsAddActivityPage extends StatefulWidget {
  static const String PATH = '/merchants/add_activity';

  @override
  _MerchantsAddActivityPageState createState() =>
      _MerchantsAddActivityPageState();
}

class _MerchantsAddActivityPageState extends State<MerchantsAddActivityPage> {
  final List<String> activityTypeOptions = <String>[
    'Consumption',
    'Travel',
    'Green',
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController formOfApplicationController = TextEditingController();
  TextEditingController rewardPointsController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String selectedImageBase64;
  String activityType;
  // String activityApplicationStartDate;
  // String activityApplicationEndDate;
  String activityStartDate;
  String activityEndDate;

  final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
  // final dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
  void getActivityList() {
    return context.bloc<MerchantsActivityBloc>().add(
          GetMerchantsActivityList(
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
  void dispose() {
    titleController?.dispose();
    descriptionController?.dispose();
    rewardPointsController?.dispose();
    addressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantsActivityBloc, MerchantsActivityState>(
      listener: (context, state) {
        if (state is MerchantsActivityUploading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return BlocBuilder<MerchantsActivityBloc, MerchantsActivityState>(
                buildWhen: (previous, current) {
                  return (previous is MerchantsActivityUploading ||
                      current is MerchantsActivityUploading);
                },
                builder: (context, state) {
                  if (state is MerchantsActivityUploadError) {
                    return MerchantsUnsuccessDialog(
                      actionName: 'added',
                      okOnPressed: () {
                        getActivityList();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is MerchantsActivityUploaded) {
                    return MerchantsSuccessDialog(
                      actionName: 'added',
                      okOnPressed: () {
                        getActivityList();
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
            'Add Activity',
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
                context.bloc<MerchantsActivityBloc>().add(
                      CreateMerchantsActivity(
                        postData: {
                          "merchant_id": merchantProfile.merchant.merchantId,
                          // "merchant_id": merchant['merchant']['merchant_id'],
                          "store_id": merchantProfile.store.storeId,
                          // "store_id": merchant['store']['store_id'],
                          "name": titleController.text,
                          "address": addressController.text,
                          "login_id": merchantProfile.merchant.loginId,
                          // "login_id": merchant['merchant']['login_id'],
                          "login_type": "merchant",
                          "status": "1",
                          "type": activityType ?? activityTypeOptions[0],
                          "description": descriptionController.text,
                          "reward_coins": rewardPointsController.text,
                          // "form_of_participation":'$activityApplicationStartDate - $activityApplicationEndDate',
                          "form_of_participation":
                              formOfApplicationController.text,
                          "start_date": activityStartDate,
                          "end_date": activityEndDate,
                          "image": selectedImageBase64 ?? null,
                        },
                      ),
                    );
              },
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
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
              title: 'Type',
            ),
            MerchantsCommonDropdownButton(
              dropdownItems: activityTypeOptions,
              onDropdownValueChanged: ({newValue}) {
                setState(() {
                  activityType = newValue;
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
              title: 'Form of application',
            ),
            // MerchantsCommonDateRangePicker(
            //   onDateRangeChanged: ({startDate, endDate}) {
            //     setState(() {
            //       activityApplicationStartDate = startDate;
            //       activityApplicationEndDate = endDate;
            //     });
            //   },
            // ),
            MerchantsCommonTextField(
              controller: formOfApplicationController,
            ),
            MerchantsCommonTitle(
              title: 'Reward Points',
            ),
            MerchantsCommonTextField(
              controller: rewardPointsController,
              keyboardType: TextInputType.number,
            ),
            MerchantsCommonTitle(
              title: 'Date',
            ),
            MerchantsCommonDateRangePicker(
              onDateRangeChanged: ({startDate, endDate}) {
                setState(() {
                  activityStartDate = startDate;
                  activityEndDate = endDate;
                });
              },
            ),
            MerchantsCommonTitle(
              title: 'Address',
            ),
            MerchantsCommonTextField(
              controller: addressController,
            ),
          ],
        ),
      ),
    );
  }
}
