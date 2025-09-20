import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexlabtest/data/model/user.dart';

part 'contact.freezed.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required int id,
    @Default(0) int ownerUserId, 
    @Default('') String contactPhone,
    @Default('') String contactName,
  }) = _Contact;
}
