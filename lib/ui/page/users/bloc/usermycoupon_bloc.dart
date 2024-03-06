import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/users/UsersCouponRepository.dart';
import 'package:DeCarbon/api/users/UsersFavouriteRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'usermycoupon_event.dart';
part 'usermycoupon_state.dart';

class UserMyCouponBloc extends Bloc<UserMyCouponEvent, UserMyCouponState> {
  UserMyCouponBloc() : super(UserMyCouponListInitial());

  @override
  Stream<UserMyCouponState> mapEventToState(UserMyCouponEvent event) async* {
    if (event is GetUserMyCouponList) {
      yield UserMyCouponListLoading();

      try {
        final notUsedCouponResponse = await UsersCouponRepository.getCouponRecord(userId: event.userId, loginId: event.loginId, status: 1);
        final usedCouponResponse = await UsersCouponRepository.getCouponRecord(userId: event.userId, loginId: event.loginId, status: 0);
        if (notUsedCouponResponse.statusCode < 200 || notUsedCouponResponse.statusCode > 299 || usedCouponResponse.statusCode < 200 || usedCouponResponse.statusCode > 299) {
          yield UserMyCouponListLoadError();
        } else {
          if (jsonDecode(notUsedCouponResponse.toString())['success'] && jsonDecode(usedCouponResponse.toString())['success']) {
            yield UserMyCouponListLoaded(jsonDecode(notUsedCouponResponse.toString())['result'], jsonDecode(usedCouponResponse.toString())['result']);
          } else {
            yield UserMyCouponListLoadError();
          }
        }
      } catch (e) {
        yield UserMyCouponListLoadError();
      }
    }
  }
}
