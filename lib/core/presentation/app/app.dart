import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/config/routes/routes.dart';
import 'package:flutter_boilerplate/core/business/global_app_state/app_bloc.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(),
      child: MaterialApp(
        navigatorKey: App.navigatorKey,
        title: 'Flutter boilerplate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: App.router.generator,
      ),
    );
  }
}
