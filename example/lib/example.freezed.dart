// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String errorMessage) serverFailure,
    required TResult Function(int? statusCode) httpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownApiFailure value) unknown,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_HttpError value) httpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res> implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  final ApiFailure _value;
  // ignore: unused_field
  final $Res Function(ApiFailure) _then;
}

/// @nodoc
abstract class _$$_UnknownApiFailureCopyWith<$Res> {
  factory _$$_UnknownApiFailureCopyWith(_$_UnknownApiFailure value,
          $Res Function(_$_UnknownApiFailure) then) =
      __$$_UnknownApiFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnknownApiFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res>
    implements _$$_UnknownApiFailureCopyWith<$Res> {
  __$$_UnknownApiFailureCopyWithImpl(
      _$_UnknownApiFailure _value, $Res Function(_$_UnknownApiFailure) _then)
      : super(_value, (v) => _then(v as _$_UnknownApiFailure));

  @override
  _$_UnknownApiFailure get _value => super._value as _$_UnknownApiFailure;
}

/// @nodoc

class _$_UnknownApiFailure extends _UnknownApiFailure {
  _$_UnknownApiFailure() : super._();

  @override
  String toString() {
    return 'ApiFailure.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnknownApiFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String errorMessage) serverFailure,
    required TResult Function(int? statusCode) httpError,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownApiFailure value) unknown,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_HttpError value) httpError,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownApiFailure extends ApiFailure {
  factory _UnknownApiFailure() = _$_UnknownApiFailure;
  _UnknownApiFailure._() : super._();
}

/// @nodoc
abstract class _$$_ServerFailureCopyWith<$Res> {
  factory _$$_ServerFailureCopyWith(
          _$_ServerFailure value, $Res Function(_$_ServerFailure) then) =
      __$$_ServerFailureCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_ServerFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res>
    implements _$$_ServerFailureCopyWith<$Res> {
  __$$_ServerFailureCopyWithImpl(
      _$_ServerFailure _value, $Res Function(_$_ServerFailure) _then)
      : super(_value, (v) => _then(v as _$_ServerFailure));

  @override
  _$_ServerFailure get _value => super._value as _$_ServerFailure;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ServerFailure(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerFailure extends _ServerFailure {
  _$_ServerFailure(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ApiFailure.serverFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerFailure &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      __$$_ServerFailureCopyWithImpl<_$_ServerFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String errorMessage) serverFailure,
    required TResult Function(int? statusCode) httpError,
  }) {
    return serverFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
  }) {
    return serverFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownApiFailure value) unknown,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_HttpError value) httpError,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure extends ApiFailure {
  factory _ServerFailure(final String errorMessage) = _$_ServerFailure;
  _ServerFailure._() : super._();

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HttpErrorCopyWith<$Res> {
  factory _$$_HttpErrorCopyWith(
          _$_HttpError value, $Res Function(_$_HttpError) then) =
      __$$_HttpErrorCopyWithImpl<$Res>;
  $Res call({int? statusCode});
}

/// @nodoc
class __$$_HttpErrorCopyWithImpl<$Res> extends _$ApiFailureCopyWithImpl<$Res>
    implements _$$_HttpErrorCopyWith<$Res> {
  __$$_HttpErrorCopyWithImpl(
      _$_HttpError _value, $Res Function(_$_HttpError) _then)
      : super(_value, (v) => _then(v as _$_HttpError));

  @override
  _$_HttpError get _value => super._value as _$_HttpError;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(_$_HttpError(
      statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_HttpError extends _HttpError {
  _$_HttpError(this.statusCode) : super._();

  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ApiFailure.httpError(statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpError &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(statusCode));

  @JsonKey(ignore: true)
  @override
  _$$_HttpErrorCopyWith<_$_HttpError> get copyWith =>
      __$$_HttpErrorCopyWithImpl<_$_HttpError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String errorMessage) serverFailure,
    required TResult Function(int? statusCode) httpError,
  }) {
    return httpError(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
  }) {
    return httpError?.call(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String errorMessage)? serverFailure,
    TResult Function(int? statusCode)? httpError,
    required TResult orElse(),
  }) {
    if (httpError != null) {
      return httpError(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownApiFailure value) unknown,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_HttpError value) httpError,
  }) {
    return httpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
  }) {
    return httpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownApiFailure value)? unknown,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_HttpError value)? httpError,
    required TResult orElse(),
  }) {
    if (httpError != null) {
      return httpError(this);
    }
    return orElse();
  }
}

abstract class _HttpError extends ApiFailure {
  factory _HttpError(final int? statusCode) = _$_HttpError;
  _HttpError._() : super._();

  int? get statusCode;
  @JsonKey(ignore: true)
  _$$_HttpErrorCopyWith<_$_HttpError> get copyWith =>
      throw _privateConstructorUsedError;
}
