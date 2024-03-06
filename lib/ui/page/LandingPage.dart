import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:DeCarbon/ui/page/HomePage.dart';
import 'package:DeCarbon/ui/page/WalkthroughPage.dart';
import 'package:DeCarbon/ui/page/LoginPage.dart';

final Map<String, AssetImage> images = {
  "logo": AssetImage('assets/images/logo.png'),
};

class LandingPage extends StatefulWidget {
  static const String PATH = '/landing';

  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    super.dispose();
  }

  void _init() {
    _prefs.then((SharedPreferences prefs) {
      String initialRoute = prefs.getString('initialRoute');
      Future.delayed(const Duration(milliseconds: 2000), () {
        switch (initialRoute) {
          case HomePage.PATH:
            {
              Navigator.pushReplacementNamed(context, HomePage.PATH);
              break;
            }
          case WalkthroughPage.PATH:
            {
              Navigator.pushReplacementNamed(context, WalkthroughPage.PATH);
              break;
            }
          case LoginPage.PATH:
            {
              Navigator.pushReplacementNamed(context, LoginPage.PATH);
              break;
            }
          default:
            {
              break;
            }
        }
      });
    });
  }

  // --------------------------------- Widget ---------------------------------
  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Image(
          image: images['logo'],
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 4,
        ),
      ),
    ));
  }
  // --------------------------------- Widget ---------------------------------
}
