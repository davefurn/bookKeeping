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

class ResponseModel<T> {
  late int? statusCode;
  late ErrorModel? error;
  late bool valid = false;
  late String? message = '';
  late String token;
  late T? data;

  ResponseModel({valid, message, statusCode, this.data, error, token}) {
    this.valid = valid ?? false;
    this.message = message ?? '';
    this.statusCode = statusCode ?? 000;
    this.token = token ?? '';
    this.error = error ?? ErrorModel();
  }
}

class ErrorModel {
  String? errorCode;
  String? message;
  dynamic errorField;
  String? token;

  ErrorModel({this.errorCode, this.message, this.errorField, this.token});

  @override
  String toString() {
    return '{errorCode: $errorCode, message: $message}';
  }

  factory ErrorModel.fromJson(dynamic data) {
    return ErrorModel(errorCode: data['errorCode'] ?? '', message: data['message'] ?? '', errorField: data['errorField'] ?? '', token: data['token'] ?? '');
  }
}
