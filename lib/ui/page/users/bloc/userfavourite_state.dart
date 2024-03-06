part of 'userfavourite_bloc.dart';

abstract class UserFavouriteState{}

class UserFavouriteListInitial extends UserFavouriteState{}

class UserFavouriteListLoading extends UserFavouriteState{}

class UserFavouriteListLoaded extends UserFavouriteState{
  final dynamic result;
  UserFavouriteListLoaded(this.result);
}

class UserFavouriteListLoadError extends UserFavouriteState{}

class UserFavouriteListUpdating extends UserFavouriteState {}

class UserFavouriteListUpdated extends UserFavouriteState {}

class UserFavouriteListUpdateError extends UserFavouriteState {}

