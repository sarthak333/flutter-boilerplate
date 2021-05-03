import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/core/presentation/common/spacing.dart';
import 'package:flutter_boilerplate/core/presentation/common/styles/bottom_sheet_style.dart';
import 'package:flutter_boilerplate/core/presentation/common/widgets/spacing.dart';

class CommonBottomSheet extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? sheetPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? sheetThumb;

  CommonBottomSheet(
    this.child, {
    this.height,
    this.width,
    this.sheetPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.sheetThumb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? (App.screenHeight(context) / 3),
      constraints: BoxConstraints(
        maxHeight: App.screenHeight(context) - 50,
      ),
      padding: sheetPadding ?? defaultSheetPadding,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          sheetThumb ??
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 6,
                  width: width ?? (App.screenWidth(context) / 4),
                  decoration: defaultSheetThumbStyle,
                ),
              ),
          spacingHeight(space5),
          Expanded(
            child: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.start,
                children: [
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
