import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/business/authentication/login_events.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginBloc extends Bloc<LoginEvent, dynamic> {
  LoginBloc() : super('');

  final FormGroup loginForm = FormGroup({
    'name': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
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
