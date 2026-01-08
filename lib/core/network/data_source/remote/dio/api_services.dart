import 'dart:io';
import 'package:dio/dio.dart';
import 'package:starlife_task/core/constants/app_constants.dart';
import 'package:starlife_task/core/network/api_url/api_utls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String _baseUrl = AppURL.baseUrl;
  final Dio _dio;
  late String token;
  late String lang;
  final SharedPreferences sharedPreferences;

  ApiService(this._dio, this.sharedPreferences) {
    token = sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
    lang = sharedPreferences.getString(AppConstants.lang) ?? "ar";

    if (_baseUrl.isEmpty) {
      throw Exception('BASE_URL is not defined in .env');
    }

    _dio
      ..options.baseUrl = _baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
        'lang': lang,
      };
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      var response = await _dio.get(
        '$_baseUrl$endpoint',
        queryParameters: query,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> del(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.delete(
        '$_baseUrl$endpoint',
        queryParameters: queryParameters,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  void updateHeader({String? token}) {
    token = token ?? this.token;
    this.token = token;
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };
  }

  Future<Response> postWithImage(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
