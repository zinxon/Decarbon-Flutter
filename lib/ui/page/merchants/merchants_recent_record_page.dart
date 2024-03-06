import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_record_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_record_detail_page.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  dynamic expandedValue;
  dynamic headerValue;
  bool isExpanded;
}

class MerchantsRecentRecordPage extends StatelessWidget {
  static const String PATH = '/merchants/recent_records';

  // final dummy = [
  //   {
  //     "record_id": 17,
  //     "date": "2020/07/12 10:32",
  //     "coins": 30,
  //     "type": "activity",
  //     "status": 1,
  //     "user_first_name": "Man Kit",
  //     "user_last_name": "LAM",
  //     "parsed_type": "Consump",
  //     "name": "Test Activity5",
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 16,
  //     "date": "2020/07/12 10:28",
  //     "coins": 10,
  //     "type": "coins",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Add Coins",
  //     "name": "Add Coins - (Tit, Kit)",
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 15,
  //     "date": "2020/07/12 10:27",
  //     "coins": -30,
  //     "type": "coupon",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Merchandise coupon",
  //     "name": "Test Coupon",
  //     "parsed_status": "Not used"
  //   },
  //   {
  //     "record_id": 14,
  //     "date": "2020/07/05 00:59",
  //     "coins": 30,
  //     "type": "activity",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Consump",
  //     "name": "Test Activity5",
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 12,
  //     "date": "2020/07/05 00:57",
  //     "coins": 1,
  //     "type": "activity",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": null,
  //     "name": null,
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 11,
  //     "date": "2020/07/05 00:37",
  //     "coins": 1,
  //     "type": "activity",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": null,
  //     "name": null,
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 9,
  //     "date": "2020/07/03 23:26",
  //     "coins": -30,
  //     "type": "coupon",
  //     "status": 0,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Merchandise coupon",
  //     "name": "Test Coupon",
  //     "parsed_status": "Used"
  //   },
  //   {
  //     "record_id": 3,
  //     "date": "2020/06/28 01:53",
  //     "coins": 10,
  //     "type": "coins",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Add Coins",
  //     "name": "Add Coins - (Tit, Kit)",
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 2,
  //     "date": "2020/06/28 01:53",
  //     "coins": 10,
  //     "type": "coins",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Add Coins",
  //     "name": "Add Coins - (Tit, Kit)",
  //     "parsed_status": "Done"
  //   },
  //   {
  //     "record_id": 1,
  //     "date": "2020/06/28 01:53",
  //     "coins": 10,
  //     "type": "coins",
  //     "status": 1,
  //     "user_first_name": "Tit",
  //     "user_last_name": "Kit",
  //     "parsed_type": "Add Coins",
  //     "name": "Add Coins - (Tit, Kit)",
  //     "parsed_status": "Done"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    final MerchantProfile merchantProfile = MerchantInstance.instance.profile;
    // var merchant = Map<String, dynamic>.of(MerchantInstance.instance.profile);
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
          'My Recent Record',
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: MerchantsRecordRepository.getMerchantRecords(
            // merchantsId: merchant['merchant']['merchant_id'],
            // storeId: merchant['store']['store_id'],
            // loginId: merchant['merchant']['login_id'],
            merchantsId: merchantProfile.merchant.merchantId,
            storeId: merchantProfile.store.storeId,
            loginId: merchantProfile.merchant.loginId,
            loginType: 'merchant',
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: PlatformCircularProgressIndicator());
            } else {
              if (snapshot.data.data['success']) {
                var newRecordList = [];
                var newRecordMap;
                newRecordMap = groupBy(
                    snapshot.data.data['result'],
                    (obj) => DateFormat('yyyy/MM').format(
                        DateFormat("yyyy/MM/dd HH:mm").parse(obj['date'])));
                newRecordMap.forEach((key, value) => newRecordList.add(Item(
                      headerValue: key,
                      expandedValue: value,
                      isExpanded: false,
                    )));
                return StatefulBuilder(builder: (context, setState) {
                  return ListView(
                      children: newRecordList.map<Widget>((dynamic item) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        item.isExpanded = !item.isExpanded;
                      }),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: item.isExpanded ? null : 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                title: Text(
                                  item.headerValue,
                                  style: TextStyle(
                                    color: MerchantsStyle.mainBlackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: item.isExpanded
                                    ? Icon(Icons.expand_less)
                                    : Icon(Icons.expand_more)),
                            item.isExpanded
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 23),
                                    child: Column(
                                        children: item.expandedValue
                                            .map<Widget>((dynamic record) {
                                      return GestureDetector(
                                        onTap: () {
                                          print(record);
                                          Navigator.pushNamed(context,
                                              MerchantsRecordDetailPage.PATH,
                                              arguments: {
                                                'data': record,
                                              });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 11),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 2,
                                                // margin: EdgeInsets.only(right: 23),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      record['coins'] > 0
                                                          ? MerchantsStyle
                                                              .mainGreenColor
                                                          : MerchantsStyle
                                                              .mainRedColor,
                                                  maxRadius: 7,
                                                  child: record['coins'] > 0
                                                      ? Icon(Icons.add,
                                                          size: 10)
                                                      : Icon(Icons.remove,
                                                          size: 10),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                // margin: EdgeInsets.only(right: 31),
                                                child: Text(
                                                  record['coins']
                                                      .abs()
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: record['coins'] > 0
                                                          ? MerchantsStyle
                                                              .mainGreenColor
                                                          : MerchantsStyle
                                                              .mainRedColor),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      record['name'] ?? '',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 3),
                                                          child: Text(
                                                            record['date'],
                                                            style: TextStyle(
                                                              color: MerchantsStyle
                                                                  .mainDarkGreyColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 2),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: MerchantsStyle
                                                                .mainGreenColor
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                          child: Text(
                                                            record['parsed_type'] ??
                                                                '',
                                                            style: TextStyle(
                                                              color: MerchantsStyle
                                                                  .mainGreenColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList()),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  }).toList());
                });
              } else {
                return Center(child: PlatformCircularProgressIndicator());
              }
            }
          }),
      // body: SingleChildScrollView(
      //   child: Container(
      //     child: ExpansionPanelList(
      //       expansionCallback: (int index, bool isExpanded) {
      //         setState(() {
      //           newRecordList[index].isExpanded = !isExpanded;
      //         });
      //       },
      //       children: newRecordList.map<ExpansionPanel>((dynamic item) {
      //         print(item.expandedValue);
      //         return ExpansionPanel(
      //           isExpanded: item.isExpanded,
      //           headerBuilder: (BuildContext context, bool isExpanded) {
      //             return ListTile(
      //               title: Text(item.headerValue),
      //             );
      //           },
      //           body: Container(
      //             child: Column(
      //               children: item.expandedValue.map<Widget>((dynamic value){
      //                 return Text(value['record_id'].toString());
      //               }).toList(),
      //             ),
      //           )
      //         );
      //       }).toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
