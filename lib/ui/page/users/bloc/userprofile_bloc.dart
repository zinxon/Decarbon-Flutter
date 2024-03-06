import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/users/UsersCouponRepository.dart';
import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/api/users/UsersProfileRepository.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userprofile_event.dart';
part 'userprofile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial());

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is GetUserProfile) {
      yield UserProfileLoading();

      try {
        final response = await UsersProfileRepository.getUserProfile(loginId: event.loginId);
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield UserProfileLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            UsersInstance.instance.user = User.fromJson(jsonDecode(response.toString())['result']);
            final couponResponse = await UsersCouponRepository.getCouponRecord(userId: UsersInstance.instance.user.userId, loginId: UsersInstance.instance.user.loginId, status: 1);
            if (couponResponse.statusCode < 200 || couponResponse.statusCode > 299) {
              yield UserProfileLoadError();
            } else {
              if (jsonDecode(couponResponse.toString())['success']) {
                List<dynamic> couponList = [];
                dynamic result = jsonDecode(couponResponse.toString())['result'];
                for(int i = 0; i < result.keys.length; i++){
                  for(int j = 0; j < result.values.toList()[i]['data'].length; j++){
                    couponList.add(result.values.toList()[i]['data'][j]);
                  }
                }
                yield UserProfileLoaded(jsonDecode(response.toString())['result'], couponList);
              }else{
                yield UserProfileLoadError();
              }
            }
          } else {
            yield UserProfileLoadError();
          }
        }
      } catch (e) {
        yield UserProfileLoadError();
      }
    } else if (event is UpdateUserProfile) {
      yield UserProfileUpdating();

      try {
        final response = await UsersProfileRepository.updateUser(data: event.postData);
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield UserProfileUpdateError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield UserProfileUpdated();
          } else {
            yield UserProfileUpdateError();
          }
        }
        print(response);
      } catch (e) {
        yield UserProfileUpdateError();
      }
    }
  }
}
