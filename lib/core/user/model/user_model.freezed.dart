// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'state') String get state;@JsonKey(name: 'role') String get role;@JsonKey(name: 'provider') String get provider;@JsonKey(name: 'email') String get email;@JsonKey(name: 'sun_sign') String? get sunSign;@JsonKey(name: 'shadow_id') String? get shadowId;@JsonKey(name: 'daily_question_count') int get dailyQuestionCount;@JsonKey(name: 'is_agreed') bool get isAgreed;@JsonKey(name: 'is_birth_completed') bool get isBirthCompleted;@JsonKey(name: 'birth') DateTime? get birth;@JsonKey(name: 'last_question_date') DateTime? get lastQuestionDate;@JsonKey(name: 'latest_at') DateTime get latestAt;@JsonKey(name: 'suspended_at') DateTime? get suspendedAt;@JsonKey(name: 'blocked_at') DateTime? get blockedAt;@JsonKey(name: 'withdrawal_at') DateTime? get withdrawalAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state)&&(identical(other.role, role) || other.role == role)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.email, email) || other.email == email)&&(identical(other.sunSign, sunSign) || other.sunSign == sunSign)&&(identical(other.shadowId, shadowId) || other.shadowId == shadowId)&&(identical(other.dailyQuestionCount, dailyQuestionCount) || other.dailyQuestionCount == dailyQuestionCount)&&(identical(other.isAgreed, isAgreed) || other.isAgreed == isAgreed)&&(identical(other.isBirthCompleted, isBirthCompleted) || other.isBirthCompleted == isBirthCompleted)&&(identical(other.birth, birth) || other.birth == birth)&&(identical(other.lastQuestionDate, lastQuestionDate) || other.lastQuestionDate == lastQuestionDate)&&(identical(other.latestAt, latestAt) || other.latestAt == latestAt)&&(identical(other.suspendedAt, suspendedAt) || other.suspendedAt == suspendedAt)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt)&&(identical(other.withdrawalAt, withdrawalAt) || other.withdrawalAt == withdrawalAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,uid,state,role,provider,email,sunSign,shadowId,dailyQuestionCount,isAgreed,isBirthCompleted,birth,lastQuestionDate,latestAt,suspendedAt,blockedAt,withdrawalAt]);

