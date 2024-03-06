// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['user_id'] as String,
    loginId: json['login_id'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    gender: json['gender'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    coins: json['coins'] as int,
    createdDate: json['created_date'] as String,
    updatedDate: json['updated_date'] as String,
    photoUrl: json['photo_url'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'login_id': instance.loginId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'coins': instance.coins,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'photo_url': instance.photoUrl,
    };
