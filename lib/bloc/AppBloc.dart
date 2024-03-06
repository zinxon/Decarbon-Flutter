import 'dart:async';

import 'package:DeCarbon/core/DecarbonApplication.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc {
  final DecarbonApplication _application;
  final _initialRoute = BehaviorSubject<String>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AppBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();
  Stream<String> get initialRoute => _initialRoute.stream;

  void _init() {
    _prefs.then((SharedPreferences prefs) {
      _initialRoute.add(prefs.getString('initialRoute') ?? '/walkthrough');
    });
  }

  void changeInitialRoute(String initialRoute) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("initialRoute", initialRoute).then((bool success) {
      _initialRoute.add(initialRoute);
    });
  }

  void dispose() {
    _compositeSubscription.clear();
    _initialRoute.close();
  }
}
