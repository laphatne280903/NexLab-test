import 'package:injectable/injectable.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/data/request/add_contact_request.dart';
import 'package:nexlabtest/data/service/contact/contact_service.dart';

abstract class IContactRepository {
  Future<List<Contact>> getContactList(int userId);

  Future<Contact> addContact(AddContactRequest request);
  Future<bool> deleteContact(int contactId);
  Future<Contact?> updateContact(Contact contact);
}

@LazySingleton(as: IContactRepository)
class ContactRepository implements IContactRepository {
  final IContactService service;

  ContactRepository({required this.service});

  @override
  Future<List<Contact>> getContactList(int userId) {
    return service.getContactList(userId);
  }

  @override
  Future<Contact> addContact(AddContactRequest request) {
    return service.addContact(request);
  }

  @override
  Future<bool> deleteContact(int id) {
    return service.deleteContact(id);
  }

  @override
  Future<Contact?> updateContact(Contact contact) {
    return service.updateContact(contact);
  }
}
