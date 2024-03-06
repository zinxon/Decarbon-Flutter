import 'package:DeCarbon/ui/page/users/UsersMapPage.dart';
import 'package:DeCarbon/ui/page/users/UsersMenuPage.dart';
import 'package:DeCarbon/ui/page/users/UsersProfilePage.dart';
import 'package:flutter/material.dart';

class UsersHomePage extends StatefulWidget {
  static const String PATH = '/users/home';

  @override
  _UsersHomePageState createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  String selectedPage = 'menu';
  Color _selectedColor = Color(0xFF51B055);
  Color _unselectedColor = Colors.grey;

  Widget buildBodyView() {
    if (selectedPage == 'menu') {
      return UsersMenuPage();
    } else if (selectedPage == 'map') {
      return UsersMapPage();
    } else if (selectedPage == 'profile') {
      return UsersProfilePage();
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
                    buildBottomNavigationBarIndicator('map'),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ImageIcon(
                        AssetImage('assets/icons/map.png'),
                        size: 32,
                        color: selectedPage == 'map'
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedPage = 'map';
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
