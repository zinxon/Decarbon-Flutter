import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/merchants_activity_card.dart';

class MerchantsActivitiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> dummy = [
    //   {
    //     "activity_id": "imVQUdohYDr3MRU1BpVy6n",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "name": "Test Activity5",
    //     "address": "Address",
    //     "reward_coins": 30,
    //     "photo_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1599px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-imVQUdohYDr3MRU1BpVy6n.jpg",
    //     "description": "Description",
    //     "form_of_participation": "Form of partition",
    //     "status": 1,
    //     "type": "Consump",
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-06-30T00:06:32.000Z",
    //     "updated_date": "2020-06-30T00:06:32.000Z"
    //   },
    //   {
    //     "activity_id": "rpavdRuKbpdKzXi9vXctHa",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "name": "Test Activity",
    //     "address": "Address",
    //     "reward_coins": 1,
    //     "photo_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1599px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-rpavdRuKbpdKzXi9vXctHa.jpg",
    //     "description": "Description",
    //     "form_of_participation": "Form of partition",
    //     "status": 1,
    //     "type": "Consump",
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-06-28T01:15:33.000Z",
    //     "updated_date": "2020-06-28T01:15:33.000Z"
    //   },
    //   {
    //     "activity_id": "9ztnSfd38QgW4AgjVYMyyp",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "name": "Test Activity",
    //     "address": "Address",
    //     "reward_coins": 1,
    //     "photo_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1599px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-9ztnSfd38QgW4AgjVYMyyp.jpg",
    //     "description": "Description",
    //     "form_of_participation": "Form of partition",
    //     "status": 1,
    //     "type": "Consump",
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-06-28T01:15:31.000Z",
    //     "updated_date": "2020-06-28T01:15:31.000Z"
    //   },
    //   {
    //     "activity_id": "hnCQmvg9BCiPs2ySKQdtdM",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "name": "Test Activity",
    //     "address": "Address",
    //     "reward_coins": 1,
    //     "photo_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1599px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-hnCQmvg9BCiPs2ySKQdtdM.jpg",
    //     "description": "Description",
    //     "form_of_participation": "Form of partition",
    //     "status": 1,
    //     "type": "Consump",
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-06-28T01:15:30.000Z",
    //     "updated_date": "2020-06-28T01:15:30.000Z"
    //   },
    //   {
    //     "activity_id": "xcgT4FxPsWkXPLtxu59c8q",
    //     "merchant_id": "w1jKSQDsuuyVLmAddnxfzF",
    //     "store_id": "jxLZCPUxtchmEB1pjrMdgr",
    //     "name": "Test Activity",
    //     "address": "Address",
    //     "reward_coins": 1,
    //     "photo_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1599px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    //     // "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/w1jKSQDsuuyVLmAddnxfzF/activity-xcgT4FxPsWkXPLtxu59c8q.jpg",
    //     "description": "Description",
    //     "form_of_participation": "Form of partition",
    //     "status": 1,
    //     "type": "Consump",
    //     "start_date": "2020-06-21T11:00:00.000Z",
    //     "end_date": "2021-06-23T11:00:00.000Z",
    //     "created_date": "2020-06-28T01:15:28.000Z",
    //     "updated_date": "2020-06-28T01:15:28.000Z"
    //   }
    // ];

    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // dynamic merchant =
    //     Map<String, dynamic>.of(MerchantInstance.instance.profile);
    context.bloc<MerchantsActivityBloc>()
      ..add(
        GetMerchantsActivityList(
          // merchantsId: merchantProfile['merchant']['merchant_id'],
          // storeId: merchantProfile['store']['store_id'],
          // loginId: merchantProfile['merchant']['login_id'],
          merchantsId: merchantProfile.merchant.merchantId,
          storeId: merchantProfile.store.storeId,
          loginId: merchantProfile.merchant.loginId,
          loginType: 'merchant',
        ),
      );

    return BlocBuilder<MerchantsActivityBloc, MerchantsActivityState>(
      buildWhen: (previous, current) {
        return previous is MerchantsActivityListLoading ||
            current is MerchantsActivityListLoading;
      },
      builder: (context, state) {
        if (state is MerchantsActivityListLoaded) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return MerchantsActivityCard(
                listIndex: index,
                activityData: state.result[index],
              );
            },
          );
        } else {
          return Center(
            child: PlatformCircularProgressIndicator(),
          );
        }
      },
    );
  }
}
