// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RouteEvent()';
}


}

/// @nodoc
class $RouteEventCopyWith<$Res>  {
$RouteEventCopyWith(RouteEvent _, $Res Function(RouteEvent) __);
}


/// Adds pattern-matching-related methods to [RouteEvent].
extension RouteEventPatterns on RouteEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _Add value)?  add,TResult Function( _Delete value)?  delete,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Add() when add != null:
return add(_that);case _Delete() when delete != null:
return delete(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _Add value)  add,required TResult Function( _Delete value)  delete,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _Add():
return add(_that);case _Delete():
return delete(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _Add value)?  add,TResult? Function( _Delete value)?  delete,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Add() when add != null:
return add(_that);case _Delete() when delete != null:
return delete(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function( PageData pageData)?  add,TResult Function( Page page)?  delete,TResult Function( PageData pageData)?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _Add() when add != null:
return add(_that.pageData);case _Delete() when delete != null:
return delete(_that.page);case _Reset() when reset != null:
return reset(_that.pageData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function( PageData pageData)  add,required TResult Function( Page page)  delete,required TResult Function( PageData pageData)  reset,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch();case _Add():
return add(_that.pageData);case _Delete():
return delete(_that.page);case _Reset():
return reset(_that.pageData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function( PageData pageData)?  add,TResult? Function( Page page)?  delete,TResult? Function( PageData pageData)?  reset,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _Add() when add != null:
return add(_that.pageData);case _Delete() when delete != null:
return delete(_that.page);case _Reset() when reset != null:
return reset(_that.pageData);case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements RouteEvent {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RouteEvent.fetch()';
}


}




/// @nodoc


class _Add implements RouteEvent {
  const _Add(this.pageData);
  

 final  PageData pageData;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.pageData, pageData) || other.pageData == pageData));
}


@override
int get hashCode => Object.hash(runtimeType,pageData);

@override
String toString() {
  return 'RouteEvent.add(pageData: $pageData)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $RouteEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 PageData pageData
});




}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageData = null,}) {
  return _then(_Add(
null == pageData ? _self.pageData : pageData // ignore: cast_nullable_to_non_nullable
as PageData,
  ));
}


}

/// @nodoc


class _Delete implements RouteEvent {
  const _Delete(this.page);
  

 final  Page page;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'RouteEvent.delete(page: $page)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $RouteEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Page page
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_Delete(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as Page,
  ));
}


}

/// @nodoc


class _Reset implements RouteEvent {
  const _Reset(this.pageData);
  

 final  PageData pageData;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetCopyWith<_Reset> get copyWith => __$ResetCopyWithImpl<_Reset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset&&(identical(other.pageData, pageData) || other.pageData == pageData));
}


@override
int get hashCode => Object.hash(runtimeType,pageData);

@override
String toString() {
  return 'RouteEvent.reset(pageData: $pageData)';
}


}

/// @nodoc
abstract mixin class _$ResetCopyWith<$Res> implements $RouteEventCopyWith<$Res> {
  factory _$ResetCopyWith(_Reset value, $Res Function(_Reset) _then) = __$ResetCopyWithImpl;
@useResult
$Res call({
 PageData pageData
});




}
/// @nodoc
class __$ResetCopyWithImpl<$Res>
    implements _$ResetCopyWith<$Res> {
  __$ResetCopyWithImpl(this._self, this._then);

  final _Reset _self;
  final $Res Function(_Reset) _then;

/// Create a copy of RouteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageData = null,}) {
  return _then(_Reset(
null == pageData ? _self.pageData : pageData // ignore: cast_nullable_to_non_nullable
as PageData,
  ));
}


}

/// @nodoc
mixin _$RouteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RouteState()';
}


}

/// @nodoc
class $RouteStateCopyWith<$Res>  {
$RouteStateCopyWith(RouteState _, $Res Function(RouteState) __);
}


/// Adds pattern-matching-related methods to [RouteState].
extension RouteStatePatterns on RouteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( RouteData routeData)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.routeData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( RouteData routeData)  success,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Success():
return success(_that.routeData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( RouteData routeData)?  success,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.routeData);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements RouteState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RouteState.loading()';
}


}




/// @nodoc


class _Success implements RouteState {
  const _Success(this.routeData);
  

 final  RouteData routeData;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.routeData, routeData) || other.routeData == routeData));
}


@override
int get hashCode => Object.hash(runtimeType,routeData);

@override
String toString() {
  return 'RouteState.success(routeData: $routeData)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $RouteStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 RouteData routeData
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? routeData = null,}) {
  return _then(_Success(
null == routeData ? _self.routeData : routeData // ignore: cast_nullable_to_non_nullable
as RouteData,
  ));
}


}

// dart format on
