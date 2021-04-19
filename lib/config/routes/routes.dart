import 'package:fluro/fluro.dart';
import 'route_handlers.dart';

class Routes {
  static String counterCubit = '/counterCubit';
  static String counterBloc = '/counterBloc';
  static String home = '/home';
  static String login = '/login';
  static String root = '/';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;
    router.define(counterBloc, handler: counterBlocRouteHandler);
    router.define(counterCubit, handler: counterCubitRouteHandler);
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(root, handler: rootHandler);
  }
}
