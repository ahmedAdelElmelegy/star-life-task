import 'package:starlife_task/core/network/api_url/api_utls.dart';
import 'package:starlife_task/core/network/data_source/remote/dio/api_services.dart';
import 'package:starlife_task/core/network/data_source/remote/exception/api_error_handeler.dart';
import 'package:starlife_task/core/network/models/response/base/api_response.dart';
import 'package:starlife_task/feature/login/data/model/login_request_body.dart';

class LoginRepo {
  ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResponse> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.post(
        AppURL.login,
        data: loginRequestBody.toMap(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
