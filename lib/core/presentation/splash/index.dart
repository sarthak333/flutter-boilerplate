import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/application.dart';
import 'package:flutter_boilerplate/config/environment.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  void goToCubit() {
    Application.navigateTo(
      context,
      'counterCubit?message=this_is_cubit',
    );
  }

  void goToBloc() {
    Application.navigateTo(
      context,
      'counterBloc?message=this_is_bloc',
    );
  }

  void goToErrorScreen() {
    Application.navigateTo(
      context,
      'randomRoute?message=this_is_error',
    );
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
              Text('Splash screen on ${Env.key} environment'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: goToCubit,
                    child: Text('Cubit'),
                  ),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: goToBloc,
                    child: Text('Bloc'),
                  ),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: goToErrorScreen,
                    child: Text('Error Screen'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
