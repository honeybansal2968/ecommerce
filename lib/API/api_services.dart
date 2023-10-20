import 'dart:io';

// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
import 'api_endpoints.dart';

class ApiService {
  static final String TAG = '$ApiService';
  static const int maxRedirectsInOptions = 4;

  ///Api code
  static const int SUCCESS_CODE = 200;
  static const int SUCCESS_CODE_V2 = 201;
  static const int BAD_REQUEST_CODE = 400;
  static const int CACHE_REQUEST_CODE = 304;
  static const int USER_UNAUTHENTICATED_CODE = 401;

  static bool checkSuccess(int statusCode) {
    if (statusCode == ApiService.SUCCESS_CODE ||
        statusCode == ApiService.SUCCESS_CODE_V2 ||
        statusCode == ApiService.CACHE_REQUEST_CODE) {
      return true;
    } else if (statusCode == ApiService.USER_UNAUTHENTICATED_CODE) {
      //TODO: Implement this log out case
      // SharedPref.accessToken = '';
      // AppRoutes.goAndPopAll(AppRouteName.SPLASH);
    }
    return false;
  }

  //static String token = SharedPrefs.getString(SharedPrefs.userToken);

  static final baseOptions = BaseOptions(
    // headers: {'Content-Type': 'application/json', "token": token},
    baseUrl: ApiEndPoints.serverUrl,
    followRedirects: true,
    maxRedirects: maxRedirectsInOptions,
  );

  // Options getOption() {
  //   return Options(
  //     headers: {
  //       'Content-Type': 'application/json',
  //       "token": SharedPrefs.getString(SharedPrefs.userToken)
  //     },
  //   );
  // }

  static final _dioObj = _initializeDioWithoutCache();
  static final ApiService _service = ApiService._internal();

  static Dio _initializeDioWithoutCache() {
    var dio = Dio(baseOptions);

    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    return dio;
  }

  ApiService._internal();

  factory ApiService() {
    return _service;
  }

  static Future<Response> getProducts() async {
    var result = await _dioObj.get(ApiEndPoints.serverUrl, options: options);
    return result;
  }

  static Future<Response> getCategories() async {
    var result = await _dioObj.get(ApiEndPoints.categoryUrl, options: options);
    return result;
  }

  static Future<Response> getProductsByCategory(int categoryIndex) async {
    var result = await _dioObj.get(
      "${ApiEndPoints.categoryFilterUrl}$categoryIndex",
      
      options: options,
    );
    return result;
  }
}

Options get options => Options(
      headers: {
        'Content-Type': 'application/json',
        // "token": SharedPrefs.getString(SharedPrefs.userToken)
      },
    );
