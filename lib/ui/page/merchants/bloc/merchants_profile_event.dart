part of 'merchants_profile_bloc.dart';

@immutable
abstract class MerchantsProfileEvent {}

class GetMerchantsProfile extends MerchantsProfileEvent {
  final String loginId;

  GetMerchantsProfile({
    @required this.loginId,
  });
}

class UpdateMerchantsProfile extends MerchantsProfileEvent {
  final Map<String, dynamic> postData;
  UpdateMerchantsProfile({@required this.postData});
}
