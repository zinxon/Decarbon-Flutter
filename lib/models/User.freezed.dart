// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'User.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'login_id') String loginId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String gender,
      String phone,
      String email,
      int coins,
      @JsonKey(name: 'created_date') String createdDate,
      @JsonKey(name: 'updated_date') String updatedDate,
      @JsonKey(name: 'photo_url') String photoUrl}) {
    return _User(
      userId: userId,
      loginId: loginId,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      phone: phone,
      email: email,
      coins: coins,
      createdDate: createdDate,
      updatedDate: updatedDate,
      photoUrl: photoUrl,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'login_id')
  String get loginId;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get gender;
  String get phone;
  String get email;
  int get coins;
  @JsonKey(name: 'created_date')
  String get createdDate;
  @JsonKey(name: 'updated_date')
  String get updatedDate;
  @JsonKey(name: 'photo_url')
  String get photoUrl;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'login_id') String loginId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String gender,
      String phone,
      String email,
      int coins,
      @JsonKey(name: 'created_date') String createdDate,
      @JsonKey(name: 'updated_date') String updatedDate,
      @JsonKey(name: 'photo_url') String photoUrl});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object userId = freezed,
    Object loginId = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object gender = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object coins = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      loginId: loginId == freezed ? _value.loginId : loginId as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      gender: gender == freezed ? _value.gender : gender as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      coins: coins == freezed ? _value.coins : coins as int,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as String,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'login_id') String loginId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String gender,
      String phone,
      String email,
      int coins,
      @JsonKey(name: 'created_date') String createdDate,
      @JsonKey(name: 'updated_date') String updatedDate,
      @JsonKey(name: 'photo_url') String photoUrl});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object userId = freezed,
    Object loginId = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object gender = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object coins = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_User(
      userId: userId == freezed ? _value.userId : userId as String,
      loginId: loginId == freezed ? _value.loginId : loginId as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      gender: gender == freezed ? _value.gender : gender as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      coins: coins == freezed ? _value.coins : coins as int,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as String,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  _$_User(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'login_id') this.loginId,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.gender,
      this.phone,
      this.email,
      this.coins,
      @JsonKey(name: 'created_date') this.createdDate,
      @JsonKey(name: 'updated_date') this.updatedDate,
      @JsonKey(name: 'photo_url') this.photoUrl});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'login_id')
  final String loginId;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String gender;
  @override
  final String phone;
  @override
  final String email;
  @override
  final int coins;
  @override
  @JsonKey(name: 'created_date')
  final String createdDate;
  @override
  @JsonKey(name: 'updated_date')
  final String updatedDate;
  @override
  @JsonKey(name: 'photo_url')
  final String photoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(userId: $userId, loginId: $loginId, firstName: $firstName, lastName: $lastName, gender: $gender, phone: $phone, email: $email, coins: $coins, createdDate: $createdDate, updatedDate: $updatedDate, photoUrl: $photoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('loginId', loginId))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('coins', coins))
      ..add(DiagnosticsProperty('createdDate', createdDate))
      ..add(DiagnosticsProperty('updatedDate', updatedDate))
      ..add(DiagnosticsProperty('photoUrl', photoUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.loginId, loginId) ||
                const DeepCollectionEquality()
                    .equals(other.loginId, loginId)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.coins, coins) ||
                const DeepCollectionEquality().equals(other.coins, coins)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.updatedDate, updatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDate, updatedDate)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(loginId) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(coins) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(updatedDate) ^
      const DeepCollectionEquality().hash(photoUrl);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'login_id') String loginId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String gender,
      String phone,
      String email,
      int coins,
      @JsonKey(name: 'created_date') String createdDate,
      @JsonKey(name: 'updated_date') String updatedDate,
      @JsonKey(name: 'photo_url') String photoUrl}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'login_id')
  String get loginId;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get gender;
  @override
  String get phone;
  @override
  String get email;
  @override
  int get coins;
  @override
  @JsonKey(name: 'created_date')
  String get createdDate;
  @override
  @JsonKey(name: 'updated_date')
  String get updatedDate;
  @override
  @JsonKey(name: 'photo_url')
  String get photoUrl;
  @override
  _$UserCopyWith<_User> get copyWith;
}
