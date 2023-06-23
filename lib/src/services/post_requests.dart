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
import 'package:bookkeep_app/src/features/authentication/views/auth/auth.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/sign_up.dart';
import 'package:bookkeep_app/src/features/home/views/home.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:bookkeep_app/src/services/local_storage.dart';
import 'package:bookkeep_app/src/services/network.dart';
import 'package:flutter/material.dart';

import '../features/authentication/models/auth_model.dart';

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
            LocalStorage.instance.setAccessToken(value.data['access']);
            LocalStorage.instance.setLoggedIn(true);
            LocalStorage.instance.setRefreshToken(value.data['refresh']);
            if (login) {
              LoginData data = LoginData.fromJson(value.data['data']);
              LocalStorage.instance.saveUserData(data);
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                  () => pushToAndClearStack(context, const Home()));
            } else {
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                  () => pushToAndClearStack(context, const Auth()));
            }
          } else {
            late String message;
            try {
              message = '${value.data["message"]}';
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
}
