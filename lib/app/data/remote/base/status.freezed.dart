// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$State<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String? reason) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<T, $Res> {
  factory $StateCopyWith(Status<T> value, $Res Function(Status<T>) then) =
      _$StateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StateCopyWithImpl<T, $Res> implements $StateCopyWith<T, $Res> {
  _$StateCopyWithImpl(this._value, this._then);

  final Status<T> _value;
  // ignore: unused_field
  final $Res Function(Status<T>) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<T, $Res> {
  factory _$$IdleCopyWith(_$Idle<T> value, $Res Function(_$Idle<T>) then) =
      __$$IdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$$IdleCopyWith<T, $Res> {
  __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
      : super(_value, (v) => _then(v as _$Idle<T>));

  @override
  _$Idle<T> get _value => super._value as _$Idle<T>;
}

/// @nodoc

class _$Idle<T> with DiagnosticableTreeMixin implements Idle<T> {
  const _$Idle();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'State<$T>.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'State<$T>.idle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String? reason) failure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements Status<T> {
  const factory Idle() = _$Idle<T>;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, (v) => _then(v as _$Loading<T>));

  @override
  _$Loading<T> get _value => super._value as _$Loading<T>;
}

/// @nodoc

class _$Loading<T> with DiagnosticableTreeMixin implements Loading<T> {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'State<$T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'State<$T>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String? reason) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements Status<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  $Res call({T? data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, (v) => _then(v as _$Success<T>));

  @override
  _$Success<T> get _value => super._value as _$Success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Success<T> with DiagnosticableTreeMixin implements Success<T> {
  const _$Success({this.data});

  @override
  final T? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'State<$T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'State<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String? reason) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements Status<T> {
  const factory Success({final T? data}) = _$Success<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<T, $Res> {
  factory _$$FailureCopyWith(
          _$Failure<T> value, $Res Function(_$Failure<T>) then) =
      __$$FailureCopyWithImpl<T, $Res>;
  $Res call({String? reason});
}

/// @nodoc
class __$$FailureCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$$FailureCopyWith<T, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<T> _value, $Res Function(_$Failure<T>) _then)
      : super(_value, (v) => _then(v as _$Failure<T>));

  @override
  _$Failure<T> get _value => super._value as _$Failure<T>;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$Failure<T>(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Failure<T> with DiagnosticableTreeMixin implements Failure<T> {
  const _$Failure({this.reason});

  @override
  final String? reason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'State<$T>.failure(reason: $reason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'State<$T>.failure'))
      ..add(DiagnosticsProperty('reason', reason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<T> &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
      __$$FailureCopyWithImpl<T, _$Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String? reason) failure,
  }) {
    return failure(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
  }) {
    return failure?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String? reason)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements Status<T> {
  const factory Failure({final String? reason}) = _$Failure<T>;

  String? get reason;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
