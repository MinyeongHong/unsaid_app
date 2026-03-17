// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zodiac_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Zodiac {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'zodiac_shadows') List<ZodiacShadow> get zodiacShadows;
/// Create a copy of Zodiac
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodiacCopyWith<Zodiac> get copyWith => _$ZodiacCopyWithImpl<Zodiac>(this as Zodiac, _$identity);

  /// Serializes this Zodiac to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Zodiac&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.zodiacShadows, zodiacShadows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(zodiacShadows));

@override
String toString() {
  return 'Zodiac(id: $id, name: $name, zodiacShadows: $zodiacShadows)';
}


}

/// @nodoc
abstract mixin class $ZodiacCopyWith<$Res>  {
  factory $ZodiacCopyWith(Zodiac value, $Res Function(Zodiac) _then) = _$ZodiacCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'zodiac_shadows') List<ZodiacShadow> zodiacShadows
});




}
/// @nodoc
class _$ZodiacCopyWithImpl<$Res>
    implements $ZodiacCopyWith<$Res> {
  _$ZodiacCopyWithImpl(this._self, this._then);

  final Zodiac _self;
  final $Res Function(Zodiac) _then;

/// Create a copy of Zodiac
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? zodiacShadows = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,zodiacShadows: null == zodiacShadows ? _self.zodiacShadows : zodiacShadows // ignore: cast_nullable_to_non_nullable
as List<ZodiacShadow>,
  ));
}

}


/// Adds pattern-matching-related methods to [Zodiac].
extension ZodiacPatterns on Zodiac {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Zodiac value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Zodiac() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Zodiac value)  $default,){
final _that = this;
switch (_that) {
case _Zodiac():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Zodiac value)?  $default,){
final _that = this;
switch (_that) {
case _Zodiac() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'zodiac_shadows')  List<ZodiacShadow> zodiacShadows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Zodiac() when $default != null:
return $default(_that.id,_that.name,_that.zodiacShadows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'zodiac_shadows')  List<ZodiacShadow> zodiacShadows)  $default,) {final _that = this;
switch (_that) {
case _Zodiac():
return $default(_that.id,_that.name,_that.zodiacShadows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'zodiac_shadows')  List<ZodiacShadow> zodiacShadows)?  $default,) {final _that = this;
switch (_that) {
case _Zodiac() when $default != null:
return $default(_that.id,_that.name,_that.zodiacShadows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Zodiac extends Zodiac {
  const _Zodiac(@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'zodiac_shadows') final  List<ZodiacShadow> zodiacShadows): _zodiacShadows = zodiacShadows,super._();
  factory _Zodiac.fromJson(Map<String, dynamic> json) => _$ZodiacFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
 final  List<ZodiacShadow> _zodiacShadows;
@override@JsonKey(name: 'zodiac_shadows') List<ZodiacShadow> get zodiacShadows {
  if (_zodiacShadows is EqualUnmodifiableListView) return _zodiacShadows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zodiacShadows);
}


/// Create a copy of Zodiac
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZodiacCopyWith<_Zodiac> get copyWith => __$ZodiacCopyWithImpl<_Zodiac>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZodiacToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Zodiac&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._zodiacShadows, _zodiacShadows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_zodiacShadows));

@override
String toString() {
  return 'Zodiac(id: $id, name: $name, zodiacShadows: $zodiacShadows)';
}


}

/// @nodoc
abstract mixin class _$ZodiacCopyWith<$Res> implements $ZodiacCopyWith<$Res> {
  factory _$ZodiacCopyWith(_Zodiac value, $Res Function(_Zodiac) _then) = __$ZodiacCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'zodiac_shadows') List<ZodiacShadow> zodiacShadows
});




}
/// @nodoc
class __$ZodiacCopyWithImpl<$Res>
    implements _$ZodiacCopyWith<$Res> {
  __$ZodiacCopyWithImpl(this._self, this._then);

  final _Zodiac _self;
  final $Res Function(_Zodiac) _then;

/// Create a copy of Zodiac
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? zodiacShadows = null,}) {
  return _then(_Zodiac(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,null == zodiacShadows ? _self._zodiacShadows : zodiacShadows // ignore: cast_nullable_to_non_nullable
as List<ZodiacShadow>,
  ));
}


}


/// @nodoc
mixin _$ZodiacShadow {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'title') String get title;@JsonKey(name: 'description') String get description;
/// Create a copy of ZodiacShadow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodiacShadowCopyWith<ZodiacShadow> get copyWith => _$ZodiacShadowCopyWithImpl<ZodiacShadow>(this as ZodiacShadow, _$identity);

  /// Serializes this ZodiacShadow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodiacShadow&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ZodiacShadow(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ZodiacShadowCopyWith<$Res>  {
  factory $ZodiacShadowCopyWith(ZodiacShadow value, $Res Function(ZodiacShadow) _then) = _$ZodiacShadowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'title') String title,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class _$ZodiacShadowCopyWithImpl<$Res>
    implements $ZodiacShadowCopyWith<$Res> {
  _$ZodiacShadowCopyWithImpl(this._self, this._then);

  final ZodiacShadow _self;
  final $Res Function(ZodiacShadow) _then;

/// Create a copy of ZodiacShadow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ZodiacShadow].
extension ZodiacShadowPatterns on ZodiacShadow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZodiacShadow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZodiacShadow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZodiacShadow value)  $default,){
final _that = this;
switch (_that) {
case _ZodiacShadow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZodiacShadow value)?  $default,){
final _that = this;
switch (_that) {
case _ZodiacShadow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'description')  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZodiacShadow() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'description')  String description)  $default,) {final _that = this;
switch (_that) {
case _ZodiacShadow():
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'description')  String description)?  $default,) {final _that = this;
switch (_that) {
case _ZodiacShadow() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZodiacShadow extends ZodiacShadow {
  const _ZodiacShadow(@JsonKey(name: 'id') this.id, @JsonKey(name: 'title') this.title, @JsonKey(name: 'description') this.description): super._();
  factory _ZodiacShadow.fromJson(Map<String, dynamic> json) => _$ZodiacShadowFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'description') final  String description;

/// Create a copy of ZodiacShadow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZodiacShadowCopyWith<_ZodiacShadow> get copyWith => __$ZodiacShadowCopyWithImpl<_ZodiacShadow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZodiacShadowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZodiacShadow&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ZodiacShadow(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ZodiacShadowCopyWith<$Res> implements $ZodiacShadowCopyWith<$Res> {
  factory _$ZodiacShadowCopyWith(_ZodiacShadow value, $Res Function(_ZodiacShadow) _then) = __$ZodiacShadowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'title') String title,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class __$ZodiacShadowCopyWithImpl<$Res>
    implements _$ZodiacShadowCopyWith<$Res> {
  __$ZodiacShadowCopyWithImpl(this._self, this._then);

  final _ZodiacShadow _self;
  final $Res Function(_ZodiacShadow) _then;

/// Create a copy of ZodiacShadow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,}) {
  return _then(_ZodiacShadow(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
