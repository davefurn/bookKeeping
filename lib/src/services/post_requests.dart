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

import 'dart:developer';

import 'package:bookkeep_app/src/constants/app_endpoints.dart';
import 'package:bookkeep_app/src/dialogs/flush.dart';
import 'package:bookkeep_app/src/features/authentication/models/auth_model.dart';

import 'package:bookkeep_app/src/features/authentication/views/signUp/sign_up.dart';
import 'package:bookkeep_app/src/features/home/views/home.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:bookkeep_app/src/services/local_storage.dart';
import 'package:bookkeep_app/src/services/network.dart';
import 'package:flutter/material.dart';

import '../features/authentication/views/login/login.dart';

class PostRequest {
  static final NetworkService network = NetworkService();
  static Future<void> fetchBearerToken(BuildContext context,
      {required bool login, String? email, String? password}) async {
    const path = AppEndpoints.login;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network
        .postRequestHandler(path, {'email': email, 'password': password}).then(
      (value) async {
        if (value != null) {
          if (value.statusCode == 200) {
            LocalStorage.instance.setAccessToken(value.data['token']['access']);
            LocalStorage.instance.setLoggedIn(true);
            LocalStorage.instance
                .setRefreshToken(value.data['token']['refresh']);

            LoginData data = LoginData.fromJson(value.data);
            
            LocalStorage.instance.saveUserData(data);

            ShowFlushBar.showSuccess(
              context: context,
            ).whenComplete(
                () => pushToAndClearStack(context, const HomeScreen()));
            // if (login) {
            //   LoginData data = LoginData.fromJson(value.data['data']);
            //   LocalStorage.instance.saveUserData(data);
            //   ShowFlushBar.showSuccess(
            //     context: context,
            //   ).whenComplete(() => pushToAndClearStack(context, const Home()));
            // } else {
            //   ShowFlushBar.showSuccess(
            //     context: context,
            //   ).whenComplete(() => pushToAndClearStack(context, const Auth()));
            // }
          } else {
            late String message;
            try {
              message = '${value.data["detail"]}';
              log('CRITICAL LOG');
            } catch (_) {
              message = 'Something went wrong';
            }

            ShowFlushBar.showError(
              error: message,
              context: context,
            ).whenComplete(() {
              if (email == null) {
                return pushReplacementTo(context, const SignUp());
              } else {
                if (!login) {
                  pop(context);
                }
              }
            });
          }
        } else {
          ShowFlushBar.showError(
            context: context,
          );
        }
      },
    );
  }

  static Future<void> createUser(
    BuildContext context, {
    String? email,
    String? password,
    String? firstName,
    String? lastname,
    String? phoneNumber,
    String? dateOfBirth,
    String? residencAddress,
    String? stateOfResidence,
    String? localGovernmentArea,
    String? gender,
    String? securityPin,
  }) async {
    const path = AppEndpoints.createUser;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network.postRequestHandler(path, {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastname,
      'phone_number': phoneNumber,
      'residence_address': residencAddress,
      'date_of_birth': dateOfBirth,
      'state_of_residence': stateOfResidence,
      'local_government_area': localGovernmentArea,
      'gender': gender,
      'security_pin': securityPin,
    }).then((value) async {
      if (value != null) {
        if (value.statusCode == 201) {
          ShowFlushBar.showSuccess(
            context: context,
          ).whenComplete(
              () => pushToAndClearStack(context, const Login()));
        } else {
          late String message;
          try {
            message = '${value.data["email"]}';
            log('CRITICAL LOG');
          } catch (_) {
            message = 'Something went wrong';
          }

          ShowFlushBar.showError(
            error: message,
            context: context,
          );
        }
      }
    });
  }

  static Future<void> logout(
      //   BuildContext context, {
      //   String? email,
      //   String? password,
      //   String? firstName,
      //   String? lastname,
      //   String? phoneNumber,
      //   String? dateOfBirth,
      //   String? residencAddress,
      //   String? stateOfResidence,
      //   String? localGovernmentArea,
      //   String? gender,
      //   String? securityPin,
      // }
      ) async {
    // const path = AppEndpoints.createUser;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    //   await network.postRequestHandler(path, {
    //     'email': email,
    //     'password': password,
    //     'first_name': firstName,
    //     'last_name': lastname,
    //     'phone_number': phoneNumber,
    //     'residence_address': residencAddress,
    //     'date_of_birth': dateOfBirth,
    //     'state_of_residence': stateOfResidence,
    //     'local_government_area': localGovernmentArea,
    //     'gender': gender,
    //     'security_pin': securityPin,
    //   }).then((value) async {
    //     if (value != null) {

    //       if (value.statusCode == 201) {
    //         ShowFlushBar.showSuccess(
    //           context: context,
    //         ).whenComplete(() => pushToAndClearStack(context, const HomeScreen()));
    //       } else {
    //         late String message;
    //         try {
    //           message = '${value.data["email"]}';
    //           log('CRITICAL LOG');
    //         } catch (_) {
    //           message = 'Something went wrong';
    //         }

    //         ShowFlushBar.showError(
    //           error: message,
    //           context: context,
    //         );
    //       }
    //     }
    //   });
    // }
  }
}
