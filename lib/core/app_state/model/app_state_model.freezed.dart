// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'language') String get language;@JsonKey(name: 'ios_app_version') String get iosAppVersion;@JsonKey(name: 'android_app_version') String get androidAppVersion;@JsonKey(name: 'update_title') String get updateTitle;@JsonKey(name: 'maintenance_title') String get maintenanceTitle;@JsonKey(name: 'maintenance_start_at') DateTime? get maintenanceStartAt;@JsonKey(name: 'maintenance_end_at') DateTime? get maintenanceEndAt;@JsonKey(defaultValue: '1.0.0') String get packageInfoVersion;@JsonKey(defaultValue: false) bool get hasDialog;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.id, id) || other.id == id)&&(identical(other.language, language) || other.language == language)&&(identical(other.iosAppVersion, iosAppVersion) || other.iosAppVersion == iosAppVersion)&&(identical(other.androidAppVersion, androidAppVersion) || other.androidAppVersion == androidAppVersion)&&(identical(other.updateTitle, updateTitle) || other.updateTitle == updateTitle)&&(identical(other.maintenanceTitle, maintenanceTitle) || other.maintenanceTitle == maintenanceTitle)&&(identical(other.maintenanceStartAt, maintenanceStartAt) || other.maintenanceStartAt == maintenanceStartAt)&&(identical(other.maintenanceEndAt, maintenanceEndAt) || other.maintenanceEndAt == maintenanceEndAt)&&(identical(other.packageInfoVersion, packageInfoVersion) || other.packageInfoVersion == packageInfoVersion)&&(identical(other.hasDialog, hasDialog) || other.hasDialog == hasDialog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,language,iosAppVersion,androidAppVersion,updateTitle,maintenanceTitle,maintenanceStartAt,maintenanceEndAt,packageInfoVersion,hasDialog);

@override
String toString() {
  return 'AppState(id: $id, language: $language, iosAppVersion: $iosAppVersion, androidAppVersion: $androidAppVersion, updateTitle: $updateTitle, maintenanceTitle: $maintenanceTitle, maintenanceStartAt: $maintenanceStartAt, maintenanceEndAt: $maintenanceEndAt, packageInfoVersion: $packageInfoVersion, hasDialog: $hasDialog)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'language') String language,@JsonKey(name: 'ios_app_version') String iosAppVersion,@JsonKey(name: 'android_app_version') String androidAppVersion,@JsonKey(name: 'update_title') String updateTitle,@JsonKey(name: 'maintenance_title') String maintenanceTitle,@JsonKey(name: 'maintenance_start_at') DateTime? maintenanceStartAt,@JsonKey(name: 'maintenance_end_at') DateTime? maintenanceEndAt,@JsonKey(defaultValue: '1.0.0') String packageInfoVersion,@JsonKey(defaultValue: false) bool hasDialog
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? language = null,Object? iosAppVersion = null,Object? androidAppVersion = null,Object? updateTitle = null,Object? maintenanceTitle = null,Object? maintenanceStartAt = freezed,Object? maintenanceEndAt = freezed,Object? packageInfoVersion = null,Object? hasDialog = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,iosAppVersion: null == iosAppVersion ? _self.iosAppVersion : iosAppVersion // ignore: cast_nullable_to_non_nullable
as String,androidAppVersion: null == androidAppVersion ? _self.androidAppVersion : androidAppVersion // ignore: cast_nullable_to_non_nullable
as String,updateTitle: null == updateTitle ? _self.updateTitle : updateTitle // ignore: cast_nullable_to_non_nullable
as String,maintenanceTitle: null == maintenanceTitle ? _self.maintenanceTitle : maintenanceTitle // ignore: cast_nullable_to_non_nullable
as String,maintenanceStartAt: freezed == maintenanceStartAt ? _self.maintenanceStartAt : maintenanceStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maintenanceEndAt: freezed == maintenanceEndAt ? _self.maintenanceEndAt : maintenanceEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,packageInfoVersion: null == packageInfoVersion ? _self.packageInfoVersion : packageInfoVersion // ignore: cast_nullable_to_non_nullable
as String,hasDialog: null == hasDialog ? _self.hasDialog : hasDialog // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'language')  String language, @JsonKey(name: 'ios_app_version')  String iosAppVersion, @JsonKey(name: 'android_app_version')  String androidAppVersion, @JsonKey(name: 'update_title')  String updateTitle, @JsonKey(name: 'maintenance_title')  String maintenanceTitle, @JsonKey(name: 'maintenance_start_at')  DateTime? maintenanceStartAt, @JsonKey(name: 'maintenance_end_at')  DateTime? maintenanceEndAt, @JsonKey(defaultValue: '1.0.0')  String packageInfoVersion, @JsonKey(defaultValue: false)  bool hasDialog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.id,_that.language,_that.iosAppVersion,_that.androidAppVersion,_that.updateTitle,_that.maintenanceTitle,_that.maintenanceStartAt,_that.maintenanceEndAt,_that.packageInfoVersion,_that.hasDialog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'language')  String language, @JsonKey(name: 'ios_app_version')  String iosAppVersion, @JsonKey(name: 'android_app_version')  String androidAppVersion, @JsonKey(name: 'update_title')  String updateTitle, @JsonKey(name: 'maintenance_title')  String maintenanceTitle, @JsonKey(name: 'maintenance_start_at')  DateTime? maintenanceStartAt, @JsonKey(name: 'maintenance_end_at')  DateTime? maintenanceEndAt, @JsonKey(defaultValue: '1.0.0')  String packageInfoVersion, @JsonKey(defaultValue: false)  bool hasDialog)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.id,_that.language,_that.iosAppVersion,_that.androidAppVersion,_that.updateTitle,_that.maintenanceTitle,_that.maintenanceStartAt,_that.maintenanceEndAt,_that.packageInfoVersion,_that.hasDialog);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'language')  String language, @JsonKey(name: 'ios_app_version')  String iosAppVersion, @JsonKey(name: 'android_app_version')  String androidAppVersion, @JsonKey(name: 'update_title')  String updateTitle, @JsonKey(name: 'maintenance_title')  String maintenanceTitle, @JsonKey(name: 'maintenance_start_at')  DateTime? maintenanceStartAt, @JsonKey(name: 'maintenance_end_at')  DateTime? maintenanceEndAt, @JsonKey(defaultValue: '1.0.0')  String packageInfoVersion, @JsonKey(defaultValue: false)  bool hasDialog)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.id,_that.language,_that.iosAppVersion,_that.androidAppVersion,_that.updateTitle,_that.maintenanceTitle,_that.maintenanceStartAt,_that.maintenanceEndAt,_that.packageInfoVersion,_that.hasDialog);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppState extends AppState {
  const _AppState(@JsonKey(name: 'id') this.id, @JsonKey(name: 'language') this.language, @JsonKey(name: 'ios_app_version') this.iosAppVersion, @JsonKey(name: 'android_app_version') this.androidAppVersion, @JsonKey(name: 'update_title') this.updateTitle, @JsonKey(name: 'maintenance_title') this.maintenanceTitle, @JsonKey(name: 'maintenance_start_at') this.maintenanceStartAt, @JsonKey(name: 'maintenance_end_at') this.maintenanceEndAt, @JsonKey(defaultValue: '1.0.0') this.packageInfoVersion, @JsonKey(defaultValue: false) this.hasDialog): super._();
  factory _AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'language') final  String language;
