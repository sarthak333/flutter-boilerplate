import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/core/presentation/common/widgets/spacing.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _goToCubit() {
    App.navigateTo(
      context,
      'counterCubit?message=this_is_cubit',
    );
  }

  void _goToBloc() {
    App.navigateTo(
      context,
      'counterBloc?message=this_is_bloc',
    );
  }

  void _goToErrorScreen() {
    App.navigateTo(
      context,
      'randomRoute?message=this_is_error',
    );
  }

  void _goToLogin() {
    App.navigateTo(
      context,
      'login?message=this_is_login',
    );
  }

  void _openBottomSheet() {
    App.showBottomSheet(Text('This is a bottom sheet'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home screen on ${App.ENV} environment'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _goToCubit,
                    child: Text('Cubit'),
                  ),
                  spacingWidth(4),
                  ElevatedButton(
                    onPressed: _goToBloc,
                    child: Text('Bloc'),
                  ),
                  spacingWidth(4),
                  ElevatedButton(
                    onPressed: _goToErrorScreen,
                    child: Text('Error Screen'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        App.notifySuccess('Write your message here'),
                    child: Text('Alert Success'),
                  ),
                  spacingWidth(4),
                  ElevatedButton(
                    onPressed: () => App.notifyError('Write your message here'),
                    child: Text('Alert Error'),
                  ),
                  spacingWidth(4),
                  ElevatedButton(
                    onPressed: () =>
                        App.notifyWarning('Write your message here'),
                    child: Text('Alert warning'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _goToLogin,
                    child: Text('Login'),
                  ),
                  spacingWidth(4),
                  ElevatedButton(
                    onPressed: _openBottomSheet,
                    child: Text('Bottom Sheet'),
                  ),
                  spacingWidth(4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
