// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reading {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'question') String get question;@JsonKey(name: 'interpretation') String? get interpretation;@JsonKey(name: 'unsaid_line') String get unsaidLine;
/// Create a copy of Reading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingCopyWith<Reading> get copyWith => _$ReadingCopyWithImpl<Reading>(this as Reading, _$identity);

  /// Serializes this Reading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reading&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.question, question) || other.question == question)&&(identical(other.interpretation, interpretation) || other.interpretation == interpretation)&&(identical(other.unsaidLine, unsaidLine) || other.unsaidLine == unsaidLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,uid,question,interpretation,unsaidLine);

@override
String toString() {
  return 'Reading(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, question: $question, interpretation: $interpretation, unsaidLine: $unsaidLine)';
}


}

/// @nodoc
abstract mixin class $ReadingCopyWith<$Res>  {
  factory $ReadingCopyWith(Reading value, $Res Function(Reading) _then) = _$ReadingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'question') String question,@JsonKey(name: 'interpretation') String? interpretation,@JsonKey(name: 'unsaid_line') String unsaidLine
});




}
/// @nodoc
class _$ReadingCopyWithImpl<$Res>
    implements $ReadingCopyWith<$Res> {
  _$ReadingCopyWithImpl(this._self, this._then);

  final Reading _self;
  final $Res Function(Reading) _then;

/// Create a copy of Reading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? uid = null,Object? question = null,Object? interpretation = freezed,Object? unsaidLine = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,interpretation: freezed == interpretation ? _self.interpretation : interpretation // ignore: cast_nullable_to_non_nullable
as String?,unsaidLine: null == unsaidLine ? _self.unsaidLine : unsaidLine // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Reading].
extension ReadingPatterns on Reading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reading value)  $default,){
final _that = this;
switch (_that) {
case _Reading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reading value)?  $default,){
final _that = this;
switch (_that) {
case _Reading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'question')  String question, @JsonKey(name: 'interpretation')  String? interpretation, @JsonKey(name: 'unsaid_line')  String unsaidLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reading() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.question,_that.interpretation,_that.unsaidLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'question')  String question, @JsonKey(name: 'interpretation')  String? interpretation, @JsonKey(name: 'unsaid_line')  String unsaidLine)  $default,) {final _that = this;
switch (_that) {
case _Reading():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.question,_that.interpretation,_that.unsaidLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'question')  String question, @JsonKey(name: 'interpretation')  String? interpretation, @JsonKey(name: 'unsaid_line')  String unsaidLine)?  $default,) {final _that = this;
switch (_that) {
case _Reading() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.uid,_that.question,_that.interpretation,_that.unsaidLine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reading extends Reading {
  const _Reading(@JsonKey(name: 'id') this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'uid') this.uid, @JsonKey(name: 'question') this.question, @JsonKey(name: 'interpretation') this.interpretation, @JsonKey(name: 'unsaid_line') this.unsaidLine): super._();
  factory _Reading.fromJson(Map<String, dynamic> json) => _$ReadingFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'question') final  String question;
@override@JsonKey(name: 'interpretation') final  String? interpretation;
@override@JsonKey(name: 'unsaid_line') final  String unsaidLine;

/// Create a copy of Reading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingCopyWith<_Reading> get copyWith => __$ReadingCopyWithImpl<_Reading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reading&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.question, question) || other.question == question)&&(identical(other.interpretation, interpretation) || other.interpretation == interpretation)&&(identical(other.unsaidLine, unsaidLine) || other.unsaidLine == unsaidLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,uid,question,interpretation,unsaidLine);

@override
String toString() {
  return 'Reading(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, question: $question, interpretation: $interpretation, unsaidLine: $unsaidLine)';
}


}

/// @nodoc
abstract mixin class _$ReadingCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$ReadingCopyWith(_Reading value, $Res Function(_Reading) _then) = __$ReadingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'question') String question,@JsonKey(name: 'interpretation') String? interpretation,@JsonKey(name: 'unsaid_line') String unsaidLine
});




}
/// @nodoc
class __$ReadingCopyWithImpl<$Res>
    implements _$ReadingCopyWith<$Res> {
  __$ReadingCopyWithImpl(this._self, this._then);

  final _Reading _self;
  final $Res Function(_Reading) _then;

/// Create a copy of Reading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? uid = null,Object? question = null,Object? interpretation = freezed,Object? unsaidLine = null,}) {
  return _then(_Reading(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,freezed == interpretation ? _self.interpretation : interpretation // ignore: cast_nullable_to_non_nullable
as String?,null == unsaidLine ? _self.unsaidLine : unsaidLine // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
