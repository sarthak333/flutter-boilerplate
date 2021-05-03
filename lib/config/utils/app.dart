import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter_boilerplate/core/business/app_cubit.dart';
import 'package:flutter_boilerplate/core/presentation/common/spacing.dart';
import 'package:flutter_boilerplate/core/presentation/common/widgets/bottom_sheet.dart';
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
  static String token = AppCubit().state.token ?? '';
  late GraphQLClient apolloClient;

  /// Use this function to navigateTo a new route. For eg: transition
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

  /// Pop the current screen and go back to the previous one
  static goBack(BuildContext context) {
    router.pop(context);
  }

  static screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
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

  static showBottomSheet(
    Widget child, {
    BuildContext? context,
    Color? backgroundColor,
    Color? barrierColor,
    Clip? clipBehaviour,
    double? elevation,
    bool? enableDrag,
    bool? isDismissible,
    bool? isScrollControlled,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    bool? useRootNavigator,
    ShapeBorder? shape,
    double? height,
    double? width,
    EdgeInsetsGeometry? sheetPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    Widget? sheetThumb,
  }) {
    showModalBottomSheet(
        context: context ?? navigatorKey.currentContext as BuildContext,
        backgroundColor: backgroundColor ?? Colors.white,
        barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
        clipBehavior: clipBehaviour,
        elevation: elevation,
        enableDrag: enableDrag ?? true,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        routeSettings: routeSettings,
        transitionAnimationController: transitionAnimationController,
        useRootNavigator: useRootNavigator ?? true,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
        builder: (builder) {
          return CommonBottomSheet(
            child,
            height: height,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            sheetPadding: sheetPadding,
            sheetThumb: sheetThumb,
            width: width,
          );
        });
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
    EdgeInsets margin = const EdgeInsets.all(space2),
    Color? leftBarIndicatorColor,
    List<Widget>? actions,
    Widget? icon,
    EdgeInsets padding = const EdgeInsets.all(space4),
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
