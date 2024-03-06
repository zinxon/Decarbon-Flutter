import 'package:DeCarbon/api/merchants/merchants_activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Merchants_menu_page.dart';
import 'bloc/merchants_activity_bloc.dart';
import 'bloc/merchants_coupon_bloc.dart';
import 'merchants_profile_page.dart';

class MerchantsHomePage extends StatefulWidget {
  static const String PATH = '/merchants';

  MerchantsHomePage({Key key}) : super(key: key);
  @override
  _MerchantsHomePageState createState() => _MerchantsHomePageState();
}

class _MerchantsHomePageState extends State<MerchantsHomePage> {
  String selectedPage = 'menu';
  Color _selectedColor = Color(0xFF51B055);
  Color _unselectedColor = Colors.grey;

  Widget buildBodyView() {
    if (selectedPage == 'menu') {
      return MerchantsMenuPage();
    } else if (selectedPage == 'profile') {
      return MerchantsProfilePage();
    } else {
      return Container();
    }
  }

  Widget buildBottomNavigationBarIndicator(String currentView) {
    if (selectedPage == currentView) {
      return Container(
        width: 24,
        height: 3,
        color: _selectedColor,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyView(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 49,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    buildBottomNavigationBarIndicator('menu'),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ImageIcon(
                        AssetImage('assets/icons/home.png'),
                        size: 32,
                        color: selectedPage == 'menu'
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedPage = 'menu';
                  });
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    buildBottomNavigationBarIndicator('profile'),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ImageIcon(
                        AssetImage('assets/icons/profile.png'),
                        size: 32,
                        color: selectedPage == 'profile'
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedPage = 'profile';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
