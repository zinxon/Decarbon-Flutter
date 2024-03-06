part of 'merchants_coupon_bloc.dart';

@immutable
abstract class MerchantsCouponEvent {}

class GetMerchantsCouponList extends MerchantsCouponEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String limit;
  final String offset;

  GetMerchantsCouponList(
      {@required this.merchantsId,
      @required this.storeId,
      @required this.loginId,
      @required this.loginType,
      this.limit,
      this.offset});
}

class CreateMerchantsCoupon extends MerchantsCouponEvent {
  final Map<String, dynamic> postData;
  CreateMerchantsCoupon({@required this.postData});
}

class GetMerchantsCouponDetails extends MerchantsCouponEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String couponId;

  GetMerchantsCouponDetails({
    @required this.merchantsId,
    @required this.storeId,
    @required this.loginId,
    @required this.loginType,
    this.couponId,
  });
}

class DeleteSpecificMerchantsCoupon extends MerchantsCouponEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String couponId;

  DeleteSpecificMerchantsCoupon({
    @required this.merchantsId,
    @required this.storeId,
    @required this.loginId,
    @required this.loginType,
    this.couponId,
  });
}
