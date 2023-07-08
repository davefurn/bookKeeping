// Copyright 2023 Davefurn
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:shared_preferences/shared_preferences.dart';

import '../features/authentication/models/auth_model.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  LocalStorage._init();

  final String firstTime = 'firstTime';
  final String email = 'email';
  final String phone = 'phone';
  final String password = 'password';
  final String firstName = 'firstName';
  final String lastName = 'lastName';
  final String securityPin = 'pin';
  final String accesstoken = 'token';
  final String refreshtoken = 'rtoken';
  final String loggedIn = 'loggedIn';
  final String walletBalance = '0.00';

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> setFirstTime() async {
    var pref = await instance.prefs;
    return pref.setBool(firstTime, true);
  }

  Future<bool> getFirstTime() async {
    var pref = await instance.prefs;
    var isNotFirstTime = pref.getBool(firstTime) ?? false;
    if (isNotFirstTime) {
      return false;
    }
    await setFirstTime();
    return true;
  }

  Future<bool> setEmail(String value) async {
    var pref = await instance.prefs;
    return pref.setString(email, value);
  }

  Future<bool> setPassword(String value) async {
    var pref = await instance.prefs;
    return pref.setString(password, value);
  }

  Future<bool> setWalletBalance(String value) async {
    var pref = await instance.prefs;
    return pref.setString(walletBalance, value);
  }

  Future<bool> setFirstName(String value) async {
    var pref = await instance.prefs;
    return pref.setString(firstName, value);
  }

  Future<bool> setLastName(String value) async {
    var pref = await instance.prefs;
    return pref.setString(lastName, value);
  }

  Future<bool> setPhoneNumber(String value) async {
    var pref = await instance.prefs;
    return pref.setString(phone, value);
  }

  Future<bool> setSecurityPin(String value) async {
    var pref = await instance.prefs;
    return pref.setString(securityPin, value);
  }

  Future<String?> getEmail() async {
    var pref = await instance.prefs;
    return pref.getString(email);
  }

  Future<String?> getWalletBalance() async {
    var pref = await instance.prefs;
    return pref.getString(walletBalance);
  }

  Future<String?> getPhone() async {
    var pref = await instance.prefs;
    return pref.getString(phone);
  }

  Future<String?> getPassword() async {
    var pref = await instance.prefs;
    return pref.getString(password);
  }

  Future<String?> getFirstName() async {
    var pref = await instance.prefs;
    return pref.getString(firstName);
  }

  Future<String?> getLastName() async {
    var pref = await instance.prefs;
    return pref.getString(lastName);
  }

  Future<String?> getSecurityPin() async {
    var pref = await instance.prefs;
    return pref.getString(securityPin);
  }

  Future<bool> setLoggedIn(bool value) async {
    var pref = await instance.prefs;
    return pref.setBool(loggedIn, value);
  }

  Future<bool> getLoggedIn() async {
    var pref = await instance.prefs;
    return pref.getBool(loggedIn) ?? false;
  }

  Future<bool> setAccessToken(String value) async {
    var pref = await instance.prefs;
    return pref.setString(accesstoken, value);
  }

  Future<String?> getAccessToken() async {
    var pref = await instance.prefs;
    return pref.getString(accesstoken);
  }

  Future<bool> setRefreshToken(String value) async {
    var pref = await instance.prefs;
    return pref.setString(refreshtoken, value);
  }

  Future<String?> getRefreshToken() async {
    var pref = await instance.prefs;
    return pref.getString(refreshtoken);
  }

  Future<void> saveUserData(LoginData data) async {
    var pref = await instance.prefs;
    await pref.setString(accesstoken, data.token.accessToken);
    await pref.setString(refreshtoken, data.token.refreshToken);
    await pref.setString(firstName, data.firstName);
    await pref.setString(email, data.email);
    await pref.setString(walletBalance, data.walletBalance);
  }

  Future<LoginData> getUserData() async {
    var pref = await instance.prefs;

    var firstName_ = pref.getString(firstName)!;
    var email_ = pref.getString(email)!;
    var walletBalance_ = pref.getString(walletBalance)!;
    var token_ = Token(refreshToken: refreshtoken, accessToken: accesstoken);

    return LoginData(
        email: email_,
        firstName: firstName_,
        walletBalance: walletBalance_,
        token: token_);
  }
}
