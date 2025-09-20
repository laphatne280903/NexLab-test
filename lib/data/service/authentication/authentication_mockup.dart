import 'package:nexlabtest/data/model/user.dart';
import 'package:nexlabtest/data/request/credential_request.dart';

final mockCredentials = [
  Credential(userName: "nguyenphat@gmail.com", password: "123456"),
  Credential(userName: "latuine@gmail.com", password: "654321"),
];

final mockUsers = [
  User(
    id: 1,
    userName: "John Doe",
    gender: "male",
    avatarUrl: "https://t4.ftcdn.net/jpg/03/96/16/79/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg",
  ),
  User(
    id: 2,
    userName: "Jane Mary",
    gender: "female",
    avatarUrl: "https://people.com/thmb/CmROfB5Fw4H3oJmGwr7qJTGDCGg=/4000x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(509x0:511x2)/people-headshot-lindsay-kimble-9855440283c440159d1684a4befaa97d.jpg",
  ),
];
