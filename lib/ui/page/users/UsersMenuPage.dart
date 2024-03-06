import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

import 'UsersActivityView.dart';
import 'UsersCouponView.dart';
import 'UsersMerchantView.dart';
import 'UsersNewsView.dart';
import 'components/UsersMenuViewTopBar.dart';

class UsersMenuPage extends StatefulWidget{
  @override
  _UsersMenuPageState createState() => _UsersMenuPageState();
}

class _UsersMenuPageState extends State<UsersMenuPage> {
  String selectedView;

  @override
  void initState() {
    selectedView = 'activity';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildView(){
      switch(selectedView){
        case 'activity':
          return UsersActivityView();
        case 'coupon':
          return UsersCouponView();
        case 'news':
          return UsersNewsView();
        case 'merchants':
          return UsersMerchantView();
        default:
          return Container();
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Decarbon',
          style: TextStyle(
            fontSize: 20,
            color: UsersStyle.mainBlackColor,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Container(),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          UsersMenuViewTopBar(
            selectedView: selectedView,
            menuViewOnChanged: ({selectedView}) {
              setState(() {
                this.selectedView = selectedView;
              });
            },
          ),
          Expanded(
            child: buildView(),
          )
        ],
      ),
    );
  }
}