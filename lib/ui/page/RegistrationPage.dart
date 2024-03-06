import 'dart:io';
import 'dart:convert';
import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/users/usersInstance.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/UsersHomePage.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:fluro/fluro.dart';
import 'package:DeCarbon/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DeCarbon/bloc/Appbloc.dart';
import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/utility/log/Log.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'LoginPage.dart';
import 'merchants/merchants_home_page.dart';

List<String> _accountType = ['User', "Merchant"];
List<String> _gender = ['Male', "Female"];
List<String> _shopType = ['Restaurant'];
Map<String, List<String>> questions = {
  'User': [
    'title',
    'accountType',
    'firstName',
    'lastName',
    'gender',
    'email',
    'phone',
    'password',
    'signup'
  ],
  'Merchant': [
    'title',
    'accountType',
    'shopName',
    'shopType',
    'email',
    'password',
    'phone',
    'address',
    'website',
    'facebook',
    'instagram',
    'openrice',
    'signup'
  ]
};

class RegistrationPage extends StatefulWidget {
  static const String PATH = '/registration';

  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  AppBloc appBloc;
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController shopNameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController websiteController = new TextEditingController();
  TextEditingController facebookController = new TextEditingController();
  TextEditingController instagramController = new TextEditingController();
  TextEditingController openriceController = new TextEditingController();
  String gender = 'Male';
  String accountType = 'User';
  String shopType = 'Restaurant';
  bool isSignUpComplete = false;

