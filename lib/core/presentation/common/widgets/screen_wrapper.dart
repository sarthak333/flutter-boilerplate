import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/presentation/splash/index.dart';

class ScreenWrapper extends StatefulWidget {
  final Widget child;
  ScreenWrapper(this.child);
  @override
  _ScreenWrapperState createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
