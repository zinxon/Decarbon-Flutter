part of 'userprofile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class GetUserProfile extends UserProfileEvent {
  final String loginId;

  GetUserProfile({@required this.loginId});
}

class UpdateUserProfile extends UserProfileEvent {
  final Map<String, dynamic> postData;
  UpdateUserProfile({@required this.postData});
}
