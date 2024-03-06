import 'dart:convert';
import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_profile_repository.dart';
import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/UsersProfileRepository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/merchants/merchants_home_page.dart';
import 'package:DeCarbon/ui/page/users/UsersHomePage.dart';
import 'package:DeCarbon/ui/page/widget/loading.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:fluro/fluro.dart';
import 'package:DeCarbon/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/RegistrationPage.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final Map<String, AssetImage> images = {
  "banner": AssetImage('assets/images/banner.png'),
  "facebook": AssetImage('assets/icons/facebook.png'),
  "google": AssetImage('assets/icons/google.png')
};

class LoginPage extends StatefulWidget {
  static const String PATH = '/login';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _storage = FlutterSecureStorage();
  bool loading = false;

  void _init() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toggleSignUp() {
    AppProvider.getRouter(context).navigateTo(context, RegistrationPage.PATH,
        transition: TransitionType.inFromRight);
  }

  toggleLogin() async {
    try {
      setState(() => loading = true);
      try {
        await Amplify.Auth.signIn(
          username: emailController.text,
          password: passwordController.text,
        );
      } catch (e) {
        setState(() => loading = false);
        showMySimpleDialog(context, e.exceptionList[1].detail);
        return;
      }
      CognitoAuthSession session = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      if (session.isSignedIn) {
        Log.info(session.credentials.sessionToken);
        // print(session.userPoolTokens.accessToken);
        await _storage.write(key: 'userSub', value: session.userSub);
        await _storage.write(
            key: 'accessToken', value: session.userPoolTokens.accessToken);
      }
      Map<String, String> user = await _storage.readAll();

      final merhcantResponse = jsonDecode(
          (await MerchantsProfileRepository.getMerchantProfile(
                  loginId: user['userSub']))
              .toString());
      if (merhcantResponse['success']) {
        final MerchantProfile merchantProfile =
            MerchantProfile.fromJson(merhcantResponse['result']);
        if (merchantProfile != null) {
          MerchantInstance.instance.profile = merchantProfile;
          Log.info(merchantProfile);
          AppProvider.getRouter(context).navigateTo(
              context, MerchantsHomePage.PATH,
              transition: TransitionType.inFromRight);
        }
      }
      final userResponse = jsonDecode(
          (await UsersProfileRepository.getUserProfile(
                  loginId: user['userSub']))
              .toString());
      if (userResponse['success']) {
        final User userProfile = User.fromJson(userResponse['result']);
        UsersInstance.instance.user = userProfile;
        AppProvider.getRouter(context).navigateTo(context, UsersHomePage.PATH);
      }
    } catch (e, stackTrace) {
      setState(() => loading = false);
      Log.info(e, e, stackTrace);
    }
    return;
  }

  void showMySimpleDialog(BuildContext context, String message) {
    Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: "$message",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: Text(
              "CONFIRM",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  // --------------------------------- Widget ---------------------------------
  @override
  Widget build(BuildContext context) {
    _init();
    return loading
        ? Loading()
        : Scaffold(
            body: buildBody(),
            // resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white);
  }

  Widget buildBody() {
    return SafeArea(
        child: InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus.unfocus();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: SingleChildScrollView(
                child: Container(
              child: Column(children: <Widget>[
                buildLogoFlex(),
                buildLoginFlex(),
                // buildBottomFlex()
              ]),
            ))));
  }

  Widget buildLogoFlex() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 80, bottom: 80),
        child: Center(
            child: Image(
          image: images['banner'],
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 2.4,
        )));
  }

  Widget buildLoginFlex() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
              Widget>[
        buildTabbar(),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Color(0xFF707070), fontSize: kTextFontSize),
                      ),
                    )
                  ]),
              Container(
                  margin:
                      const EdgeInsets.only(top: 15, left: 30.0, right: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(230, 230, 230, 0.3),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: kTextFontSize, color: Color(0xFF61B764)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                    ),
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Color(0xFF707070), fontSize: kTextFontSize),
                ),
              )
            ]),
            Container(
                margin: const EdgeInsets.only(top: 15, left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(230, 230, 230, 0.3),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(
                      fontSize: kTextFontSize, color: Color(0xFF61B764)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  splashColor: Color(0xFFEAEAEA),
                  highlightColor: Color(0xFFEAEAEA),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 30, left: 30),
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                        color: Color(0xFF999999), fontSize: kTextFontSize),
                  ),
                ),
              ],
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width - 60,
            height: 50,
            child: FlatButton(
              onPressed: () => toggleLogin(),
              color: Color(0xFF51B055),
              splashColor: Color(0xFF83c786),
              highlightColor: Color(0xFF83c786),
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 30, left: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: kTextFontSize),
              ),
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 5,
                        )),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Color(0xFFD9D9D9), fontSize: kTextFontSize),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 5,
                        )),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Container(),
                    ),
                    Center(
                      child: FlatButton(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        onPressed: () {},
                        splashColor: Color(0xFFEAEAEA),
                        highlightColor: Color(0xFFEAEAEA),
                        child: Image(
                          image: images['facebook'],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                    ),
                    Center(
                        child: FlatButton(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      onPressed: () {},
                      splashColor: Color(0xFFEAEAEA),
                      highlightColor: Color(0xFFEAEAEA),
                      child: Image(
                        image: images['google'],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                    )),
                    Center(
                      child: Container(),
                    )
                  ],
                )
              ],
            ))
      ]),
    );
  }

  Widget buildTabbar() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              child: FlatButton(
                  padding: const EdgeInsets.only(top: 12, bottom: 0),
                  onPressed: () {},
                  splashColor: Color(0xFFEAEAEA),
                  highlightColor: Color(0xFFEAEAEA),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Log In',
                        style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: kTextFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 3.0,
                          width: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: Color(0xFF50AF54),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )),
        SizedBox(
            width: 4.0,
            height: 30.0,
            child: Container(color: Color(0xFFF7F7F7))),
        Expanded(
            flex: 1,
            child: FlatButton(
                padding: const EdgeInsets.only(top: 12, bottom: 0),
                onPressed: () => toggleSignUp(),
                splashColor: Color(0xFFEAEAEA),
                highlightColor: Color(0xFFEAEAEA),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFFDCDCDC),
                          fontSize: kTextFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 3.0,
                        width: 20,
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
      ],
    );
  }
  // --------------------------------- Widget ---------------------------------
}
