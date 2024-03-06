import 'dart:async';

import 'package:DeCarbon/core/DecarbonApplication.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberBloc {
  final DecarbonApplication _application;
  final _loginId = BehaviorSubject<String>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  MemberBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();
  Stream<String> get loginId => _loginId.stream;

  void _init() {
    _prefs.then((SharedPreferences prefs) {
      _loginId.add(prefs.getString('loginId') ?? '');
    });
  }

  void dispose() {
    _compositeSubscription.clear();
    _loginId.close();
  }
}
