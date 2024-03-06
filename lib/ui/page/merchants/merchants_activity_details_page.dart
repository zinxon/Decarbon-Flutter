import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';

import 'bloc/merchants_activity_bloc.dart';
import 'components/merchants_common_detail_content.dart';
import 'components/merchants_common_title.dart';
import 'components/merchants_edit_popup_menu.dart';
import 'components/merchants_loading_dialog.dart';
import 'components/merchants_success_dialog.dart';
import 'components/merchants_unsuccess_dialog.dart';
import 'merchants_home_page.dart';

class MerchantsActivityDetailsPage extends StatelessWidget {
  static const String PATH = '/merchants/activity_details/:activity_id';

  final String activityId;

  const MerchantsActivityDetailsPage({
    Key key,
    @required this.activityId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // dynamic merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
    context.bloc<MerchantsActivityBloc>()
      ..add(
        GetMerchantsActivityDetails(
          // merchantsId : merchantProfile['merchant']['merchant_id'],
          // storeId: merchantProfile['store']['store_id'],
          // loginId: merchantProfile['merchant']['login_id'],
          merchantsId: merchantProfile.merchant.merchantId,
          storeId: merchantProfile.store.storeId,
          loginId: merchantProfile.merchant.loginId,
          loginType: 'merchant',
          activityId: activityId,
        ),
      );

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

    return BlocListener<MerchantsActivityBloc, MerchantsActivityState>(
      listenWhen: (previous, current) {
        return (previous is MerchantsActivityDeleteLoading ||
            current is MerchantsActivityDeleteLoading);
      },
      listener: (context, state) {
        if (state is MerchantsActivityDeleteLoading) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return BlocBuilder<MerchantsActivityBloc, MerchantsActivityState>(
                buildWhen: (previous, current) {
                  return (previous is MerchantsActivityDeleteLoading ||
                      current is MerchantsActivityDeleteLoading);
                },
                builder: (context, state) {
                  if (state is MerchantsActivityDeleteError) {
                    return MerchantsUnsuccessDialog(
                      actionName: 'deleted',
                      okOnPressed: () {
                        getActivityList();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is MerchantsActivityDeleteLoaded) {
                    return MerchantsSuccessDialog(
                      actionName: 'deleted',
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
            'Activity Details',
            style: TextStyle(
              color: MerchantsStyle.mainBlackColor,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            BlocBuilder<MerchantsActivityBloc, MerchantsActivityState>(
              buildWhen: (previous, current) {
                return (previous is MerchantsActivityDetailsLoading ||
                    current is MerchantsActivityDetailsLoading);
              },
              builder: (context, state) {
                if (state is MerchantsActivityDetailsLoaded) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: MerchantsEditPopupMenu(
                      category: 'activity',
                      activityId: activityId,
                      activityData: state.result,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        body: BlocBuilder<MerchantsActivityBloc, MerchantsActivityState>(
          buildWhen: (previous, current) {
            return (previous is MerchantsActivityDetailsLoading ||
                current is MerchantsActivityDetailsLoading);
          },
          builder: (context, state) {
            if (state is MerchantsActivityDetailsLoaded) {
              final String activityPhotoUrl = state.result['photo_url'] ?? '';
              final String activityType = state.result['type'] ?? '';
              final String activityFormOfParticipation =
                  state.result['form_of_participation'] ?? '';
              final String activtiyName = state.result['name'] ?? '';
              final String activityStartDate = DateFormat('yyyy/MM/dd')
                      .format(DateTime.tryParse(state.result['start_date'])) ??
                  '';
              final String activityEndDate = DateFormat('yyyy/MM/dd')
                      .format(DateTime.tryParse(state.result['end_date'])) ??
                  '';
              final String activityDescription =
                  state.result['description'] ?? '';
              final String activityRewardCoins =
                  '${(state.result['reward_coins'] ?? '').toString()}DC';

              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                children: <Widget>[
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(bottom: 21),
                    decoration: BoxDecoration(
                        color: MerchantsStyle.mainGreenColor,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(
                              activityPhotoUrl,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 21),
                    child: Text(
                      '\u2003 $activityDescription',
                      style: TextStyle(
                        color: MerchantsStyle.mainDarkGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 21),
                    child: Divider(),
                  ),
                  MerchantsCommonTitle(
                    title: 'Activity Type',
                  ),
                  MerchantsCommonDetailContent(
                    content: activityType,
                  ),
                  MerchantsCommonTitle(
                    title: 'Activity Name',
                  ),
                  MerchantsCommonDetailContent(
                    content: activtiyName,
                  ),
                  MerchantsCommonTitle(
                    title: 'Activity Date',
                  ),
                  MerchantsCommonDetailContent(
                    content: '$activityStartDate - $activityEndDate',
                  ),
                  MerchantsCommonTitle(
                    title: 'Form of participation',
                  ),
                  MerchantsCommonDetailContent(
                    content: activityFormOfParticipation,
                  ),
                  MerchantsCommonTitle(
                    title: 'Reward Points',
                  ),
                  MerchantsCommonDetailContent(
                    content: activityRewardCoins,
                  ),
                  MerchantsCommonTitle(
                    title: 'Organizer',
                  ),
                  MerchantsCommonDetailContent(
                    // content: merchant['merchant']['name'] ?? '',
                    content: merchantProfile.merchant.name ?? '',
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
