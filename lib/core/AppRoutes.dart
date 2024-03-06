import 'package:DeCarbon/ui/page/merchants/merchants_activity_details_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_add_activity_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_add_coupon_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_coupon_details_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_edit_activity_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_edit_coupon_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_edit_profile_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_give_points_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_home_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_qr_code_scanner_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_recent_record_page.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_record_detail_page.dart';
import 'package:DeCarbon/ui/page/users/UsersActivityDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersCouponDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersEditProfilePage.dart';
import 'package:DeCarbon/ui/page/users/UsersFaqPage.dart';
import 'package:DeCarbon/ui/page/users/UsersFavoritesPage.dart';
import 'package:DeCarbon/ui/page/users/UsersHomePage.dart';
import 'package:DeCarbon/ui/page/users/UsersMerchantDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersMyCarbonPointsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersMyCouponsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersNewsDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersNotUsedCouponDetailsPage.dart';
import 'package:DeCarbon/ui/page/users/UsersQrCodePage.dart';
import 'package:DeCarbon/ui/page/users/UsersRecentActivityPage.dart';
import 'package:DeCarbon/ui/page/users/UsersRecentRecordPage.dart';
import 'package:DeCarbon/ui/page/users/UsersRecordDetailPage.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:DeCarbon/ui/page/HomePage.dart';
import 'package:DeCarbon/ui/page/WalkthroughPage.dart';
import 'package:DeCarbon/ui/page/LoginPage.dart';
import 'package:DeCarbon/ui/page/RegistrationPage.dart';
import 'package:DeCarbon/ui/page/LandingPage.dart';

var rootHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

// var appDetailRouteHandler = new fluro.Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       String appId = params['appId']?.first;
//       String heroTag = params['heroTag']?.first;
//       String title = params['title']?.first;
//       String url = params['url']?.first;
//       String titleTag = params['titleTag']?.first;

//       return new AppDetailPage(appId: num.parse(appId), heroTag:heroTag,title: title, url: url, titleTag: titleTag);
//     });

var walkthroughHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WalkthroughPage();
});

var loginHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var registrationHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegistrationPage();
});

var landingHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LandingPage();
});

/// MERCHANTS PAGE ROUTES HANDLER
var merchantsHomeHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsHomePage();
});
var merchantsAddActivityHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsAddActivityPage();
});
var merchantsActivityDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsActivityDetailsPage(
    activityId: params["activity_id"][0],
  );
});
var merchantsEditActivityHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsEditActivityPage(
    activityId: params["activity_id"][0],
  );
});
var merchantsAddCouponHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsAddCouponPage();
});
var merchantsCouponDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsCouponDetailsPage(
    couponId: params["coupon_id"][0],
  );
});
var merchantsEditCouponHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsEditCouponPage(
    couponId: params["coupon_id"][0],
  );
});
var merchantsEditProfileHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsEditProfilePage();
});
var merchantsQrCodeScannerHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsQrCodeScannerPage();
});
var merchantsGivePointsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsGivePointsPage();
});
var merchantsRecentRecordHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsRecentRecordPage();
});
var merchantsRecordDetailHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantsRecordDetailPage();
});

/// USERS PAGE ROUTES HANDLER
var usersHomeHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersHomePage();
  },
);
var usersFaqHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersFaqPage();
  },
);
var usersNewsDetailsHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersNewsDetailsPage();
  },
);
var usersMerchantDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersMerchantDetailsPage();
});
var usersCouponDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersCouponDetailsPage(couponId: params["coupon_id"][0],);
});
var usersNotUsedCouponDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersNotUsedCouponDetailsPage(couponId: params["coupon_id"][0], recordId: params['record_id'][0]);
});
var usersQrCodeHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersQrCodePage();
});
var usersEditProfileHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersEditProfilePage();
  },
);
var usersRecentRecordHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersRecentRecordPage();
  },
);
var usersRecordDetailHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersRecordDetailPage();
});
var usersRecentActivityHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersRecentActivityPage();
  },
);
var usersActivityDetailsHandler = new fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UsersActivityDetailsPage(
    activityId: params["activity_id"][0],
  );
});
var usersMyCouponsHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersMyCouponsPage();
  },
);
var usersFavoritesHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersFavoritesPage();
  },
);
var usersMyCarbonPointsHandler = new fluro.Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return UsersMyCarbonPointsPage();
  },
);

class AppRoutes {
  static void configureRoutes(fluro.Router router) {
    router.notFoundHandler = new fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
      return;
    });
    router.define(LandingPage.PATH, handler: landingHandler);
    router.define(HomePage.PATH, handler: rootHandler);
    router.define(WalkthroughPage.PATH, handler: walkthroughHandler);
    router.define(LoginPage.PATH, handler: loginHandler);
    router.define(RegistrationPage.PATH, handler: registrationHandler);
    // router.define(AppDetailPage.PATH, handler: appDetailRouteHandler);

    /// MERCHANTS PAGE ROUTES
    router.define(
      MerchantsHomePage.PATH,
      handler: merchantsHomeHandler,
    );
    router.define(
      MerchantsAddActivityPage.PATH,
      handler: merchantsAddActivityHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsActivityDetailsPage.PATH,
      handler: merchantsActivityDetailsHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsEditActivityPage.PATH,
      handler: merchantsEditActivityHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsAddCouponPage.PATH,
      handler: merchantsAddCouponHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsCouponDetailsPage.PATH,
      handler: merchantsCouponDetailsHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsEditCouponPage.PATH,
      handler: merchantsEditCouponHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsEditProfilePage.PATH,
      handler: merchantsEditProfileHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsQrCodeScannerPage.PATH,
      handler: merchantsQrCodeScannerHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsGivePointsPage.PATH,
      handler: merchantsGivePointsHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsRecentRecordPage.PATH,
      handler: merchantsRecentRecordHandler,
      transitionType: fluro.TransitionType.inFromRight,
    );
    router.define(
      MerchantsRecordDetailPage.PATH,
      handler: merchantsRecordDetailHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );

    /// USERS PAGE ROUTES
    router.define(
      UsersHomePage.PATH,
      handler: usersHomeHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersFaqPage.PATH,
      handler: usersFaqHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersNewsDetailsPage.PATH, 
      handler: usersNewsDetailsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersMerchantDetailsPage.PATH, 
      handler: usersMerchantDetailsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersCouponDetailsPage.PATH, 
      handler: usersCouponDetailsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersNotUsedCouponDetailsPage.PATH, 
      handler: usersNotUsedCouponDetailsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersQrCodePage.PATH, 
      handler: usersQrCodeHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersEditProfilePage.PATH,
      handler: usersEditProfileHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersRecentRecordPage.PATH,
      handler: usersRecentRecordHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersRecordDetailPage.PATH,
      handler: usersRecordDetailHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersRecentActivityPage.PATH,
      handler: usersRecentActivityHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersActivityDetailsPage.PATH,
      handler: usersActivityDetailsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersMyCouponsPage.PATH,
      handler: usersMyCouponsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersFavoritesPage.PATH,
      handler: usersFavoritesHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
    router.define(
      UsersMyCarbonPointsPage.PATH, 
      handler: usersMyCarbonPointsHandler,
      transitionType: fluro.TransitionType.inFromBottom,
    );
  }
}
