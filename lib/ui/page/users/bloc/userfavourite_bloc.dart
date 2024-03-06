import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/users/UsersFavouriteRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'userfavourite_event.dart';
part 'userfavourite_state.dart';

class UserFavouriteBloc extends Bloc<UserFavouriteEvent, UserFavouriteState> {
  UserFavouriteBloc() : super(UserFavouriteListInitial());

  @override
  Stream<UserFavouriteState> mapEventToState(UserFavouriteEvent event) async* {
    if (event is GetUserFavouriteList) {
      yield UserFavouriteListLoading();

      try {
        final response = await UsersFavouriteRepository.getUserFavouriteList(
            userId: event.userId, loginId: event.loginId);
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield UserFavouriteListLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield UserFavouriteListLoaded(
                jsonDecode(response.toString())['result']);
          } else {
            yield UserFavouriteListLoadError();
          }
        }
      } catch (e) {
        yield UserFavouriteListLoadError();
      }
    } else if (event is UpdateUserFavouriteList) {
      yield UserFavouriteListUpdating();

      try {
        final response = await UsersFavouriteRepository.updateUserFavouriteList(
          loginId: event.loginId,
          merchantId: event.merchantId,
          status: event.status,
          storeId: event.storeId,
          userId: event.userId,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield UserFavouriteListUpdateError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield UserFavouriteListUpdated();
          } else {
            yield UserFavouriteListUpdateError();
          }
        }
        print(response);
      } catch (e) {
        yield UserFavouriteListUpdateError();
      }
    }
  }
}
