part of 'merchants_coupon_bloc.dart';

@immutable
abstract class MerchantsCouponState {}

class MerchantsCouponInitial extends MerchantsCouponState {}

class MerchantsCouponListLoading extends MerchantsCouponState {}

class MerchantsCouponListLoaded extends MerchantsCouponState {
  final dynamic result;
  MerchantsCouponListLoaded(this.result);
}

class MerchantsCouponListLoadError extends MerchantsCouponState {}

class MerchantsCouponUploading extends MerchantsCouponState {}

class MerchantsCouponUploaded extends MerchantsCouponState {}

class MerchantsCouponUploadError extends MerchantsCouponState {}

class MerchantsCouponDetailsLoading extends MerchantsCouponState {}

class MerchantsCouponDetailsLoaded extends MerchantsCouponState {
  final dynamic result;
  MerchantsCouponDetailsLoaded(this.result);
}

class MerchantsCouponDetailsLoadError extends MerchantsCouponState {}

class MerchantsCouponDeleteLoading extends MerchantsCouponState {}

class MerchantsCouponDeleteLoaded extends MerchantsCouponState {}

class MerchantsCouponDeleteError extends MerchantsCouponState {}
