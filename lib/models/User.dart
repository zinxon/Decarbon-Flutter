import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'User.g.dart';
part 'User.freezed.dart';

@freezed
abstract class User with _$User {
  factory User({
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'login_id') String loginId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String gender,
    String phone,
    String email,
    int coins,
    @JsonKey(name: 'created_date') String createdDate,
    @JsonKey(name: 'updated_date') String updatedDate,
    @JsonKey(name: 'photo_url') String photoUrl,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
