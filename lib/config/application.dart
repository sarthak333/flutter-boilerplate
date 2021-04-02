import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application {
  static final Application _singleton = Application._internal();
  factory Application() => _singleton;
  Application._internal();
  static Application get shared => _singleton;

  static FluroRouter router = router;

  // Use this function to set common global specifications for the navigation. For eg: transition
  static navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    TransitionType? transition = TransitionType.cupertino,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionBuilder,
    RouteSettings? routeSettings,
  }) {
    router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      routeSettings: routeSettings,
    );
  }
}
