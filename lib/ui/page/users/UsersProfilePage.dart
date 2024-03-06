import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/UsersEditProfilePage.dart';
import 'package:DeCarbon/ui/page/users/UsersFaqPage.dart';
import 'package:DeCarbon/ui/page/users/UsersFavoritesPage.dart';
import 'package:DeCarbon/ui/page/users/UsersMyCarbonPointsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersRecentActivityPage.dart';
import 'package:DeCarbon/ui/page/users/UsersRecentRecordPage.dart';
import 'package:DeCarbon/ui/page/users/components/UsersProfileListTile.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../LoginPage.dart';
import 'UsersMyCouponsPage.dart';
import 'bloc/userprofile_bloc.dart';

class UsersProfilePage extends StatelessWidget {
  static const String PATH = '/user/profile';

  @override
  Widget build(BuildContext context) {
    final User user = UsersInstance.instance.user;
    context.bloc<UserProfileBloc>()..add(GetUserProfile(loginId: user.loginId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Container(
              width: 20,
              child: Image.asset('assets/icons/qrcode.png'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, UsersMyCarbonPointsPage.PATH);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              child: BlocBuilder<UserProfileBloc, UserProfileState>(
                builder: (context, state) {
                  if (state is UserProfileLoaded) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 70,
                                height: 70,
                                child: CircleAvatar(
                                  backgroundColor: UsersStyle.mainGreenColor,
                                  backgroundImage: NetworkImage(
                                    state.result['photo_url'] ?? '',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.result['first_name'] +
                                              ' ' +
                                              state.result['last_name'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: UsersStyle.mainBlackColor,
                                          ),
                                        ),
                                        Text(
                                          state.result['email'],
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: UsersStyle.mainGreyColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 50,
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, UsersEditProfilePage.PATH,
                                        arguments: {'profile': state.result});
                                  },
                                  child: Container(
                                    width: 20,
                                    child: Image.asset('assets/icons/edit.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 23),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, UsersMyCarbonPointsPage.PATH);
                                },
                                child: Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My carbon points',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: UsersStyle.mainGreyColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          state.result['coins'].toString(),
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: UsersStyle.mainGreenColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                width: 1,
                                height: 58,
                                color: UsersStyle.mainGreyColor,
                              ),
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, UsersMyCouponsPage.PATH);
                                  },
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My coupons',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: UsersStyle.mainGreyColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          state.myCouponList.length.toString(),
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: UsersStyle.mainGreenColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      height: 200,
                      child: Center(
                        child: PlatformCircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/clock.png'),
            title: 'My recent record',
            onTap: () {
              Navigator.pushNamed(context, UsersRecentRecordPage.PATH);
            },
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/clock.png'),
            title: 'My recent activity',
            onTap: () {
              Navigator.pushNamed(context, UsersRecentActivityPage.PATH);
            },
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/coupon.png'),
            title: 'My coupons',
            onTap: () {
              Navigator.pushNamed(context, UsersMyCouponsPage.PATH);
            },
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/star.png'),
            title: 'Favorites',
            onTap: () {
              Navigator.pushNamed(context, UsersFavoritesPage.PATH);
            },
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/faq.png'),
            title: 'FAQ',
            onTap: () {
              Navigator.pushNamed(context, UsersFaqPage.PATH);
            },
          ),
          UsersProfileListTile(
            leadingIcon: Image.asset('assets/icons/logout.png'),
            title: 'Log out',
            onTap: () {
              Amplify.Auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.PATH, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}
