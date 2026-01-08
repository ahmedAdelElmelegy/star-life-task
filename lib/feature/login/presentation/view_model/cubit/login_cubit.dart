import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:starlife_task/core/network/models/response/base/api_response.dart';
import 'package:starlife_task/feature/login/data/model/login_model.dart';
import 'package:starlife_task/feature/login/data/model/login_request_body.dart';
import 'package:starlife_task/feature/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  LoginRepo loginRepo;
  LoginModel? loginModel;
  bool isObscure = true;

  Future<ApiResponse> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    emit(LoginLoading());
    final response = await loginRepo.login(loginRequestBody);

    // reqiest work only in 201 i will send screenshoots for this
    if (response.response != null &&
        response.response!.statusCode == 201 &&
        response.response!.data != null) {
      loginModel = LoginModel.fromJson(response.response!.data);

      emit(LoginSuccess());
    } else {
      emit(LoginError(response.error!.message));
    }
    return response;
  }

  // toggle obscure
  void toggleObscure() {
    isObscure = !isObscure;
    emit(LoginObscure());
  }
}
