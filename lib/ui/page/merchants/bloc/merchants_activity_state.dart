part of 'merchants_activity_bloc.dart';

@immutable
abstract class MerchantsActivityState {}

class MerchantsActivityInitial extends MerchantsActivityState {}

class MerchantsActivityListLoading extends MerchantsActivityState {}

class MerchantsActivityListLoaded extends MerchantsActivityState {
  final dynamic result;
  MerchantsActivityListLoaded(this.result);
}

class MerchantsActivityListLoadError extends MerchantsActivityState {}

class MerchantsActivityUploading extends MerchantsActivityState {}

class MerchantsActivityUploaded extends MerchantsActivityState {}

class MerchantsActivityUploadError extends MerchantsActivityState {}

class MerchantsActivityDetailsLoading extends MerchantsActivityState {}

class MerchantsActivityDetailsLoaded extends MerchantsActivityState {
  final dynamic result;
  MerchantsActivityDetailsLoaded(this.result);
}

class MerchantsActivityDetailsLoadError extends MerchantsActivityState {}

class MerchantsActivityDeleteLoading extends MerchantsActivityState {}

class MerchantsActivityDeleteLoaded extends MerchantsActivityState {}

class MerchantsActivityDeleteError extends MerchantsActivityState {}
