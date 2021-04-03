import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/SimpleBlocObserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/presentation/app/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(AppComponent());
}
