import 'package:DeCarbon/config/amplifyconfiguration.dart';
import 'package:DeCarbon/ui/page/LoginPage.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/core/DecarbonApplication.dart';
import 'package:DeCarbon/config/Env.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:DeCarbon/bloc/AppBloc.dart';
import 'package:amplify_core/amplify_core.dart';

class AppComponent extends StatefulWidget {
  final DecarbonApplication _application;

  AppComponent(this._application);

  @override
  State createState() {
    return new AppComponentState(_application);
  }
}

class AppComponentState extends State<AppComponent> {
  final DecarbonApplication _application;
  AppComponentState(this._application);
  AppBloc bloc;
  var returnValue;
  double progress;
  // gives our app awareness about whether we are succesfully connected to the cloud
  bool _amplifyConfigured = false;
  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  void _configureAmplify() async {
    if (!mounted) return;
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);
    await amplifyInstance.configure(amplifyconfig);
    Log.info("AmplifyAuthCognito is initialized!");
    Amplify.Auth.signOut();
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // amplify is configured on startup
    if (!_amplifyConfigured) {
      _configureAmplify();
    }
  }

  @override
  void dispose() async {
    Log.info('dispose');
    super.dispose();
    bloc.dispose();
    await _application.onTerminate();
  }

  @override
  Widget build(BuildContext context) {
    _init();

    final app = MaterialApp(
      title: Env.value.appName,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
      ),
      initialRoute: LoginPage.PATH,
      onGenerateRoute: _application.router.generator,
    );
    // print('initial core.route = ${app.initialRoute}');

    final appProvider = AppProvider(child: app, application: _application);
    return appProvider;
  }

  void _init() {
    if (null == bloc) {
      bloc = AppBloc(_application);
    }
    // full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
