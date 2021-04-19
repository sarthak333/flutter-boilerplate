import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/presentation/common/widgets/screen_wrapper.dart';
import 'package:flutter_boilerplate/core/business/bloc/counter_bloc.dart';
import 'package:flutter_boilerplate/core/business/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/core/presentation/error/index.dart';
import 'package:flutter_boilerplate/core/presentation/counter_bloc/index.dart';
import 'package:flutter_boilerplate/core/presentation/counter_cubit/index.dart';
import 'package:flutter_boilerplate/core/presentation/home/index.dart';
import 'package:flutter_boilerplate/core/presentation/splash/index.dart';

var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ErrorScreen();
});

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ScreenWrapper(Splash());
});

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ScreenWrapper(Home());
});

var counterBlocRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (BuildContext context) => CounterBloc(),
    child: CounterBlocPage(),
  );
});

var counterCubitRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (BuildContext context) => CounterCubit(),
    child: CounterCubitPage(),
  );
});
