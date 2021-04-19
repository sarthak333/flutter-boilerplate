import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter_boilerplate/core/business/global_app_state/app_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

class App {
  static final App _singleton = App._internal();
  factory App() => _singleton;
  App._internal();
  static App get shared => _singleton;

  static FluroRouter router = router;

  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  // ignore: non_constant_identifier_names
  static String ENV = env['KEY'].toString();
  // ignore: non_constant_identifier_names
  static String API_URL = env['API_URL'].toString();
  static String token = AppBloc().state.token ?? '';
  late GraphQLClient apolloClient;
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

  static notifySuccess(
    String message,
  ) {
    _notify(
      Text(message),
      backgroundColor: Colors.white,
      leftBarIndicatorColor: Colors.green,
      icon: Icon(
        Icons.done,
        color: Colors.green,
      ),
    );
  }

  static notifyError(
    String message,
  ) {
    _notify(
      Text(message),
      backgroundColor: Colors.white,
      leftBarIndicatorColor: Colors.red,
      icon: Icon(
        Icons.report_gmailerrorred_rounded,
        color: Colors.red,
      ),
    );
  }

  static notifyWarning(
    String message,
  ) {
    _notify(
      Text(message),
      backgroundColor: Colors.white,
      leftBarIndicatorColor: Colors.orange,
      icon: Icon(
        Icons.report_problem_outlined,
        color: Colors.orange,
      ),
    );
  }

// Private function to handle alert pop ups
  static _notify(
    Widget child, {
    int displayDuration = 4000,
    int transitionDuration = 300,
    Brightness brightness = Brightness.light,
    List<BoxShadow> shadows = const [
      BoxShadow(
        blurRadius: 10,
        spreadRadius: 1,
        color: Colors.black12,
      )
    ],
    double barrierBlur = 3.0,
    Color barrierColor = Colors.transparent,
    FlashPosition position = FlashPosition.bottom,
    void Function()? onTap,
    Color backgroundColor = Colors.white,
    Color borderColor = Colors.transparent,
    double borderRadius = 4,
    double borderWidth = 0,
    bool enableDrag = true,
    FlashStyle? style = FlashStyle.floating,
    EdgeInsets margin = const EdgeInsets.all(8),
    Color? leftBarIndicatorColor,
    List<Widget>? actions,
    Widget? icon,
    EdgeInsets padding = const EdgeInsets.all(16),
    Widget? primaryAction,
    bool shouldIconPulse = true,
    bool showProgressIndicator = false,
    Widget? title,
    Color? progressIndicatorBackgroundColor,
    AnimationController? progressIndicatorController,
    Animation<Color>? progressIndicatorValueColor,
  }) {
    showFlash(
      context: navigatorKey.currentContext as BuildContext,
      duration: Duration(milliseconds: displayDuration),
      transitionDuration: Duration(milliseconds: transitionDuration),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          brightness: brightness,
          boxShadows: shadows,
          barrierBlur: barrierBlur,
          barrierColor: barrierColor,
          position: position,
          onTap: onTap,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderRadius: BorderRadius.circular(borderRadius),
          borderWidth: borderWidth,
          enableDrag: enableDrag,
          style: style,
          margin: margin,
          child: FlashBar(
            message: child,
            leftBarIndicatorColor: leftBarIndicatorColor,
            actions: actions,
            icon: icon,
            padding: padding,
            primaryAction: primaryAction,
            shouldIconPulse: shouldIconPulse,
            showProgressIndicator: showProgressIndicator,
            title: title,
            progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
            progressIndicatorController: progressIndicatorController,
            progressIndicatorValueColor: progressIndicatorValueColor,
          ),
        );
      },
    );
  }
}
