import 'package:fluro/fluro.dart';
import 'package:DeCarbon/api/APIProvider.dart';
import 'package:DeCarbon/api/AppStoreAPIRepository.dart';
import 'package:DeCarbon/core/AppRoutes.dart';
import 'package:DeCarbon/utility/framework/Application.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:logging/logging.dart';

class DecarbonApplication implements Application {
  Router router;
  AppStoreAPIRepository appStoreAPIRepository;

  @override
  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    _initAPIRepository();
  }

  @override
  Future<void> onTerminate() async {}

  void _initAPIRepository() {
    APIProvider apiProvider = APIProvider();
    appStoreAPIRepository = AppStoreAPIRepository(apiProvider);
  }

  void _initLog() {
    Log.init();
    Log.setLevel(Level.INFO);
    // switch (Env.value.environmentType) {
    //   case EnvType.DEVELOPMENT:
    //     {
    //       Log.setLevel(Level.ALL);
    //       break;
    //     }
    //   case EnvType.PRODUCTION:
    //     {
    //       Log.setLevel(Level.INFO);
    //       break;
    //     }
    // }
  }

  void _initRouter() {
    router = new Router();
    AppRoutes.configureRoutes(router);
  }
}
