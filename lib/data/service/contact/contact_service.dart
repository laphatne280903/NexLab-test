import 'package:injectable/injectable.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/data/request/add_contact_request.dart';
import 'package:nexlabtest/data/service/contact/contact_mockup.dart';

abstract class IContactService {
  Future<List<Contact>> getContactList(int userId);

  Future<Contact> addContact(AddContactRequest request);
  Future<bool> deleteContact(int contactId);
  Future<Contact?> updateContact(Contact contact);
}

@LazySingleton(as: IContactService)
class ContactService implements IContactService {
  ContactService();

  @override
  Future<List<Contact>> getContactList(int userId) async {
    final contacts = mockContacts
        .where((c) => c.ownerUserId == userId)
        .toList();
    return contacts;
  }

  @override
  Future<Contact> addContact(AddContactRequest request) async {
    final newId =
        (mockContacts.isNotEmpty
            ? mockContacts.map((c) => c.id).reduce((a, b) => a > b ? a : b)
            : 0) +
        1;

    final newContact = Contact(
      id: newId,
      ownerUserId: request.userId,
      contactName: request.contactName,
      contactPhone: request.contactPhone,
    );

    mockContacts.add(newContact);
    return newContact;
  }

  @override
  Future<bool> deleteContact(int contactId) async {
    final initialLength = mockContacts.length;
    mockContacts.removeWhere((c) => c.id == contactId);
    return mockContacts.length < initialLength;
  }

  @override
  Future<Contact?> updateContact(Contact updatedContact) async {
    final index = mockContacts.indexWhere((c) => c.id == updatedContact.id);
    if (index == -1) return null;
    mockContacts[index] = updatedContact;
    return updatedContact;
  }
}
