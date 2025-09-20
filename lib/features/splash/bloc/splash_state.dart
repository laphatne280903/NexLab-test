import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexlabtest/base/base_state.dart';

part 'splash_state.freezed.dart';

enum SplashStatus { initial, loggedIn, needToLogin }

@freezed
class SplashState extends BaseState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.initial) SplashStatus status,
    String? error,
  }) = _SplashState;
}