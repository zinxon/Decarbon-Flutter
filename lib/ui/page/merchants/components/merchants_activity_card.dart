import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_qr_code_scanner_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MerchantsActivityCard extends StatelessWidget {
  final int listIndex;
  final Map<String, dynamic> activityData;

  const MerchantsActivityCard({
    Key key,
    @required this.listIndex,
    @required this.activityData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> contentBackgroundColors = [
      Color(0xff9C6337).withOpacity(0.86),
      Color(0xff2A605F).withOpacity(0.86),
    ];

    final String activityPhotoUrl = activityData['photo_url'] ?? '';
    final String activityType = activityData['type'] ?? '';
    final String activityAttendance =
        activityData['participation_count'].toString() ?? '';
    final String activtiyName = activityData['name'] ?? '';
    final String activityStartDate = DateFormat('yyyy/MM/dd')
            .format(DateTime.tryParse(activityData['start_date'])) ??
        '';
    final String activityEndDate = DateFormat('yyyy/MM/dd')
            .format(DateTime.tryParse(activityData['end_date'])) ??
        '';
    final String activityDescription = activityData['description'] ?? '';
    final String activityRewardCoins =
        (activityData['reward_coins'] ?? '').toString();

    return GestureDetector(
      onTap: () {
        AppProvider.getRouter(context).navigateTo(context,
            "/merchants/activity_details/${activityData['activity_id']}",
            transition: TransitionType.inFromRight);
      },
      child: Container(
        width: 315,
        height: 200,
        margin: EdgeInsets.only(bottom: 71),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MerchantsStyle.mainGreenColor,
            image: DecorationImage(
              image: NetworkImage(activityPhotoUrl, scale: 1.0),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          activityType,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MerchantsQrCodeScannerPage.PATH,
                              arguments: {
                                'action': 'add_user_to_activity',
                                'activity_id': activityData['activity_id'],
                                'coins': activityRewardCoins,
                                'note': activtiyName,
                              });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.only(top: 9, right: 12),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 16,
                              child: Image.asset(
                                'assets/icons/scan.png',
                                color: MerchantsStyle.mainDarkGreyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 12,
                                margin: EdgeInsets.only(right: 2),
                                child: Image.asset('assets/icons/people.png'),
                              ),
                              Text(
                                activityAttendance,
                                style: TextStyle(
                                  color: MerchantsStyle.mainGreenColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 75,
              decoration: BoxDecoration(
                color: contentBackgroundColors[listIndex % 2],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              activtiyName,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '\u2022 $activityStartDate - $activityEndDate',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '\u2022 $activityDescription',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 26,
                            height: 26,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: MerchantsStyle.mainGreenColor,
                                )),
                            child: Center(
                              child: Text(
                                'C',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: MerchantsStyle.mainGreenColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Get $activityRewardCoins DC',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
