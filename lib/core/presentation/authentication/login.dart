import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/business/authentication/login_bloc.dart';
import 'package:flutter_boilerplate/core/business/authentication/login_events.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc loginBloc = LoginBloc();

  void _handleSubmit() {
    loginBloc.add(LoginEvent.formSubmit);
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReactiveForm(
                formGroup: loginBloc.loginForm,
                child: Column(
                  children: [
                    ReactiveTextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      formControlName: 'name',
                    ),
                    ReactiveTextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      formControlName: 'email',
                    ),
                    ReactiveTextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      formControlName: 'password',
                      obscureText: true,
                    ),
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return ElevatedButton(
                          child: Text('Submit'),
                          onPressed: form.valid ? _handleSubmit : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
