// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ContactState {
  CommonStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<Contact>? get contact => throw _privateConstructorUsedError;
  User? get userInfo => throw _privateConstructorUsedError;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactStateCopyWith<ContactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactStateCopyWith<$Res> {
  factory $ContactStateCopyWith(
    ContactState value,
    $Res Function(ContactState) then,
  ) = _$ContactStateCopyWithImpl<$Res, ContactState>;
  @useResult
  $Res call({
    CommonStatus status,
    String? error,
    List<Contact>? contact,
    User? userInfo,
  });
}

/// @nodoc
class _$ContactStateCopyWithImpl<$Res, $Val extends ContactState>
    implements $ContactStateCopyWith<$Res> {
  _$ContactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? contact = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CommonStatus,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            contact: freezed == contact
                ? _value.contact
                : contact // ignore: cast_nullable_to_non_nullable
                      as List<Contact>?,
            userInfo: freezed == userInfo
                ? _value.userInfo
                : userInfo // ignore: cast_nullable_to_non_nullable
                      as User?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContactStateImplCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$$ContactStateImplCopyWith(
    _$ContactStateImpl value,
    $Res Function(_$ContactStateImpl) then,
  ) = __$$ContactStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CommonStatus status,
    String? error,
    List<Contact>? contact,
    User? userInfo,
  });
}

/// @nodoc
class __$$ContactStateImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ContactStateImpl>
    implements _$$ContactStateImplCopyWith<$Res> {
  __$$ContactStateImplCopyWithImpl(
    _$ContactStateImpl _value,
    $Res Function(_$ContactStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? contact = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(
      _$ContactStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CommonStatus,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        contact: freezed == contact
            ? _value._contact
            : contact // ignore: cast_nullable_to_non_nullable
                  as List<Contact>?,
        userInfo: freezed == userInfo
            ? _value.userInfo
            : userInfo // ignore: cast_nullable_to_non_nullable
                  as User?,
      ),
    );
  }
}

/// @nodoc

class _$ContactStateImpl implements _ContactState {
  const _$ContactStateImpl({
    this.status = CommonStatus.initial,
    this.error,
    final List<Contact>? contact,
    this.userInfo,
  }) : _contact = contact;

  @override
  @JsonKey()
  final CommonStatus status;
  @override
  final String? error;
  final List<Contact>? _contact;
  @override
  List<Contact>? get contact {
    final value = _contact;
    if (value == null) return null;
    if (_contact is EqualUnmodifiableListView) return _contact;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? userInfo;

  @override
  String toString() {
    return 'ContactState(status: $status, error: $error, contact: $contact, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._contact, _contact) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_contact),
    userInfo,
  );

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactStateImplCopyWith<_$ContactStateImpl> get copyWith =>
      __$$ContactStateImplCopyWithImpl<_$ContactStateImpl>(this, _$identity);
}

abstract class _ContactState implements ContactState {
  const factory _ContactState({
    final CommonStatus status,
    final String? error,
    final List<Contact>? contact,
    final User? userInfo,
  }) = _$ContactStateImpl;

  @override
  CommonStatus get status;
  @override
  String? get error;
  @override
  List<Contact>? get contact;
  @override
  User? get userInfo;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactStateImplCopyWith<_$ContactStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
