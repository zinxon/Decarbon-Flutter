part of 'usermycoupon_bloc.dart';

abstract class UserMyCouponState{}

class UserMyCouponListInitial extends UserMyCouponState{}

class UserMyCouponListLoading extends UserMyCouponState{}

class UserMyCouponListLoaded extends UserMyCouponState{
  final dynamic notUsedCouponList;
  final dynamic usedCouponList;
  UserMyCouponListLoaded(this.notUsedCouponList, this.usedCouponList);
}

class UserMyCouponListLoadError extends UserMyCouponState{}

