import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/core/business/authentication/login_events.dart';
import 'package:flutter_boilerplate/core/business/global_app_state/app_events.dart';
import 'package:flutter_boilerplate/core/business/global_app_state/app_bloc.dart';
import 'package:flutter_boilerplate/core/data/models/common/api_response_model.dart';
import 'package:flutter_boilerplate/core/data/providers/network/login_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginBloc extends Bloc<LoginEvent, dynamic> {
  LoginBloc() : super('');

  final FormGroup loginForm = FormGroup({
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
  });

  final appBloc = AppBloc();

  @override
  Stream<dynamic> mapEventToState(LoginEvent event) async* {
    switch (event) {
      case LoginEvent.formSubmit:
        ApiResponse response = await handleUserLogin(
          loginForm.value['email'].toString(),
          loginForm.value['password'].toString(),
        );
        if (response.isSuccess) {
          App.token = response.data['authLogin']['accessToken'];
          appBloc.add(AppEvent(AppEventType.loginEvent,
              response.data['authLogin']['accessToken']));
          this.add(LoginEvent.loginSuccess);
        } else
          this.add(LoginEvent.loginFailed);
        yield state;
        break;
      case LoginEvent.getCurrentUser:
        ApiResponse currentUser = await getCurrentUSer();
        yield state;
        break;
      case LoginEvent.loginSuccess:
        yield state;
        break;
      case LoginEvent.loginFailed:
        yield state;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
