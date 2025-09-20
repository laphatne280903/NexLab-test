import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexlabtest/base/base_state.dart';
import 'package:nexlabtest/core/app_enum.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/data/model/user.dart';

part 'contact_state.freezed.dart';

@freezed
class ContactState extends BaseState with _$ContactState {
  const factory ContactState({
    @Default(CommonStatus.initial) CommonStatus status,
    String? error,
    List<Contact>? contact,
    User? userInfo,
  }) = _ContactState;
}
