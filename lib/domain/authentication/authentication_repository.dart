import 'package:injectable/injectable.dart';
import 'package:nexlabtest/data/request/credential_request.dart';
import 'package:nexlabtest/data/service/authentication/authentication_service.dart';

abstract class IAuthenticationRepository {
  Future<dynamic> login ({
    required Credential credential,
  });
}

@LazySingleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationService client;

  AuthenticationRepository({required this.client});
  
  @override
  Future<dynamic> login({required Credential credential}) {
    return client.login(credential: credential);
  }
}