import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/UsersHomePage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/userprofile_bloc.dart';
import 'components/UsersCommonLoadingDialog.dart';
import 'components/UsersCommonTextfield.dart';
import 'components/UsersCommonTitle.dart';
import 'components/UsersSuccessDialog.dart';
import 'components/UsersUnsucessDialog.dart';

class UsersEditProfilePage extends StatefulWidget{
  static const String PATH = '/users/edit_profile';

  @override
  _UsersEditProfilePageState createState() => _UsersEditProfilePageState();
}

class _UsersEditProfilePageState extends State<UsersEditProfilePage> {
  final List<String> genderOptions = ['male', 'female'];

  Map<String, dynamic> profileData;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  String genderValue;

  final User userProfile = UsersInstance.instance.user;
  void getUserProfile() {
    return context.bloc<UserProfileBloc>().add(
      GetUserProfile(
        loginId: userProfile.loginId,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    profileData = Map<String, dynamic>.from(ModalRoute.of(context).settings.arguments)['profile'];
    firstNameController = TextEditingController(text: profileData['first_name']);
    lastNameController = TextEditingController(text: profileData['last_name']);
    emailController = TextEditingController(text: profileData['email']);
    phoneController = TextEditingController(text: profileData['phone']);
    genderValue = profileData['gender'] == 'M' ? 'male' : 'female';
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileUpdating) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return BlocBuilder<UserProfileBloc, UserProfileState>(
                buildWhen: (previous, current) {
                  return (previous is UserProfileUpdating || current is UserProfileUpdating);
                },
                builder: (context, state) {
                  if (state is UserProfileUpdateError) {
                    return UsersUnsuccessDialog(
                      actionName: 'updated',
                      okOnPressed: () {
                        getUserProfile();
                        Navigator.pop(context);
                      },
                    );
                  } else if (state is UserProfileUpdated) {
                    return UsersSuccessDialog(
                      actionName: 'updated',
                      okOnPressed: () {
                        imageCache.clear();
                        getUserProfile();
                        Navigator.popUntil(context,ModalRoute.withName(UsersHomePage.PATH));
                      },
                    );
                  } else {
                    return UsersCommonLoadingDialog();
                  }
                },
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: UsersStyle.mainGreenColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:44, bottom: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My ',
                    style: TextStyle(
                      color: UsersStyle.mainGreenColor,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: UsersStyle.mainBlackColor,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
            // UsersCommonTitle(
            //   title: 'Image',
            // ),
            // UsersImagePickerField(
            //   imagePlaceholderUrl: profileData['merchant']['photo_url'] ?? '',
            //   onImageSelected: ({imageBase64}) {
            //     setState(() {
            //       selectedImageBase64 = imageBase64;
            //     });
            //   },
            // ),
            Text(
              'First Name',
              style: TextStyle(
                fontSize: 15,
                color: UsersStyle.mainBlackColor,
              ),
            ),
            UsersCommonTextfield(
              // placeholderText: profileData['first_name'] ?? '',
              controller: firstNameController,
            ),
            Text(
              'Last Name',
              style: TextStyle(
                fontSize: 15,
                color: UsersStyle.mainBlackColor,
              ),
            ),
            UsersCommonTextfield(
              // placeholderText: profileData['last_name'] ?? '',
              controller: lastNameController,
            ),
            Text(
              'Gender',
              style: TextStyle(
                fontSize: 15,
                color: UsersStyle.mainBlackColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: UsersStyle.mainFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: genderValue,
                iconSize: 0,
                underline: Container(height: 0),
                onChanged: (String newValue) {
                  setState(() {
                    genderValue = newValue;
                  });
                },
                items: genderOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 15,
                          color: UsersStyle.mainDarkGreyColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 15,
                color: UsersStyle.mainBlackColor,
              ),
            ),
            UsersCommonTextfield(
              // placeholderText: profileData['email'] ?? '',
              controller: emailController,
            ),
            Text(
              'Phone',
              style: TextStyle(
                fontSize: 15,
                color: UsersStyle.mainBlackColor,
              ),
            ),
            UsersCommonTextfield(
              // placeholderText: profileData['phone'] ?? '',
              controller: phoneController,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  color: UsersStyle.mainGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: (){
                    context.bloc<UserProfileBloc>().add(
                      UpdateUserProfile(
                        postData:{
                          "user_id": userProfile.userId,
                          "login_id": userProfile.loginId,
                          "first_name" : firstNameController.text,
                          "last_name": lastNameController.text,
                          "gender": genderValue == 'male' ? 'M' : 'F',
                          "phone": phoneController.text,
                          "email": emailController.text,
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}