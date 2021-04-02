import 'package:fluro/fluro.dart';
import 'route_handlers.dart';

class Routes {
  static String root = '/';
  static String counterCubit = '/counterCubit';
  static String counterBloc = '/counterBloc';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;
    router.define(root, handler: rootHandler);
    router.define(counterBloc, handler: counterBlocRouteHandler);
    router.define(counterCubit, handler: counterCubitRouteHandler);
  }
}
