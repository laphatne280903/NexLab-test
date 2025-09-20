class AddContactRequest {
  final String contactName;
  final String contactPhone;
  final int userId;

  AddContactRequest({
    required this.contactName,
    required this.contactPhone,
    required this.userId,
  });
}
