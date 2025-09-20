// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignInState {
  SignInStatus get status => throw _privateConstructorUsedError;
  bool get isValidEmail => throw _privateConstructorUsedError;
  bool get isValidLogin => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
    SignInState value,
    $Res Function(SignInState) then,
  ) = _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call({
    SignInStatus status,
    bool isValidEmail,
    bool isValidLogin,
    String? error,
  });
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isValidEmail = null,
    Object? isValidLogin = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SignInStatus,
            isValidEmail: null == isValidEmail
                ? _value.isValidEmail
                : isValidEmail // ignore: cast_nullable_to_non_nullable
                      as bool,
            isValidLogin: null == isValidLogin
                ? _value.isValidLogin
                : isValidLogin // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
    _$SignInStateImpl value,
    $Res Function(_$SignInStateImpl) then,
  ) = __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SignInStatus status,
    bool isValidEmail,
    bool isValidLogin,
    String? error,
  });
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
    _$SignInStateImpl _value,
    $Res Function(_$SignInStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isValidEmail = null,
    Object? isValidLogin = null,
    Object? error = freezed,
  }) {
    return _then(
      _$SignInStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SignInStatus,
        isValidEmail: null == isValidEmail
            ? _value.isValidEmail
            : isValidEmail // ignore: cast_nullable_to_non_nullable
                  as bool,
        isValidLogin: null == isValidLogin
            ? _value.isValidLogin
            : isValidLogin // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl({
    this.status = SignInStatus.initial,
    this.isValidEmail = false,
    this.isValidLogin = false,
    this.error,
  });

  @override
  @JsonKey()
  final SignInStatus status;
  @override
  @JsonKey()
  final bool isValidEmail;
  @override
  @JsonKey()
  final bool isValidLogin;
  @override
  final String? error;

  @override
  String toString() {
    return 'SignInState(status: $status, isValidEmail: $isValidEmail, isValidLogin: $isValidLogin, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValidEmail, isValidEmail) ||
                other.isValidEmail == isValidEmail) &&
            (identical(other.isValidLogin, isValidLogin) ||
                other.isValidLogin == isValidLogin) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, isValidEmail, isValidLogin, error);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState({
    final SignInStatus status,
    final bool isValidEmail,
    final bool isValidLogin,
    final String? error,
  }) = _$SignInStateImpl;

  @override
  SignInStatus get status;
  @override
  bool get isValidEmail;
  @override
  bool get isValidLogin;
  @override
  String? get error;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
