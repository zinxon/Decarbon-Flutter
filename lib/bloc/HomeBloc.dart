import 'dart:async';

import 'package:DeCarbon/core/DecarbonApplication.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc {
  final DecarbonApplication _application;
  final _searchText = BehaviorSubject<String>();
  final _isShowLoading = BehaviorSubject<bool>();
  final _counter = BehaviorSubject<int>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  HomeBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();
  Stream<bool> get isShowLoading => _isShowLoading.stream;
  Stream<String> get searchText => _searchText.stream;
  Stream<int> get counter => _counter.stream;

  void _init() {
    // Debounce search text
    // _searchText.debounceTime(const Duration(milliseconds: 500))
    // .listen((String searchText){
    //   _searchApps(searchText);
    // });
    _prefs.then((SharedPreferences prefs) {
      _counter.add(prefs.getInt('counter') ?? 0);
    });
  }

  void incrementCounter(int counter) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("counter", counter).then((bool success) {
      _counter.add(counter);
    });
  }

  void dispose() {
    _compositeSubscription.clear();
    _searchText.close();
    _isShowLoading.close();
    _counter.close();
  }
}
