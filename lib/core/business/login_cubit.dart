import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/core/business/app_cubit.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
import 'package:flutter_boilerplate/core/data/models/login_state.dart';
import 'package:flutter_boilerplate/core/data/repositories/auth_repo.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _appCubit = AppCubit();
  final repo = AuthRepo();

  final FormGroup loginForm = FormGroup(
    {
      'email': FormControl<String>(
        value: '',
        validators: [
          Validators.email,
          Validators.required,
        ],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    },
  );

  void submitForm() async {
    emit(state.copyWith(isLoginInProgress: true));
    ApiResponse response = await repo.handleUserLogin(
      loginForm.value['email'].toString(),
      loginForm.value['password'].toString(),
    );
    if (response.isSuccess) {
      _initAccessToken(response.data['authLogin']['accessToken']);
      _handleLoginSuccess();
    } else {
      _handleLoginFailure();
    }
  }

  void getFullUser() async {
    ApiResponse response = await repo.queryCurrentUserFull();
    log(response.data.toString());
  }

  Future<void> _handleLoginSuccess() async {
    App.notifySuccess('Login Successful');
    await _appCubit.getCurrentUser();
    emit(state.copyWith(
      isLoginInProgress: false,
      isLoginSuccessful: true,
    ));
  }

  void _handleLoginFailure() {
    App.notifyError('Login failed');
    emit(state.copyWith(
      isLoginInProgress: false,
      isLoginSuccessful: false,
    ));
  }

  void _initAccessToken(String token) {
    App.token = token;
    _appCubit.updateAccessToken(token);
  }
}
