import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexlabtest/base/base_state.dart';

part 'sign_in_state.freezed.dart';

enum SignInStatus { initial, inputing, loading, success, fail }

@freezed
class SignInState extends BaseState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.initial) SignInStatus status,
    @Default(false) bool isValidEmail,
    @Default(false) bool isValidLogin,
    String? error,
  }) = _SignInState;
}