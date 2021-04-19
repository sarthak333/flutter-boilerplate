import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/business/authentication/login_events.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
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

  @override
  Stream<dynamic> mapEventToState(LoginEvent event) async* {
    switch (event) {
      case LoginEvent.formSubmit:
        ApiResponse response = await handleUserLogin(
          loginForm.value['email'].toString(),
          loginForm.value['password'].toString(),
        );
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
