import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/business/login_cubit.dart';
import 'package:flutter_boilerplate/core/business/app_cubit.dart';
import 'package:flutter_boilerplate/core/presentation/common/spacing.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginCubit loginCubit = LoginCubit();

  void _handleSubmit() {
    loginCubit.submitForm();
  }

  void _getCurrentUser() {
    print(AppCubit().state.currentUser?.toJson().toString());
  }

  @override
  void dispose() {
    loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(space4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReactiveForm(
                formGroup: loginCubit.loginForm,
                child: Column(
                  children: [
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
                    ElevatedButton(
                        onPressed: _getCurrentUser,
                        child: Text('Log Current User'))
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
