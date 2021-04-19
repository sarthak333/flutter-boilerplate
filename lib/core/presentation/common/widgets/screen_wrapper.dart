import 'package:flutter/material.dart';

class ScreenWrapper extends StatefulWidget {
  final Widget child;
  ScreenWrapper(this.child);
  @override
  _ScreenWrapperState createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
