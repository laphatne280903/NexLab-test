import 'package:injectable/injectable.dart';
import 'package:nexlabtest/data/model/user.dart';
import 'package:nexlabtest/data/request/credential_request.dart';
import 'package:nexlabtest/data/service/authentication/authentication_mockup.dart';

abstract class IAuthenticationService {
  Future<dynamic> login({required Credential credential});
}

@LazySingleton(as: IAuthenticationService)
class AuthenticationService implements IAuthenticationService {

  AuthenticationService();

  @override
  Future<User?> login({required Credential credential}) async {
    final credIndex = mockCredentials.indexWhere(
      (c) =>
          c.userName == credential.userName &&
          c.password == credential.password,
    );

    if (credIndex == -1) {
      return null;
    }
    return mockUsers[credIndex];
  }
}
