part of 'usermycoupon_bloc.dart';

abstract class UserMyCouponEvent {}

class GetUserMyCouponList extends UserMyCouponEvent {
  final String userId;
  final String loginId;
  final int limit;
  final int offset;

  GetUserMyCouponList({
    @required this.userId,
    @required this.loginId,
    this.limit,
    this.offset,
  });
}