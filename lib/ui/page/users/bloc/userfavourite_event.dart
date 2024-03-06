part of 'userfavourite_bloc.dart';

abstract class UserFavouriteEvent {}

class GetUserFavouriteList extends UserFavouriteEvent {
  final String userId;
  final String loginId;
  final int limit;
  final int offset;

  GetUserFavouriteList({
    @required this.userId,
    @required this.loginId,
    this.limit,
    this.offset,
  });
}

class UpdateUserFavouriteList extends UserFavouriteEvent {
  final String userId;
  final String loginId;
  final String merchantId;
  final String storeId;
  final int status;
  UpdateUserFavouriteList({
    @required this.userId,
    @required this.loginId,
    @required this.merchantId,
    @required this.storeId,
    @required this.status,
  });
}
