import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/business/bloc/counter_bloc.dart';
import 'package:flutter_boilerplate/core/business/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/core/presentation/error/index.dart';
import 'package:flutter_boilerplate/core/presentation/home_bloc/index.dart';
import 'package:flutter_boilerplate/core/presentation/home_cubit/index.dart';
import 'package:flutter_boilerplate/core/presentation/splash/index.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Splash();
});

var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ErrorScreen();
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
