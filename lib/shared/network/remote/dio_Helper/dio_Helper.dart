// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static late Dio dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
//         receiveDataWhenStatusError: true,
//         headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json'
//         },
//       ),
//     );
//   }
//
//   static Future<Response> getData({
//     required String endpoint,
//     required Map<String, dynamic> queryParameters,
//     ProgressCallback? onReceiveProgress,
//     String? token,
//   }) async {
//     try {
//       dio.options.headers = {
//         'Authorization': 'Bearer ${token ?? ''}',
//       };
//       final Response response = await dio.get(
//         endpoint,
//         queryParameters: queryParameters,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   static Future<Response> postData({
//     required String endpoint,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic> data,
//     // String lang = "ar",
//     String? token,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       dio.options.headers = {
//         'Authorization': 'Bearer ${token ?? ''}',
//       };
//       final Response response = await dio.post(
//         endpoint,
//         data: data,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:lms/view_model/database/network/end_points.dart';

//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: "https://lavie.orangedigitalcenteregypt.com/",
        receiveDataWhenStatusError: true,
        //Here we Put The Headers Needed in The API.
        headers: {
          'Content-Type': 'application/json',
          //'lang':'en'
        },
      ),
    );
  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    required String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
    };

    // dio.options.headers = {
    //   'x-auth-token': token ?? '',
    //   'Content-Type': 'application/json',
    // };
    // return await dio.get(
    //   url,
    // );
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    //bool files = false,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> postsData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
    };
    try {
      final Response response = await dio.post(url, data: data);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.put(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
    // dio.options.headers = {
    //   'x-auth-token': token ?? '',
    //   //'Content-Type': 'application/json',
    // };
    // return await dio.put(
    //   url,
    //   data: data,
    // );
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
    // dio.options.headers = {
    //   'x-auth-token': userToken,
    //   'Content-Type': 'application/json',
    // };
    // return await dio.delete(url, data: data ?? '').catchError((error) {
    //   print("DIO ERROR $error");
    // });
  }
}
