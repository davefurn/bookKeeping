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

class Token {
  final String refreshToken;
  final String accessToken;

  const Token({required this.refreshToken, required this.accessToken});

  static Token fromJson(Map<String, dynamic> data) {
    return Token(
      refreshToken: data['refresh'],
      accessToken: data['access'],
    );
  }
}

class LoginData {
  final Token token;
  final String email;
  final String firstName;
  final String walletBalance;
  final bool isCustomer;
  final bool isServiceProvider;

  LoginData({
    required this.isCustomer,
    required this.isServiceProvider,
    required this.token,
    required this.email,
    required this.firstName,
    required this.walletBalance,
  });

  static LoginData fromJson(Map<String, dynamic> data) {
    return LoginData(
        isCustomer: data['is_customer'],
        isServiceProvider: data['is_service_provider'],
        token: Token.fromJson(data['token']),
        email: data['email'],
        firstName: data['name'],
        walletBalance: data['wallet_balance']);
  }
}