@override@JsonKey(name: 'ios_app_version') final  String iosAppVersion;
@override@JsonKey(name: 'android_app_version') final  String androidAppVersion;
@override@JsonKey(name: 'update_title') final  String updateTitle;
@override@JsonKey(name: 'maintenance_title') final  String maintenanceTitle;
@override@JsonKey(name: 'maintenance_start_at') final  DateTime? maintenanceStartAt;
@override@JsonKey(name: 'maintenance_end_at') final  DateTime? maintenanceEndAt;
@override@JsonKey(defaultValue: '1.0.0') final  String packageInfoVersion;
@override@JsonKey(defaultValue: false) final  bool hasDialog;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.id, id) || other.id == id)&&(identical(other.language, language) || other.language == language)&&(identical(other.iosAppVersion, iosAppVersion) || other.iosAppVersion == iosAppVersion)&&(identical(other.androidAppVersion, androidAppVersion) || other.androidAppVersion == androidAppVersion)&&(identical(other.updateTitle, updateTitle) || other.updateTitle == updateTitle)&&(identical(other.maintenanceTitle, maintenanceTitle) || other.maintenanceTitle == maintenanceTitle)&&(identical(other.maintenanceStartAt, maintenanceStartAt) || other.maintenanceStartAt == maintenanceStartAt)&&(identical(other.maintenanceEndAt, maintenanceEndAt) || other.maintenanceEndAt == maintenanceEndAt)&&(identical(other.packageInfoVersion, packageInfoVersion) || other.packageInfoVersion == packageInfoVersion)&&(identical(other.hasDialog, hasDialog) || other.hasDialog == hasDialog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,language,iosAppVersion,androidAppVersion,updateTitle,maintenanceTitle,maintenanceStartAt,maintenanceEndAt,packageInfoVersion,hasDialog);

@override
String toString() {
  return 'AppState(id: $id, language: $language, iosAppVersion: $iosAppVersion, androidAppVersion: $androidAppVersion, updateTitle: $updateTitle, maintenanceTitle: $maintenanceTitle, maintenanceStartAt: $maintenanceStartAt, maintenanceEndAt: $maintenanceEndAt, packageInfoVersion: $packageInfoVersion, hasDialog: $hasDialog)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'language') String language,@JsonKey(name: 'ios_app_version') String iosAppVersion,@JsonKey(name: 'android_app_version') String androidAppVersion,@JsonKey(name: 'update_title') String updateTitle,@JsonKey(name: 'maintenance_title') String maintenanceTitle,@JsonKey(name: 'maintenance_start_at') DateTime? maintenanceStartAt,@JsonKey(name: 'maintenance_end_at') DateTime? maintenanceEndAt,@JsonKey(defaultValue: '1.0.0') String packageInfoVersion,@JsonKey(defaultValue: false) bool hasDialog
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? language = null,Object? iosAppVersion = null,Object? androidAppVersion = null,Object? updateTitle = null,Object? maintenanceTitle = null,Object? maintenanceStartAt = freezed,Object? maintenanceEndAt = freezed,Object? packageInfoVersion = null,Object? hasDialog = null,}) {
  return _then(_AppState(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,null == iosAppVersion ? _self.iosAppVersion : iosAppVersion // ignore: cast_nullable_to_non_nullable
as String,null == androidAppVersion ? _self.androidAppVersion : androidAppVersion // ignore: cast_nullable_to_non_nullable
as String,null == updateTitle ? _self.updateTitle : updateTitle // ignore: cast_nullable_to_non_nullable
as String,null == maintenanceTitle ? _self.maintenanceTitle : maintenanceTitle // ignore: cast_nullable_to_non_nullable
as String,freezed == maintenanceStartAt ? _self.maintenanceStartAt : maintenanceStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,freezed == maintenanceEndAt ? _self.maintenanceEndAt : maintenanceEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,null == packageInfoVersion ? _self.packageInfoVersion : packageInfoVersion // ignore: cast_nullable_to_non_nullable
as String,null == hasDialog ? _self.hasDialog : hasDialog // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
