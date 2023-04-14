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
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//  import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../constants/app_endpoints.dart';
// import '../../../services/api_handler/api_handler_config.dart';
// import '../../../services/api_handler/api_handler_model.dart';
// import '../models/login_model.dart';

// final authProvider = StateNotifierProvider<AuthNotifier, AuthRepo>((ref) {
//   return AuthNotifier(ref, AuthRepo());
// });

// class AuthNotifier extends StateNotifier<AuthRepo> {
//   final Ref ref;
//   final AuthRepo repo;
//   AuthNotifier(this.ref, this.repo) : super(AuthRepo());

  // Future<void> registerUser(BuildContext context) async {
  //   Dialogs.showLoadingDialog(context);
  //   final res = await repo.registerWithEmailAndPassword(
  //     email: state.email!,
  //     password: state.password!,
  //   );
  //   if (!mounted) return;
  //   pop(context);
  //   if (res.valid) {
  //     pushTo(
  //       context,
  //       const LoginScreen(),
  //     );
  //   } else {
  //     Dialogs.showErrorSnackbar(context, message: res.error!.message!);
  //   }
  // }

//   Future<void> loginUser(BuildContext context) async {
//     Dialogs.showLoadingDialog(context);
//     final res = await repo.loginWithEmailAndPassword(
//       email: state.email!,
//       password: state.password!,
//     );
//     if (!mounted) return;
//     pop(context);
//     if (res.valid) {
//       LocalData.getInstance.setToken(res.data!.accessToken);
//       pushToAndClearStack(context, const HomeScreen());
//     } else {
//       Dialogs.showErrorSnackbar(context, message: res.error!.message!);
//     }
//   }
// }

// class AuthRepo {
//   final BackendService _apiService = BackendService(Dio());

//   String? email;
//   String? password;

//   Future<ResponseModel> registerWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/register',
//         data: {"email": email, "password": password},
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel<LoginModel>> loginWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/login',
//         data: {"email": email, "password": password},
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel<LoginModel>(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: LoginModel.fromJson(response.data),
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }
// }