@override
String toString() {
  return 'User(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, state: $state, role: $role, provider: $provider, email: $email, sunSign: $sunSign, shadowId: $shadowId, dailyQuestionCount: $dailyQuestionCount, isAgreed: $isAgreed, isBirthCompleted: $isBirthCompleted, birth: $birth, lastQuestionDate: $lastQuestionDate, latestAt: $latestAt, suspendedAt: $suspendedAt, blockedAt: $blockedAt, withdrawalAt: $withdrawalAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'state') String state,@JsonKey(name: 'role') String role,@JsonKey(name: 'provider') String provider,@JsonKey(name: 'email') String email,@JsonKey(name: 'sun_sign') String? sunSign,@JsonKey(name: 'shadow_id') String? shadowId,@JsonKey(name: 'daily_question_count') int dailyQuestionCount,@JsonKey(name: 'is_agreed') bool isAgreed,@JsonKey(name: 'is_birth_completed') bool isBirthCompleted,@JsonKey(name: 'birth') DateTime? birth,@JsonKey(name: 'last_question_date') DateTime? lastQuestionDate,@JsonKey(name: 'latest_at') DateTime latestAt,@JsonKey(name: 'suspended_at') DateTime? suspendedAt,@JsonKey(name: 'blocked_at') DateTime? blockedAt,@JsonKey(name: 'withdrawal_at') DateTime? withdrawalAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? uid = null,Object? state = null,Object? role = null,Object? provider = null,Object? email = null,Object? sunSign = freezed,Object? shadowId = freezed,Object? dailyQuestionCount = null,Object? isAgreed = null,Object? isBirthCompleted = null,Object? birth = freezed,Object? lastQuestionDate = freezed,Object? latestAt = null,Object? suspendedAt = freezed,Object? blockedAt = freezed,Object? withdrawalAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,sunSign: freezed == sunSign ? _self.sunSign : sunSign // ignore: cast_nullable_to_non_nullable
as String?,shadowId: freezed == shadowId ? _self.shadowId : shadowId // ignore: cast_nullable_to_non_nullable
as String?,dailyQuestionCount: null == dailyQuestionCount ? _self.dailyQuestionCount : dailyQuestionCount // ignore: cast_nullable_to_non_nullable
as int,isAgreed: null == isAgreed ? _self.isAgreed : isAgreed // ignore: cast_nullable_to_non_nullable
as bool,isBirthCompleted: null == isBirthCompleted ? _self.isBirthCompleted : isBirthCompleted // ignore: cast_nullable_to_non_nullable
as bool,birth: freezed == birth ? _self.birth : birth // ignore: cast_nullable_to_non_nullable
as DateTime?,lastQuestionDate: freezed == lastQuestionDate ? _self.lastQuestionDate : lastQuestionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,latestAt: null == latestAt ? _self.latestAt : latestAt // ignore: cast_nullable_to_non_nullable
as DateTime,suspendedAt: freezed == suspendedAt ? _self.suspendedAt : suspendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,blockedAt: freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,withdrawalAt: freezed == withdrawalAt ? _self.withdrawalAt : withdrawalAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'state')  String state, @JsonKey(name: 'role')  String role, @JsonKey(name: 'provider')  String provider, @JsonKey(name: 'email')  String email, @JsonKey(name: 'sun_sign')  String? sunSign, @JsonKey(name: 'shadow_id')  String? shadowId, @JsonKey(name: 'daily_question_count')  int dailyQuestionCount, @JsonKey(name: 'is_agreed')  bool isAgreed, @JsonKey(name: 'is_birth_completed')  bool isBirthCompleted, @JsonKey(name: 'birth')  DateTime? birth, @JsonKey(name: 'last_question_date')  DateTime? lastQuestionDate, @JsonKey(name: 'latest_at')  DateTime latestAt, @JsonKey(name: 'suspended_at')  DateTime? suspendedAt, @JsonKey(name: 'blocked_at')  DateTime? blockedAt, @JsonKey(name: 'withdrawal_at')  DateTime? withdrawalAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.state,_that.role,_that.provider,_that.email,_that.sunSign,_that.shadowId,_that.dailyQuestionCount,_that.isAgreed,_that.isBirthCompleted,_that.birth,_that.lastQuestionDate,_that.latestAt,_that.suspendedAt,_that.blockedAt,_that.withdrawalAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'state')  String state, @JsonKey(name: 'role')  String role, @JsonKey(name: 'provider')  String provider, @JsonKey(name: 'email')  String email, @JsonKey(name: 'sun_sign')  String? sunSign, @JsonKey(name: 'shadow_id')  String? shadowId, @JsonKey(name: 'daily_question_count')  int dailyQuestionCount, @JsonKey(name: 'is_agreed')  bool isAgreed, @JsonKey(name: 'is_birth_completed')  bool isBirthCompleted, @JsonKey(name: 'birth')  DateTime? birth, @JsonKey(name: 'last_question_date')  DateTime? lastQuestionDate, @JsonKey(name: 'latest_at')  DateTime latestAt, @JsonKey(name: 'suspended_at')  DateTime? suspendedAt, @JsonKey(name: 'blocked_at')  DateTime? blockedAt, @JsonKey(name: 'withdrawal_at')  DateTime? withdrawalAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.state,_that.role,_that.provider,_that.email,_that.sunSign,_that.shadowId,_that.dailyQuestionCount,_that.isAgreed,_that.isBirthCompleted,_that.birth,_that.lastQuestionDate,_that.latestAt,_that.suspendedAt,_that.blockedAt,_that.withdrawalAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'state')  String state, @JsonKey(name: 'role')  String role, @JsonKey(name: 'provider')  String provider, @JsonKey(name: 'email')  String email, @JsonKey(name: 'sun_sign')  String? sunSign, @JsonKey(name: 'shadow_id')  String? shadowId, @JsonKey(name: 'daily_question_count')  int dailyQuestionCount, @JsonKey(name: 'is_agreed')  bool isAgreed, @JsonKey(name: 'is_birth_completed')  bool isBirthCompleted, @JsonKey(name: 'birth')  DateTime? birth, @JsonKey(name: 'last_question_date')  DateTime? lastQuestionDate, @JsonKey(name: 'latest_at')  DateTime latestAt, @JsonKey(name: 'suspended_at')  DateTime? suspendedAt, @JsonKey(name: 'blocked_at')  DateTime? blockedAt, @JsonKey(name: 'withdrawal_at')  DateTime? withdrawalAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.state,_that.role,_that.provider,_that.email,_that.sunSign,_that.shadowId,_that.dailyQuestionCount,_that.isAgreed,_that.isBirthCompleted,_that.birth,_that.lastQuestionDate,_that.latestAt,_that.suspendedAt,_that.blockedAt,_that.withdrawalAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User extends User {
  const _User(@JsonKey(name: 'id') this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'uid') this.uid, @JsonKey(name: 'state') this.state, @JsonKey(name: 'role') this.role, @JsonKey(name: 'provider') this.provider, @JsonKey(name: 'email') this.email, @JsonKey(name: 'sun_sign') this.sunSign, @JsonKey(name: 'shadow_id') this.shadowId, @JsonKey(name: 'daily_question_count') this.dailyQuestionCount, @JsonKey(name: 'is_agreed') this.isAgreed, @JsonKey(name: 'is_birth_completed') this.isBirthCompleted, @JsonKey(name: 'birth') this.birth, @JsonKey(name: 'last_question_date') this.lastQuestionDate, @JsonKey(name: 'latest_at') this.latestAt, @JsonKey(name: 'suspended_at') this.suspendedAt, @JsonKey(name: 'blocked_at') this.blockedAt, @JsonKey(name: 'withdrawal_at') this.withdrawalAt): super._();
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'state') final  String state;
@override@JsonKey(name: 'role') final  String role;
@override@JsonKey(name: 'provider') final  String provider;
@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'sun_sign') final  String? sunSign;
@override@JsonKey(name: 'shadow_id') final  String? shadowId;
@override@JsonKey(name: 'daily_question_count') final  int dailyQuestionCount;
@override@JsonKey(name: 'is_agreed') final  bool isAgreed;
@override@JsonKey(name: 'is_birth_completed') final  bool isBirthCompleted;
@override@JsonKey(name: 'birth') final  DateTime? birth;
@override@JsonKey(name: 'last_question_date') final  DateTime? lastQuestionDate;
@override@JsonKey(name: 'latest_at') final  DateTime latestAt;
@override@JsonKey(name: 'suspended_at') final  DateTime? suspendedAt;
@override@JsonKey(name: 'blocked_at') final  DateTime? blockedAt;
@override@JsonKey(name: 'withdrawal_at') final  DateTime? withdrawalAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state)&&(identical(other.role, role) || other.role == role)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.email, email) || other.email == email)&&(identical(other.sunSign, sunSign) || other.sunSign == sunSign)&&(identical(other.shadowId, shadowId) || other.shadowId == shadowId)&&(identical(other.dailyQuestionCount, dailyQuestionCount) || other.dailyQuestionCount == dailyQuestionCount)&&(identical(other.isAgreed, isAgreed) || other.isAgreed == isAgreed)&&(identical(other.isBirthCompleted, isBirthCompleted) || other.isBirthCompleted == isBirthCompleted)&&(identical(other.birth, birth) || other.birth == birth)&&(identical(other.lastQuestionDate, lastQuestionDate) || other.lastQuestionDate == lastQuestionDate)&&(identical(other.latestAt, latestAt) || other.latestAt == latestAt)&&(identical(other.suspendedAt, suspendedAt) || other.suspendedAt == suspendedAt)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt)&&(identical(other.withdrawalAt, withdrawalAt) || other.withdrawalAt == withdrawalAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,uid,state,role,provider,email,sunSign,shadowId,dailyQuestionCount,isAgreed,isBirthCompleted,birth,lastQuestionDate,latestAt,suspendedAt,blockedAt,withdrawalAt]);

