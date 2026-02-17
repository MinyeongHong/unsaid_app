// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSetting {

@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'is_marketing') bool get isMarketing;
/// Create a copy of UserSetting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingCopyWith<UserSetting> get copyWith => _$UserSettingCopyWithImpl<UserSetting>(this as UserSetting, _$identity);

  /// Serializes this UserSetting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSetting&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMarketing, isMarketing) || other.isMarketing == isMarketing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,createdAt,updatedAt,isMarketing);

@override
String toString() {
  return 'UserSetting(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isMarketing: $isMarketing)';
}


}

/// @nodoc
abstract mixin class $UserSettingCopyWith<$Res>  {
  factory $UserSettingCopyWith(UserSetting value, $Res Function(UserSetting) _then) = _$UserSettingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'uid') String uid,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_marketing') bool isMarketing
});




}
/// @nodoc
class _$UserSettingCopyWithImpl<$Res>
    implements $UserSettingCopyWith<$Res> {
  _$UserSettingCopyWithImpl(this._self, this._then);

  final UserSetting _self;
  final $Res Function(UserSetting) _then;

/// Create a copy of UserSetting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? createdAt = null,Object? updatedAt = null,Object? isMarketing = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMarketing: null == isMarketing ? _self.isMarketing : isMarketing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSetting].
extension UserSettingPatterns on UserSetting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSetting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSetting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSetting value)  $default,){
final _that = this;
switch (_that) {
case _UserSetting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSetting value)?  $default,){
final _that = this;
switch (_that) {
case _UserSetting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'uid')  String uid, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_marketing')  bool isMarketing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSetting() when $default != null:
return $default(_that.uid,_that.createdAt,_that.updatedAt,_that.isMarketing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'uid')  String uid, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_marketing')  bool isMarketing)  $default,) {final _that = this;
switch (_that) {
case _UserSetting():
return $default(_that.uid,_that.createdAt,_that.updatedAt,_that.isMarketing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'uid')  String uid, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_marketing')  bool isMarketing)?  $default,) {final _that = this;
switch (_that) {
case _UserSetting() when $default != null:
return $default(_that.uid,_that.createdAt,_that.updatedAt,_that.isMarketing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSetting extends UserSetting {
  const _UserSetting(@JsonKey(name: 'uid') this.uid, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'is_marketing') this.isMarketing): super._();
  factory _UserSetting.fromJson(Map<String, dynamic> json) => _$UserSettingFromJson(json);

@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'is_marketing') final  bool isMarketing;

/// Create a copy of UserSetting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingCopyWith<_UserSetting> get copyWith => __$UserSettingCopyWithImpl<_UserSetting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSetting&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMarketing, isMarketing) || other.isMarketing == isMarketing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,createdAt,updatedAt,isMarketing);

@override
String toString() {
  return 'UserSetting(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isMarketing: $isMarketing)';
}


}

/// @nodoc
abstract mixin class _$UserSettingCopyWith<$Res> implements $UserSettingCopyWith<$Res> {
  factory _$UserSettingCopyWith(_UserSetting value, $Res Function(_UserSetting) _then) = __$UserSettingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'uid') String uid,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_marketing') bool isMarketing
});




}
/// @nodoc
class __$UserSettingCopyWithImpl<$Res>
    implements _$UserSettingCopyWith<$Res> {
  __$UserSettingCopyWithImpl(this._self, this._then);

  final _UserSetting _self;
  final $Res Function(_UserSetting) _then;

/// Create a copy of UserSetting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? createdAt = null,Object? updatedAt = null,Object? isMarketing = null,}) {
  return _then(_UserSetting(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == isMarketing ? _self.isMarketing : isMarketing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
