import 'package:DeCarbon/config/amplifyconfiguration.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_activity_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_coupon_bloc.dart';
import 'package:DeCarbon/ui/page/merchants/bloc/merchants_profile_bloc.dart';
import 'package:DeCarbon/ui/page/users/bloc/userfavourite_bloc.dart';
import 'package:DeCarbon/ui/page/users/bloc/usermycoupon_bloc.dart';
import 'package:DeCarbon/ui/page/users/bloc/userprofile_bloc.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:DeCarbon/core/AppComponent.dart';
import 'package:DeCarbon/core/DecarbonApplication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutter/services.dart';

enum EnvType {
  DEVELOPMENT,
  PRODUCTION,
}

class Env {
  static Env value;

  String appName;
  String baseUrl;
  // gives our app awareness about whether we are succesfully connected to the cloud
  // Instantiate Amplify
  // Amplify amplifyInstance = Amplify();

  Env() {
    value = this;
    _init();
  }

  // void _configureAmplify() async {
  //   AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
  //   amplifyInstance.addPlugin(authPlugins: [authPlugin]);
  //   await amplifyInstance.configure(amplifyconfig);
  //   Log.info("AmplifyAuthCognito is initialized!");
  //   Amplify.Auth.signOut();
  // }

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    var application = DecarbonApplication();
    await application.onCreate();
    // _configureAmplify();
    // String initialRoute = await prefs.getString('initialRoute');
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<MerchantsActivityBloc>(
              create: (context) => MerchantsActivityBloc(),
            ),
            BlocProvider<MerchantsCouponBloc>(
              create: (context) => MerchantsCouponBloc(),
            ),
            BlocProvider<MerchantsProfileBloc>(
              create: (context) => MerchantsProfileBloc(),
            ),
            BlocProvider<UserProfileBloc>(
              create: (context) => UserProfileBloc(),
            ),
            BlocProvider<UserFavouriteBloc>(
              create: (context) => UserFavouriteBloc(),
            ),
            BlocProvider<UserMyCouponBloc>(
              create: (context) => UserMyCouponBloc(),
            ),
          ],
          child: AppComponent(application),
        ),
      );
    });
  }
}
