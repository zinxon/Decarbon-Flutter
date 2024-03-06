import 'package:DeCarbon/api/users/UsersMerchantRepository.dart';
import 'package:DeCarbon/ui/page/users/components/UsersMerchantCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:location/location.dart';

class UsersMerchantView extends StatefulWidget{
  @override
  _UsersMerchantViewState createState() => _UsersMerchantViewState();
}

class _UsersMerchantViewState extends State<UsersMerchantView> {
  final Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  List<dynamic> _merchantList;


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
      UsersMerchantRepository.getMerchantList(latitude: _locationData.latitude ?? '', longitude: _locationData.longitude ?? '').then((value){
        _merchantList = [];
        if(value.data['success']){
          setState(() {
            _merchantList = value.data['result'];
          });
        }
      });
    }).timeout(Duration(seconds: 3), onTimeout: ()=> UsersMerchantRepository.getMerchantList(latitude: '', longitude: '').then((value){
        _merchantList = [];
        if(value.data['success']){
          setState(() {
            _merchantList = value.data['result'];
          });
        }
    }));
  }

  @override
  Widget build(BuildContext context) {
    if(_merchantList == null){
      return Center(child: PlatformCircularProgressIndicator());
    }else{
      return ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _merchantList.length,
        itemBuilder: (context, index){
          return UsersMerchantCard(merchantData: _merchantList[index]);
        },
      );
    }
  }
}