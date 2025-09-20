import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nexlabtest/base/base_bloc.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/data/request/add_contact_request.dart';
import 'package:nexlabtest/domain/contact/contact_repository.dart';
import 'package:nexlabtest/features/contact/bloc/contact_state.dart';
import 'package:nexlabtest/share_components/prefs_helper.dart';
import 'package:nexlabtest/utils/dialog_utils.dart';

@injectable
class ContactBloc extends BaseBloc<ContactState> {
  ContactBloc({
    required this.sharedPrefsHelper,
    required this.contactRepository,
  }) : super(const ContactState());

  final SharedPrefsHelper sharedPrefsHelper;
  final IContactRepository contactRepository;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }

  void getUserInfo() async {
    final info = await sharedPrefsHelper.getUserInfo();
    emit(state.copyWith(userInfo: info));
  }

  Future<void> getContactList() async {
    try {
      final info = await sharedPrefsHelper.getUserInfo();

      final response = await contactRepository.getContactList(info?.id ?? 0);
      final list = List<Contact>.from(response);
      emit(state.copyWith(contact: list));
    } catch (e) {}
  }

  Future<void> updateContact(BuildContext context, Contact contact) async {
    try {
      final updatedContact = Contact(
        contactName: nameController.text.trim(),
        contactPhone: phoneController.text.trim(),
        id: contact.id,
        ownerUserId: contact.ownerUserId,
      );
      final response = await contactRepository.updateContact(updatedContact);

      if (response != null) {
        final list = List<Contact>.from(state.contact ?? []);

        final index = list.indexWhere((c) => c.id == contact.id);
        if (index != -1) {
          list[index] = response;
        }

        emit(state.copyWith(contact: list));
        DialogUtils.showSuccessDialog(context, 'Cập nhật thành công');
      } else {
        print("Update contact thất bại!");
      }
    } catch (e) {
      print("Update contact error: $e");
    }
  }

  Future<void> deleteContact(BuildContext context, int contactId) async {
    try {
      final response = await contactRepository.deleteContact(contactId);
      if (response) {
        final list = List<Contact>.from(state.contact ?? []);
        list.removeWhere((c) => c.id == contactId);
        emit(state.copyWith(contact: list));
        DialogUtils.showSuccessDialog(context, 'Xóa thành công');
      } else {
        print("Xoá contact thất bại!");
      }
    } catch (e) {}
  }

  Future<void> addContact(BuildContext context) async {
    try {
      final newContact = AddContactRequest(
        contactName: nameController.text.trim(),
        contactPhone: phoneController.text.trim(),
        userId: state.userInfo?.id ?? 0,
      );
      final response = await contactRepository.addContact(newContact);
      final list = List<Contact>.from(state.contact ?? []);
      list.add(response);

      emit(state.copyWith(contact: list));

      DialogUtils.showSuccessDialog(context, 'Thêm liên hệ thành công');
    } catch (e) {}
  }

  void logout() {
    sharedPrefsHelper.saveLoginCredential(false);
    sharedPrefsHelper.clearUserInfo();
  }
}
