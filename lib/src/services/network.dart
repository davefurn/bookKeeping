import 'dart:developer';
import 'dart:io';

import 'package:bookkeep_app/src/constants/app_endpoints.dart';

import 'package:dio/dio.dart';

class NetworkService {
  static final Dio _dio = Dio();

  Future<Response?> postRequestHandler(String path, Map<String, dynamic> data,
      {Options? options}) async {
    try {
      final a = await _dio.postUri(
        Uri.parse('${AppEndpoints.baseUrl}$path'),
        data: data,
        options: options,
      );

      log(a.data.toString());
      return a;
    } on DioException catch (e) {
      log(e.response.toString());

      return e.response;
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

//   Future<Response?> patchRequestHandler(String path, Map<String, dynamic> data,
//       {Options? options}) async {
//     try {
//       final a = await _dio.patchUri(Uri.parse('${AppEndpoints.baseUrl}$path'),
//           data: data, options: options);
//       log(a.data.toString());
//       return a;
//     } on DioError catch (e) {
//       log(e.response.toString());
//       if (e.response?.statusCode == 401 &&
//           e.response != null &&
//           e.response!.data.containsKey('message') &&
//           e.response!.data['message'] == 'Token has expired') {
//         await PostRequest.refreshToken();
//         try {
//           return await _dio.postUri(
//             Uri.parse('${AppEndpoints.baseUrl}$path'),
//             data: data,
//             options: options,
//           );
//         } catch (_) {
//           return null;
//         }
//       } else {
//         return e.response;
//       }
//     } on SocketException catch (_) {
//       return null;
//     } catch (_) {
//       return null;
//     }
//   }

  Future<Response?> getRequestHandler(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    try {
      final a = await _dio.getUri(Uri.parse('${AppEndpoints.baseUrl}$path'),
          data: data, options: options);
      log(a.data.toString());
      return a;
    } on DioException catch (e) {
      log(e.response.toString());
      // if (e.response?.statusCode == 401 &&
      //     e.response != null &&
      //     e.response!.data.containsKey('message') &&
      //     e.response!.data['message'] == 'Token has expired') {
      //   await PostRequest.refreshToken();
      //   try {
      //     return await _dio.postUri(
      //       Uri.parse('${AppEndpoints.baseUrl}$path'),
      //       data: data,
      //       options: options,
      //     );
      //   } catch (_) {
      //     return null;
      //   }
      // } else {
      //   return e.response;
      // }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
        return null;
    }
    return null;
  }
}
