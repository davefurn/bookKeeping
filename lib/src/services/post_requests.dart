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
import '../features/authentication/views/login/login_service.dart';

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
          print(value.statusCode);
          if (value.statusCode == 200) {
            LocalStorage.instance.setAccessToken(value.data['token']['access']);
            // print(value.data['token']['acess']);
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

  static Future<void> fetchBearerTokenBusiness(BuildContext context,
      {required bool login, String? email, String? password}) async {
    const path = AppEndpoints.login;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network
        .postRequestHandler(path, {'email': email, 'password': password}).then(
      (value) async {
        if (value != null) {
          print(value.statusCode);
          if (value.statusCode == 200) {
            LocalStorage.instance.setAccessToken(value.data['token']['access']);
            // print(value.data['token']['acess']);
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
          ).whenComplete(() => pushToAndClearStack(context, const Login()));
        } else {
          late String message;
          try {
            message = '${value.data["service_email"].join(', ')}';
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

  static Future<void> createServiceProvider1(
    BuildContext context, {
    String? email,
    String? phoneNumber,
    String? serviceName,
    String? industry,
    String? serviceDescription,
    required PageController controller,
  }) async {
    const path = AppEndpoints.serviceProvider1;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network.postRequestHandler(path, {
      'service_name': serviceName,
      'service_phone_number': phoneNumber,
      'service_email': email,
      'industry': industry,
      'service_description': serviceDescription,
    }).then((value) async {
      if (value != null) {
        print(value.statusCode);
        if (value.statusCode == 201) {
          controller.nextPage(
              duration: const Duration(
                milliseconds: 250,
              ),
              curve: Curves.easeInOut);
        } else {
          Map<String, List<String>> convertedResponse =
              Map<String, List<String>>.from(value.data);
          // try {
          //   responses = {
          //     value.data['service_email'].join(', '),
          //     value.data['service_phone_number'].join(', '),
          //   };
          //   Map<String, List<String>> convertedResponse =
          //       Map<String, List<String>>.from(responses);

          //   responses = convertedResponse;
          //   log('CRITICAL LOG');
          // } catch (_) {
          //   responses = 'Something went wrong';
          // }

          ShowFlushBar.showError(
            error: convertedResponse.toString(),
            context: context,
          );
        }
      }
    });
  }

  static Future<void> createServiceProvider2(
    BuildContext context, {
    String? country,
    String? state,
    String? city,
    String? officeAddress,
    String? postalCode,
    required PageController controller,
  }) async {
    const path = AppEndpoints.serviceProvider2;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network.postRequestHandler(path, {
      'country': country,
      'state': state,
      'city': city,
      'office_address': officeAddress,
      'postal_code': postalCode,
    }).then((value) async {
      if (value != null) {
        if (value.statusCode == 201) {
          controller.nextPage(
              duration: const Duration(
                milliseconds: 250,
              ),
              curve: Curves.easeInOut);
        } else {
          late List<String> message;
          try {
            message = [
              '${value.data["country"]}',
              '${value.data["state"]}',
              '${value.data["city"]}',
              '${value.data["office_address"]}',
            ];
            log('CRITICAL LOG');
          } catch (_) {
            message = ['Something went wrong'];
          }

          ShowFlushBar.showError(
            error: message.toString(),
            context: context,
          );
        }
      }
    });
  }

  static Future<void> createBusinessUser(
    BuildContext context, {
    String? email,
    String? phone,
    String? serviceName,
    String? industryId,
    String? password,
    String? pin,
    String? country,
    String? state,
    String? city,
    String? officeAddress,
    String? postalCode,
    String? serviceDescription,
  }) async {
    const path = AppEndpoints.businessRegstrationFinal;

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network.postRequestHandler(path, {
      'service_email': email,
      'password': password,
      'service_name': serviceName,
      'industry': industryId,
      'service_description': serviceDescription,
      'security_pin': pin,
      'country': country,
      'state': state,
      'city': city,
      'office_address': officeAddress,
      'postal_code': postalCode,
      'service_phone_number': phone,
    }).then((value) async {
      if (value != null) {
        print('${AppEndpoints.baseUrl}$path');
        print(value.statusCode);
        if (value.statusCode == 201) {
          ShowFlushBar.showSuccess(
            context: context,
          ).whenComplete(
              () => pushToAndClearStack(context, const LoginService()));
        } else {
          late String message;
          try {
            message = '${value.data["email"].join(', ')}';
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
