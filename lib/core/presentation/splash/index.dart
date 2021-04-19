import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), _goToHome);
  }

  void _goToHome() {
    App.navigateTo(context, 'home?message=this_is_home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Splash screen')),
      ),
    );
  }
}