@override
String toString() {
  return 'User(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, state: $state, role: $role, provider: $provider, email: $email, sunSign: $sunSign, shadowId: $shadowId, dailyQuestionCount: $dailyQuestionCount, isAgreed: $isAgreed, isBirthCompleted: $isBirthCompleted, birth: $birth, lastQuestionDate: $lastQuestionDate, latestAt: $latestAt, suspendedAt: $suspendedAt, blockedAt: $blockedAt, withdrawalAt: $withdrawalAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'state') String state,@JsonKey(name: 'role') String role,@JsonKey(name: 'provider') String provider,@JsonKey(name: 'email') String email,@JsonKey(name: 'sun_sign') String? sunSign,@JsonKey(name: 'shadow_id') String? shadowId,@JsonKey(name: 'daily_question_count') int dailyQuestionCount,@JsonKey(name: 'is_agreed') bool isAgreed,@JsonKey(name: 'is_birth_completed') bool isBirthCompleted,@JsonKey(name: 'birth') DateTime? birth,@JsonKey(name: 'last_question_date') DateTime? lastQuestionDate,@JsonKey(name: 'latest_at') DateTime latestAt,@JsonKey(name: 'suspended_at') DateTime? suspendedAt,@JsonKey(name: 'blocked_at') DateTime? blockedAt,@JsonKey(name: 'withdrawal_at') DateTime? withdrawalAt
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? uid = null,Object? state = null,Object? role = null,Object? provider = null,Object? email = null,Object? sunSign = freezed,Object? shadowId = freezed,Object? dailyQuestionCount = null,Object? isAgreed = null,Object? isBirthCompleted = null,Object? birth = freezed,Object? lastQuestionDate = freezed,Object? latestAt = null,Object? suspendedAt = freezed,Object? blockedAt = freezed,Object? withdrawalAt = freezed,}) {
  return _then(_User(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,freezed == sunSign ? _self.sunSign : sunSign // ignore: cast_nullable_to_non_nullable
as String?,freezed == shadowId ? _self.shadowId : shadowId // ignore: cast_nullable_to_non_nullable
as String?,null == dailyQuestionCount ? _self.dailyQuestionCount : dailyQuestionCount // ignore: cast_nullable_to_non_nullable
as int,null == isAgreed ? _self.isAgreed : isAgreed // ignore: cast_nullable_to_non_nullable
as bool,null == isBirthCompleted ? _self.isBirthCompleted : isBirthCompleted // ignore: cast_nullable_to_non_nullable
as bool,freezed == birth ? _self.birth : birth // ignore: cast_nullable_to_non_nullable
as DateTime?,freezed == lastQuestionDate ? _self.lastQuestionDate : lastQuestionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,null == latestAt ? _self.latestAt : latestAt // ignore: cast_nullable_to_non_nullable
as DateTime,freezed == suspendedAt ? _self.suspendedAt : suspendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,freezed == withdrawalAt ? _self.withdrawalAt : withdrawalAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
