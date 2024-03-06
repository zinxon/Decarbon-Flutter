part of 'merchants_activity_bloc.dart';

@immutable
abstract class MerchantsActivityEvent {}

class GetMerchantsActivityList extends MerchantsActivityEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String limit;
  final String offset;

  GetMerchantsActivityList(
      {@required this.merchantsId,
      @required this.storeId,
      @required this.loginId,
      @required this.loginType,
      this.limit,
      this.offset});
}

class CreateMerchantsActivity extends MerchantsActivityEvent {
  final Map<String, dynamic> postData;
  CreateMerchantsActivity({@required this.postData});
}

class GetMerchantsActivityDetails extends MerchantsActivityEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String activityId;

  GetMerchantsActivityDetails({
    @required this.merchantsId,
    @required this.storeId,
    @required this.loginId,
    @required this.loginType,
    @required this.activityId,
  });
}

class DeleteSpecificMerchantsActivity extends MerchantsActivityEvent {
  final String merchantsId;
  final String storeId;
  final String loginId;
  final String loginType;
  final String activityId;

  DeleteSpecificMerchantsActivity({
    @required this.merchantsId,
    @required this.storeId,
    @required this.loginId,
    @required this.loginType,
    @required this.activityId,
  });
}
