import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/bloc/userfavourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/UsersMerchantCard.dart';
import 'style/UsersStyle.dart';

class UsersFavoritesPage extends StatelessWidget{
  static const String PATH = '/user/favorites';
  final Map<String, dynamic> dummy = {
    "success": true,
    "result": [
      {
        "merchant_id": "fMn6HhoqPKDwURzwB3kfLM",
        "store_id": "s8bHkttCeMXpeLFuwDkdCJ",
        "photo_url": "https://decarbon-dev.s3.us-east-2.amazonaws.com/merchant/fMn6HhoqPKDwURzwB3kfLM/coverpic.png",
        "store_name": "Second Store",
        "name": "Tim Restaurant",
        "address": "Address",
        "description": "Description",
        "opening_period": "09:00-17:00"
      },
      {
        "merchant_id": "fMn6HhoqPKDwURzwB3kfLM",
        "store_id": "s8bHkttCeMXpeLFuwDkdCJ",
        "photo_url": "https://media.glassdoor.com/l/70/77/9f/3f/mcdonalds.jpg",
        "store_name": "Second Store",
        "name": "Tim Restaurant",
        "address": "Address",
        "description": "Description",
        "opening_period": "09:00-17:00"
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    final User userProfile = UsersInstance.instance.user;
    context.bloc<UserFavouriteBloc>().add(GetUserFavouriteList(userId: userProfile.userId, loginId: userProfile.loginId));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: UsersStyle.mainGreenColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: UsersStyle.mainBlackColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<UserFavouriteBloc, UserFavouriteState>(
        builder: (context, state){
          if(state is UserFavouriteListLoaded){
            List<dynamic> favouriteList = state.result;
            // List<dynamic> favouriteList = dummy['result'];
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              children: favouriteList.map((e) => UsersMerchantCard(merchantData: e)).toList()
            );
          }else{
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
    );
  }
}