  Future<Map> createUser() async {
    final session = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true)) as dynamic;
    Log.info('Session:', session.userSub);
    Log.info('Session:', session.userPoolTokens.accessToken);
    print('${session.userPoolTokens.accessToken}');
    var payload = {
      "email": "${emailController.text}",
      "first_name": "${firstNameController.text}",
      "last_name": "${lastNameController.text}",
      "phone": "${phoneController.text}",
      "login_id": "${session.userSub}",
      "gender": "${this.gender}",
      "image":
          "data:image/gif;base64,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"
    };
    final response = await http.post(
      'https://f7p9waywv6.execute-api.us-east-2.amazonaws.com/v1/user/createUser',
      headers: {
        HttpHeaders.authorizationHeader: session.userPoolTokens.accessToken,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      return jsonDecode(response.body);
    }

    print(response);
    print(
      "http request failed! { statusCode: ${response.statusCode}, body: ${response.body} }",
    );
    return null;
  }

  Future<Map> createMerchant() async {
    final session = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true)) as dynamic;
    Log.info('Session:', session.userSub);
    Log.info('Session:', session.userPoolTokens.accessToken);
    print('${session.userPoolTokens.accessToken}');
    var payload = {
      "email": "${emailController.text}",
      "name": "${shopNameController.text}",
      "address": "${addressController.text}",
      "phone": "${phoneController.text}",
      "opening_period":
          "{monday:'09:00-17:00',tuesday:'09:00-17:00',wednesday:'09:00-17:00',thursday:'09:00-17:00',friday:'09:00-17:00',saturday:'09:00-17:00',sunday:'09:00-17:00'}",
      "description": "Description",
      "website": "${websiteController.text}",
      "openrice": "${openriceController.text}",
      "instagram": "${instagramController.text}",
      "facebook": "${facebookController.text}",
      "tags": [],
      "login_id": "${session.userSub}",
      "business_registration_number": "",
      "latitude": "23.44647",
      "longitude": "113.04082",
      "image":
          "data:image/gif;base64,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"
    };
    final response = await http.post(
      'https://f7p9waywv6.execute-api.us-east-2.amazonaws.com/v1/merchant/createMerchant',
      headers: {
        HttpHeaders.authorizationHeader: session.userPoolTokens.accessToken,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      return jsonDecode(response.body);
    }

    print(response);
    print(
      "http request failed! { statusCode: ${response.statusCode}, body: ${response.body} }",
    );
    return null;
  }

  Future _registerUser() async {
    try {
      var attrs = Map<String, String>();
      Log.info(
          '${emailController.text},${passwordController.text},${shopNameController.text},$accountType');
      if (accountType == 'User') {
        attrs = {
          'email': '${emailController.text}',
          'phone_number': '+852${phoneController.text}',
          'family_name': '${lastNameController.text}',
          'given_name': '${firstNameController.text}',
          'name': '${shopNameController.text}',
          'account_type': '${accountType.toLowerCase()}',
        };
      } else if (accountType == 'Merchant') {
        attrs = {
          'email': '${emailController.text}',
          'phone_number': '+852${phoneController.text}',
          'name': '${shopNameController.text}',
          'account_type': '${accountType.toLowerCase()}',
        };
      }
      try {
        SignUpResult res = await Amplify.Auth.signUp(
            username: emailController.text,
            password: passwordController.text,
            options: CognitoSignUpOptions(userAttributes: attrs));
        await Amplify.Auth.signIn(
          username: emailController.text,
          password: passwordController.text,
        );
        if (accountType == 'User') {
          var userResponse = await createUser();
          // final User userProfile = User.fromJson(userResponse['result']);
          // UsersInstance.instance.user = userProfile;
          // print(UsersInstance);
          // print(UsersInstance.instance.user.loginId);
          // AppProvider.getRouter(context)
          //     .navigateTo(context, UsersHomePage.PATH);
        } else if (accountType == 'Merchant') {
          var merhcantResponse = await createMerchant();
          // final MerchantProfile merchantProfile =
          //     MerchantProfile.fromJson(merhcantResponse['result']);
          // MerchantInstance.instance.profile = merchantProfile;
          // AppProvider.getRouter(context).navigateTo(
          //     context, MerchantsHomePage.PATH,
          //     transition: TransitionType.inFromRight);
        }
        setState(() {
          isSignUpComplete = res.isSignUpComplete;
          print("Sign up: " + (isSignUpComplete ? "Complete" : "Not Complete"));
          Amplify.Auth.signOut();
          showMySimpleDialog(context, "Registration Success!!");
        });
      } on AuthError catch (e) {
        print(e);
      }
    } on AuthError catch (e) {
      print(e);
      return "Register Error: " + e.toString();
    }
  }

  void showMySimpleDialog(BuildContext context, String message) {
    Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc: "$message",
        buttons: [
          DialogButton(
            onPressed: () => AppProvider.getRouter(context).navigateTo(
                context, LoginPage.PATH,
                transition: TransitionType.inFromRight),
            width: 120,
            child: Text(
              "CONFIRM",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // --------------------------------- Widget ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildBody(),
        appBar: AppBar(
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Color(0xFF51B055), //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
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
            child: Container(
                child: GlowingOverscrollIndicator(
                    color: Color(0xFF51B055),
                    axisDirection: AxisDirection.down,
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: questions[accountType].length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildListItem(questions[accountType][index]);
                        })))));
  }

  Widget buildListItem(String type) {
    if (type == 'title') {
      return buildTitle();
    } else if (type == 'signup') {
      return buildSignUpButton();
    } else if (type == 'accountType' ||
        type == 'gender' ||
        type == 'shopType') {
      return buildSelectInput(type);
    } else {
      return buildTextInput(type);
    }
  }

  Widget buildTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Center(
        child: RichText(
          text: TextSpan(
              style:
                  TextStyle(fontSize: kTitleFontSize, color: Color(0xFF333333)),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign ',
                  style: TextStyle(
                      fontSize: kTitleFontSize, color: Color(0xFF51B055)),
                ),
                TextSpan(text: 'Up')
              ]),
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width - 60,
          height: 50,
          child: FlatButton(
            onPressed: () => _registerUser(),
            color: Color(0xFF51B055),
            splashColor: Color(0xFF83c786),
            highlightColor: Color(0xFF83c786),
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 30, left: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontSize: kTextFontSize),
            ),
          ),
        ));
  }

  Widget buildSelectInput(String type) {
    void Function(String) onChangedFunction = null;
    String label = '';
    String selectedValue = '';
    List<String> selectList = [];
    if (type == 'accountType') {
      onChangedFunction =
          (String value) => {accountType = value, this.setState(() {})};
      selectList = _accountType;
      selectedValue = accountType;
      label = '*Account Type';
    } else if (type == 'gender') {
      onChangedFunction =
          (String value) => {gender = value, this.setState(() {})};
      selectList = _gender;
      selectedValue = gender;
      label = '*Gender';
    } else if (type == 'shopType') {
      onChangedFunction =
          (String value) => {shopType = value, this.setState(() {})};
      selectList = _shopType;
      selectedValue = shopType;
      label = '*Shop Type';
    }

    return Container(
      margin: const EdgeInsets.only(top: 25, left: 30, right: 30),
      width: MediaQuery.of(context).size.width - 60,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: Color(0xFF707070), fontSize: kTextFontSize),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFE2E2E2), width: 1.5)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedValue,
                  iconEnabledColor: Color(0xFF61B764),
                  items: selectList.map(
                    (String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          '$value',
                          style: TextStyle(color: Color(0xFF61B764)),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String value) => onChangedFunction(value),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildTextInput(String type) {
    void Function(String) onChangedFunction = null;
    String label = '';
    TextInputType selectedType = TextInputType.text;
    TextEditingController controller = null;
    bool obscureText = false;
    if (type == 'firstName') {
      label = '*First Name';
      controller = firstNameController;
    } else if (type == 'lastName') {
      label = '*Last Name';
      controller = lastNameController;
    } else if (type == 'email') {
      label = '*Email';
      controller = emailController;
      selectedType = TextInputType.emailAddress;
    } else if (type == 'phone') {
      label = '*Phone';
      controller = phoneController;
      selectedType = TextInputType.number;
    } else if (type == 'password') {
      label = '*Password';
      controller = passwordController;
      obscureText = true;
    } else if (type == 'shopName') {
      label = '*Shop Name';
      controller = shopNameController;
    } else if (type == 'address') {
      label = '*Address';
      controller = addressController;
    } else if (type == 'website') {
      label = 'Website';
      controller = websiteController;
    } else if (type == 'facebook') {
      label = 'Facebook';
      controller = facebookController;
    } else if (type == 'instagram') {
      label = 'Instagram';
      controller = instagramController;
    } else if (type == 'openrice') {
      label = 'Openrice';
      controller = openriceController;
    }

    return Container(
        margin: const EdgeInsets.only(top: 25, left: 30, right: 30),
        width: MediaQuery.of(context).size.width - 60,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: Color(0xFF707070), fontSize: kTextFontSize),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFE2E2E2), width: 1.5)),
              child: TextField(
                  controller: controller,
                  keyboardType: selectedType,
                  obscureText: obscureText,
                  style: TextStyle(
                      fontSize: kTextFontSize, color: Color(0xFF61B764)),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  )))
        ]));
  }
  // --------------------------------- Widget ---------------------------------
}
