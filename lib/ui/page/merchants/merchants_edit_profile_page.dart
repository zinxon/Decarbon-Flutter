import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_profile_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/merchants_common_text_field.dart';
import 'components/merchants_common_title.dart';
import 'components/merchants_image_picker_field.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsEditProfilePage extends StatefulWidget {
  static const String PATH = '/merchants/edit_profile';

  @override
  _MerchantsEditProfilePageState createState() =>
      _MerchantsEditProfilePageState();
}

class _MerchantsEditProfilePageState extends State<MerchantsEditProfilePage> {
  Map<String, dynamic> profileData;

  TextEditingController nameController;
  TextEditingController descriptionController;
  TextEditingController addressController;
  TextEditingController tagsController;
  TextEditingController openingPeriodController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController websiteController;
  TextEditingController openriceController;
  TextEditingController facebookController;
  TextEditingController instagramController;

  String selectedImageBase64;

  // final dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
  final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
  void getMerchantProfile() {
    return context.bloc<MerchantsProfileBloc>().add(
          GetMerchantsProfile(
            // loginId: merchant['merchant']['login_id'],
            loginId: merchantProfile.merchant.loginId,
          ),
        );
  }

  @override
  void didChangeDependencies() {
    profileData = Map<String, dynamic>.from(
        ModalRoute.of(context).settings.arguments)['profile'];
    nameController =
        TextEditingController(text: profileData['merchant']['name']);
    descriptionController =
        TextEditingController(text: profileData['merchant']['description']);
    addressController =
        TextEditingController(text: profileData['merchant']['address']);
    tagsController =
        TextEditingController(text: profileData['merchant']['tags']);
    openingPeriodController =
        TextEditingController(text: profileData['merchant']['opening_period']);
    phoneController =
        TextEditingController(text: profileData['merchant']['phone']);
    emailController =
        TextEditingController(text: profileData['merchant']['email']);
    websiteController =
        TextEditingController(text: profileData['merchant']['website']);
    openriceController =
        TextEditingController(text: profileData['merchant']['openrice']);
    facebookController =
        TextEditingController(text: profileData['merchant']['facebook']);
    instagramController =
        TextEditingController(text: profileData['merchant']['instagram']);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController?.dispose();
    descriptionController?.dispose();
    addressController?.dispose();
    tagsController?.dispose();
    openingPeriodController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    websiteController?.dispose();
    openriceController?.dispose();
    facebookController?.dispose();
    instagramController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantsProfileBloc, MerchantsProfileState>(
      listener: (context, state) {
        if (state is MerchantsProfileUpdating) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return BlocBuilder<MerchantsProfileBloc, MerchantsProfileState>(
                buildWhen: (previous, current) {
                  return (previous is MerchantsProfileUpdating ||
                      current is MerchantsProfileUpdating);
                },
                builder: (context, state) {
                  if (state is MerchantsProfileUpdateError) {
                    return MerchantsUnsuccessDialog(
                      actionName: 'updated',
                      okOnPressed: () {
                        getMerchantProfile();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is MerchantsProfileUpdated) {
                    return MerchantsSuccessDialog(
                      actionName: 'updated',
                      okOnPressed: () {
                        imageCache.clear();
                        getMerchantProfile();
                        Navigator.popUntil(context,ModalRoute.withName(MerchantsHomePage.PATH));
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
            'Account',
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
                context.bloc<MerchantsProfileBloc>().add(
                      UpdateMerchantsProfile(
                        postData: {
                          // "merchant_id": merchant['merchant']['merchant_id'],
                          // "login_id": merchant['merchant']['login_id'],
                          "merchant_id": merchantProfile.merchant.merchantId,
                          "login_id": merchantProfile.merchant.loginId,
                          "name": nameController.text,
                          "address": addressController.text,
                          "phone": phoneController.text,
                          "opening_period": openingPeriodController.text,
                          "email": emailController.text,
                          "description": descriptionController.text,
                          "website": websiteController.text,
                          "openrice": openriceController.text,
                          "instagram": instagramController.text,
                          "facebook": facebookController.text,
                          "tags": tagsController.text.split(',').toList(),
                          "business_registration_number": "",
                          "latitude": "",
                          "longitude": "",
                          // "store_id": merchant['store']['store_id'],
                          "store_id": merchantProfile.store.storeId,
                          "image": selectedImageBase64 ?? "",
                        },
                      ),
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
              imagePlaceholderUrl: profileData['merchant']['photo_url'] ?? '',
              onImageSelected: ({imageBase64}) {
                setState(() {
                  selectedImageBase64 = imageBase64;
                });
              },
            ),
            MerchantsCommonTitle(
              title: 'Name',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['name'] ?? '',
              controller: nameController,
            ),
            MerchantsCommonTitle(
              title: 'Address',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['address'] ?? '',
              controller: addressController,
            ),
            MerchantsCommonTitle(
              title: 'Tags',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['tags'] ?? '',
              controller: tagsController,
            ),
            MerchantsCommonTitle(
              title: 'Opening Period',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['opening_period'] ?? '',
              controller: openingPeriodController,
            ),
            MerchantsCommonTitle(
              title: 'Phone',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['phone'] ?? '',
              controller: phoneController,
            ),
            MerchantsCommonTitle(
              title: 'Email',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['email'] ?? '',
              controller: emailController,
            ),
            MerchantsCommonTitle(
              title: 'Website',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['website'] ?? '',
              controller: websiteController,
            ),
            MerchantsCommonTitle(
              title: 'OpenRice',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['openrice'] ?? '',
              controller: openriceController,
            ),
            MerchantsCommonTitle(
              title: 'Facebook',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['facebook'] ?? '',
              controller: facebookController,
            ),
            MerchantsCommonTitle(
              title: 'Instagram',
            ),
            MerchantsCommonTextField(
              // placeholderText: profileData['merchant']['instagram'] ?? '',
              controller: instagramController,
            ),
          ],
        ),
      ),
    );
  }
}
