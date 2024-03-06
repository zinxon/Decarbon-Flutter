import 'package:DeCarbon/api/users/UsersCouponRepository.dart';
import 'package:DeCarbon/ui/page/users/components/UsersCouponCard.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:location/location.dart';

class UsersCouponView extends StatefulWidget{
  @override
  _UsersCouponViewState createState() => _UsersCouponViewState();
}

class _UsersCouponViewState extends State<UsersCouponView> {
  final Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Map<String, dynamic> _couponList;


  @override
  void initState() {
    super.initState();
    location.serviceEnabled().then((value){
      if(!value){
        location.requestService().then((value){
          setState(() {
            _serviceEnabled = value;
          });
        });
      }else{
        setState(() {
          _serviceEnabled = value;
        });
      }
    });

    location.hasPermission().then((value){
      if(value == PermissionStatus.denied){
        location.requestPermission().then((value){
          setState(() {
            _permissionGranted = value;
          });
        });
      }else{
        setState(() {
          _permissionGranted = value;
        });
      }
    });

    location.getLocation().then((value){
      setState(() {
        _locationData = value;
      });
      UsersCouponRepository.getCouponList(latitude: _locationData.latitude ?? '', longitude: _locationData.longitude ?? '').then((value){
        if(value.data['success']){
          setState(() {
            _couponList = value.data['result'];
          });
        }
      });
    }).timeout(Duration(seconds: 3), onTimeout: ()=> UsersCouponRepository.getCouponList(latitude: '', longitude: '').then((value){
        if(value.data['success']){
          setState(() {
            _couponList = value.data['result'];
          });
        }
    }));
  }

  @override
  Widget build(BuildContext context) {
    if(_couponList == null){
      return Center(child: PlatformCircularProgressIndicator());
    }else{
      return ListView(
        padding: EdgeInsets.all(20),
        children: [
          for(int i = 0; i < _couponList.keys.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    _couponList.values.toList()[i]['merchant_name'],
                    style: TextStyle(
                      color: UsersStyle.mainBlackColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                Column(
                  children: [
                    for(int j = 0; j < _couponList.values.toList()[i]['data'].length; j++)
                      UsersCouponCard(couponData: _couponList.values.toList()[i]['data'][j],)
                  ],
                )
              ],
            ),
        ],
      );
    }
  }
}