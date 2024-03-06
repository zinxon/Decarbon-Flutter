import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:DeCarbon/core/DecarbonApplication.dart';

class AppProvider extends InheritedWidget {
  final DecarbonApplication application;

  AppProvider({Key key, Widget child, this.application})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>());
  }

  static fluro.Router getRouter(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>())
        .application
        .router;
  }

  static DecarbonApplication getApplication(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>())
        .application;
  }
}
