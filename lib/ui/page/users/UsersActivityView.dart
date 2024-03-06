import 'package:DeCarbon/api/users/UsersActivityRepository.dart';
import 'package:DeCarbon/ui/page/users/components/UsersActivityCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:location/location.dart';

class UsersActivityView extends StatefulWidget{
  @override
  _UsersActivityViewState createState() => _UsersActivityViewState();
}

class _UsersActivityViewState extends State<UsersActivityView> {
  final Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  List<dynamic> _activityList;

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
      UsersActivityRepository.getActivityList(latitude: _locationData.latitude ?? '', longitude: _locationData.longitude ?? '').then((value){
        _activityList = [];
        if(value.data['success']){
          for(int i = 0; i < value.data['result'].length; i++){
            for(int j = 0; j < value.data['result'].values.toList()[i]['data'].length; j++){
              setState(() {
                _activityList.add(value.data['result'].values.toList()[i]['data'][j]);
              });
            }
          }
        }
      });
    }).timeout(Duration(seconds: 3), onTimeout: ()=> UsersActivityRepository.getActivityList(latitude: '', longitude: '').then((value){
        _activityList = [];
        if(value.data['success']){
          for(int i = 0; i < value.data['result'].length; i++){
            for(int j = 0; j < value.data['result'].values.toList()[i]['data'].length; j++){
              setState(() {
                _activityList.add(value.data['result'].values.toList()[i]['data'][j]);
              });
            }
          }
        }
      }));
  }

  @override
  Widget build(BuildContext context) {
    if(_activityList == null){
      return Center(child: PlatformCircularProgressIndicator());
    }else{
      return ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _activityList.length,
        itemBuilder: (context, index){
          return UsersActivityCard(listIndex: index, activityData: _activityList[index]);
        },
      );
    }
  }
}