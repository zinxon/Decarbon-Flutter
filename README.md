# DeCarbon

![logo](https://github.com/zinxon/Decarbon-Flutter/blob/main/assets/images/Decarbon_preview.png)

## Merchant Test Account

> email: merchant@gmail.com
> password: Merchant1~

After Login, /api/APIProvide.dart
Every request with `requiresToken` will get accessToken to call the request.

## Build Runner

ptf
pts
fdataclass
flutter pub run build_runner build

## AWS_Cognito

AWS_Cognito need config/amplifyconfiguration.dart for the config to initialize the cognito auth plugin. If you don't have this file. Please run the below command in the root dir

```CMD
touch DeCarbon/lib/config/amplifyconfiguration.dart echo Y29uc3QgYW1wbGlmeWNvbmZpZyA9ICcnJyB7CiAgIlVzZXJBZ2VudCI6ICJhd3MtYW1wbGlmeS1jbGkvMi4wIiwKICAiVmVyc2lvbiI6ICIxLjAiLAogICJhdXRoIjogewogICAgICAicGx1Z2lucyI6IHsKICAgICAgICAgICJhd3NDb2duaXRvQXV0aFBsdWdpbiI6IHsKICAgICAgICAgICAgICAiSWRlbnRpdHlNYW5hZ2VyIjogewogICAgICAgICAgICAgICAgICAiRGVmYXVsdCI6IHt9CiAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAiQ3JlZGVudGlhbHNQcm92aWRlciI6IHsKICAgICAgICAgICAgICAgICAgIkNvZ25pdG9JZGVudGl0eSI6IHsKICAgICAgICAgICAgICAgICAgICAgICJEZWZhdWx0IjogewogICAgICAgICAgICAgICAgICAgICAgICAgICJQb29sSWQi**OiAidXMtZWFzdC0yOmRjNTkyYTJjLTI0ZTctNDRhNS05ZTkzLTA4OTI0YWI5OTE0YiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIlJlZ2lvbiI6ICJ1cy1lYXN0LTIiCiAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICJDb2duaXRvVXNlclBvb2wiOiB7CiAgICAgICAgICAgICAgICAgICJEZWZhdWx0IjogewogICAgICAgICAgICAgICAgICAgICAgIlBvb2xJZCI6ICJ1cy1lYXN0LTJfMkhIMmdqMkY5IiwKICAgICAgICAgICAgICAgICAgICAgICJBcHBDbGllbnRJZCI6ICI3dTVucmx2YjBtcTI0NDVsdGlmcTFkazJzNSIsCiAgICAgICAgICAgICAgICAgICAgICAiQXBwQ2xpZW50U2VjcmV0IjogImIwMWJuY3JwYmZjcXMzN3VhOTh1NzZkbWhkbXZkY3Eza2FnaXJqYmpzNzluZjk2ZTk2ZCIsCiAgICAgICAgICAgICAgICAgICAgICAiUmVnaW9uIjogInVzLWVhc3QtMiIKICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgIkF1dGgiOiB7CiAgICAgICAgICAgICAgICAgICJEZWZhdWx0IjogewogICAgICAgICAgICAgICAgICAgICAgImF1dGhlbnRpY2F0aW9uRmxvd1R5cGUiOiAiVVNFUl9TUlBfQVVUSCIKICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIH0KICAgICAgICAgIH0KICAgICAgfQogIH0KfScnJzsK** | base64 --decode > DeCarbon/lib/config/amplifyconfiguration.dart
```

##Freezed package

> https://pub.dev/packages/freezed

1. Create a file like **Merchant.dart**
2. Run the command `flutter pub run build_runner build`

```DART
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Merchant.g.dart';
part 'Merchant.freezed.dart';

@freezed
abstract class Merchant with _$Merchant {
  const factory Merchant(
      @JsonKey(name: 'merchant_id')
          String merchantId,
      String email,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period')
          String openingPeriod,
      String description,
      String website,
      String openrice,
      String instagram,
      String facebook,
      @JsonKey(name: 'login_id')
          String loginId,
      @JsonKey(name: 'photo_url')
          String photoUrl,
      @JsonKey(name: 'business_registration_number')
          String businessRegistrationNumbe,
      String tags) = _Merchant;
  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
```

## App Entry Points

AppComponent.dart

```DART
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

    final appProvider = AppProvider(child: app, application: _application);
    return appProvider;
  }
```
