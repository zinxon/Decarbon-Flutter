import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_activity_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/merchants_activity_bloc.dart';
import 'components/merchants_common_date_range_picker.dart';
import 'components/merchants_common_dropdown_button.dart';
import 'components/merchants_common_text_field.dart';
import 'components/merchants_common_title.dart';
import 'components/merchants_image_picker_field.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';

class MerchantsEditActivityPage extends StatefulWidget {
  static const String PATH = '/merchants/edit_activity/:activity_id';
  final String activityId;

  const MerchantsEditActivityPage({
    Key key,
    @required this.activityId,
  }) : super(key: key);

  @override
  _MerchantsEditActivityPageState createState() =>
      _MerchantsEditActivityPageState();
}

class _MerchantsEditActivityPageState extends State<MerchantsEditActivityPage> {
  var arguments;

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
  String activityStartDate;
  String activityEndDate;
  String activityPhotoUrl;

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

  void getActivityDetail() {
    context.bloc<MerchantsActivityBloc>().add(
          GetMerchantsActivityDetails(
            // merchantsId: merchant['merchant']['merchant_id'],
            // storeId: merchant['store']['store_id'],
            // loginId: merchant['merchant']['login_id'],
            merchantsId: merchantProfile.merchant.merchantId,
            storeId: merchantProfile.store.storeId,
            loginId: merchantProfile.merchant.loginId,
            loginType: 'merchant',
            activityId: widget.activityId,
          ),
        );
  }

  @override
  void didChangeDependencies() {
    arguments = ModalRoute.of(context).settings.arguments;
    activityPhotoUrl = arguments['activity']['photo_url'] ?? '';
    activityType = arguments['activity']['type'] ?? activityTypeOptions[0];
    titleController =
        TextEditingController(text: arguments['activity']['name'] ?? '');
    descriptionController =
        TextEditingController(text: arguments['activity']['description'] ?? '');
    formOfApplicationController = TextEditingController(
        text: arguments['activity']['form_of_participation'] ?? '');
    rewardPointsController = TextEditingController(
        text: arguments['activity']['reward_coins'].toString() ?? '');
    activityStartDate = arguments['activity']['start_date'] ?? '';
    activityEndDate = arguments['activity']['end_date'] ?? '';
    addressController =
        TextEditingController(text: arguments['activity']['address'] ?? '');
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
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
          'Edit',
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
              MerchantsActivityRepository.updateSpecificActivity(data: {
                "activity_id": widget.activityId,
                // "merchant_id": merchant['merchant']['merchant_id'],
                // "store_id": merchant['store']['store_id'],
                // "login_id": merchant['merchant']['login_id'],
                "merchant_id": merchantProfile.merchant.merchantId,
                "store_id": merchantProfile.store.storeId,
                "login_id": merchantProfile.merchant.loginId,
                "login_type": "merchant",
                "name": titleController.text,
                "address": addressController.text,
                "status": "1",
                "type": activityType,
                "description": descriptionController.text,
                "reward_coins": rewardPointsController.text,
                "form_of_participation": formOfApplicationController.text,
                "start_date": DateFormat('yyyy/MM/dd HH:mm:ss')
                    .format(DateTime.tryParse(activityStartDate)),
                "end_date": DateFormat('yyyy/MM/dd HH:mm:ss')
                    .format(DateTime.tryParse(activityEndDate)),
                "image": selectedImageBase64 ?? '',
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
                                    '/merchants/edit_activity/${widget.activityId}'));
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
                              getActivityDetail();
                              getActivityList();
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      '/merchants/activity_details/${widget.activityId}'));
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
                                      '/merchants/edit_activity/${widget.activityId}'));
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
            imagePlaceholderUrl: activityPhotoUrl,
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
            dropdownPlaceholder: activityType,
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
            dateRangePlaceholder:
                '${DateFormat('yyyy/MM/dd').format(DateTime.tryParse(activityStartDate))} - ${DateFormat('yyyy/MM/dd').format(DateTime.tryParse(activityEndDate))}',
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
    );
  }
}
