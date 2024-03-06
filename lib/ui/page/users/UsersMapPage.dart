import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/UsersMerchantRepository.dart';
import 'package:DeCarbon/ui/page/users/components/UsersMapMerchantCard.dart';
import 'package:DeCarbon/ui/page/users/components/UsersMapShopList.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UsersMapPage extends StatefulWidget {
  static const PATH = '/users/map';
  UsersMapPage({Key key}) : super(key: key);

  @override
  _UsersMapPageState createState() => _UsersMapPageState();
}

class _UsersMapPageState extends State<UsersMapPage> {
  final defaultPosition = {
    'latitude': 22.3402,
    'longitude': 114.1797,
  };

  bool showShopList;

  Position _position;
  Widget _mapWidget;
  Widget _shopDetailWidget;
  Widget _shopListWidget;
  CameraPosition _initialPosition;

  Set<Marker> markers = {};
  BitmapDescriptor markerIcon;

  @override
  void initState() {
    super.initState();
    showShopList = false;

    _mapWidget = SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    );
    _shopDetailWidget = Container();
    initPosition();
  }

  getCurrentPosition() async {
    Position res;
    res = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).timeout(Duration(seconds: 2),onTimeout: (){
      return Position(latitude: defaultPosition['latitude'], longitude: defaultPosition['longitude']);
    });
    print(res);

    await initMarkers(_position.latitude ?? defaultPosition['latitude'], _position.longitude ?? defaultPosition['longitude']);

    setState(() {
      _position = res;
    });
  }

  Future<void> getPermission() async {}

  void initPosition() async {
    _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(_position == null) _position = Position(latitude: defaultPosition['latitude'], longitude: defaultPosition['longitude']);
    _initialPosition = CameraPosition(
      target: LatLng(_position.latitude, _position.longitude),
      zoom: 15,
    );

    await initMarkers(_position.latitude ?? defaultPosition['latitude'], _position.longitude ?? defaultPosition['longitude']);

    setState(() {
      _mapWidget = mapWidget();
    });
  }

  Future<void> initMarkers(double lat, double long) async{
    markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),'assets/icons/marker.png');
    final merchantsResponse = await UsersMerchantRepository.getMapOfMerchantList(latitude: lat, longitude: long, distance: 1000);
    
    if(merchantsResponse!= null && merchantsResponse.data['success']){
      // init markers
      for(int i = 0; i < merchantsResponse.data['result'].length; i++){
        final Map<String, dynamic> merchantData = merchantsResponse.data['result'][i];
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId(merchantData['merchant_id']),
              position: LatLng(merchantData['latitude'], merchantData['longitude']),
              icon: markerIcon,
              onTap: (){
                setState(() {
                  _shopDetailWidget = UsersMapMerchantCard(merchantData: merchantData);
                });
              }
            ),
          );
        });
      }
      // init shop list
      setState(() {
        _shopListWidget = UsersMapShopList(
          merchantData: merchantsResponse.data['result'], 
          collapseOnTap: (){
            setState(() {
              showShopList = false;
            });
          },
          shopOnTap: (i){
            setState(() {
              showShopList = false;
              _shopDetailWidget = UsersMapMerchantCard(merchantData: merchantsResponse.data['result'][i]);
            });
            _controller.animateCamera(CameraUpdate.newLatLng(LatLng(merchantsResponse.data['result'][i]['latitude'], merchantsResponse.data['result'][i]['longitude'],)));
          }
        );
      });
    }
  }

  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    String time = 'morning';
    if(DateTime.now().hour >= 6 && DateTime.now().hour < 12){
      time = 'morning';
    }else if(DateTime.now().hour >= 12 && DateTime.now().hour < 18){
      time = 'afternoon';
    }else{
      time = 'evening';
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _mapWidget,
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Color(0xffF5F2F2).withOpacity(0.8),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Good $time, ',
                          style: TextStyle(
                            color: UsersStyle.mainGreenColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          UsersInstance.instance.user.firstName,
                          style: TextStyle(
                            color: UsersStyle.mainBlackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Find your nearby coupon and activity',
                    style: TextStyle(
                      color: UsersStyle.mainGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                showShopList ? _shopListWidget : Container(),
                !showShopList ? Container(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    shape: CircleBorder(),
                    color: UsersStyle.mainGreenColor,
                    child: Container(
                      width: 20,
                      child: Image.asset('assets/icons/list.png', color: Colors.white)
                    ),
                    onPressed: () async{
                      setState(() {
                        showShopList = true;
                        _shopDetailWidget = Container();
                      });
                    },
                  ),
                ) : Container(),
                !showShopList ? Container(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    shape: CircleBorder(),
                    color: UsersStyle.mainGreenColor,
                    child: Container(
                      child: Icon(Icons.near_me, color: Colors.white,)
                    ),
                    onPressed: () async{
                      await getCurrentPosition();
                      _controller.animateCamera(CameraUpdate.newLatLng(LatLng(_position.latitude, _position.longitude,)));

                      setState(() {
                        _shopDetailWidget = Container();
                      });
                    },
                  ),
                ) : Container(),
                _shopDetailWidget,
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(_position.latitude, _position.longitude),
        zoom: 15,
      ),
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        setState(() {
          _controller = controller;
        });
      },
      onTap: (coordinates) {
        setState(() {
          _shopDetailWidget = Container();
        });
        // _controller.animateCamera(CameraUpdate.newLatLng(coordinates));
      },
      markers: markers,
    );
  }
}
