part of 'merchants_profile_bloc.dart';

@immutable
abstract class MerchantsProfileState {}

class MerchantsProfileInitial extends MerchantsProfileState {}

class MerchantsProfileLoading extends MerchantsProfileState {}

class MerchantsProfileLoaded extends MerchantsProfileState {
  final dynamic result;
  MerchantsProfileLoaded(this.result);
}

class MerchantsProfileLoadError extends MerchantsProfileState {}

class MerchantsProfileUpdating extends MerchantsProfileState {}

class MerchantsProfileUpdated extends MerchantsProfileState {}

class MerchantsProfileUpdateError extends MerchantsProfileState {}
