import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/application.dart';
import 'package:flutter_boilerplate/config/routes/routes.dart';

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
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Flutter boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
