part of 'userprofile_bloc.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState{}

class UserProfileLoading extends UserProfileState{}

class UserProfileLoaded extends UserProfileState{
  final dynamic result;
  final List myCouponList;
  UserProfileLoaded(this.result, this.myCouponList);
}

class UserProfileLoadError extends UserProfileState{}

class UserProfileUpdating extends UserProfileState {}

class UserProfileUpdated extends UserProfileState {}

class UserProfileUpdateError extends UserProfileState {}
