import 'package:DeCarbon/ui/page/merchants/components/merchants_menu_view_top_bar.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_activities_view.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_coupons_view.dart';
import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsMenuPage extends StatefulWidget {
  @override
  _MerchantsMenuPageState createState() => _MerchantsMenuPageState();
}

class _MerchantsMenuPageState extends State<MerchantsMenuPage> {
  String selectedView;

  @override
  void initState() {
    super.initState();
    selectedView = 'activity';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Menu',
          style: TextStyle(
            color: MerchantsStyle.mainBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {
              print(selectedView);
              if (selectedView == 'activity') {
                Navigator.pushNamed(context, 'merchants/add_activity');
              } else if (selectedView == 'coupon') {
                Navigator.pushNamed(context, 'merchants/add_coupon');
              }
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          MerchantsMenuViewTopBar(
            selectedView: selectedView,
            menuViewOnChanged: ({selectedView}) {
              setState(() {
                this.selectedView = selectedView;
              });
            },
          ),
          Expanded(
              child: Container(
            // margin: EdgeInsets.only(top: 40),
            child: selectedView == 'activity'
                ? MerchantsActivitiesView()
                : MerchantsCouponsView(),
          )),
        ],
      ),
    );
  }
}
