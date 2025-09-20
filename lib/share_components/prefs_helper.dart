import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nexlabtest/data/model/user.dart';
import 'package:nexlabtest/share_components/prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPrefsHelper {
  SharedPrefsHelper({required this.prefs});

  final SharedPreferences prefs;

  Future<bool> saveLoginCredential(bool isLoggedIn) async {
    return prefs.setBool(PrefKeys.loginCredential, isLoggedIn);
  }

  Future<bool> getLoginCredential() async {
    try {
      return prefs.getBool(PrefKeys.loginCredential) ?? false;
    } catch (e) {
      await prefs.setBool(PrefKeys.loginCredential, false);
      return false;
    }
  }

  Future<void> saveUserInfo(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode({
      "id": user.id,
      "userName": user.userName,
      "avatarUrl": user.avatarUrl,
      "gender": user.gender,
    });
    await prefs.setString(PrefKeys.userInfo, userJson);
  }

  Future<User?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(PrefKeys.userInfo);
    if (userJson == null) return null;

    final data = jsonDecode(userJson);
    return User(
      id: data["id"],
      userName: data["userName"],
      avatarUrl: data["avatarUrl"],
      gender: data["gender"],
    );
  }

  Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(PrefKeys.userInfo);
  }
}
