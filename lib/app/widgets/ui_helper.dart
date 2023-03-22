import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class UIHelper {
  UIHelper._();

  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static double setSp(double size) {
    return size.sp;
  }

  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  static Widget loading({Color? color, double? width, double? height}) {
    return SizedBox(
      width: width ?? UIHelper.setSp(80),
      height: height ?? UIHelper.setSp(80),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(
              color == null ? Colors.green : color),
        ),
      ),
    );
  }

  static EdgeInsetsGeometry padSymmetric(
      {double? horizontal,
      double? vertical,
      double? cwTop,
      double? cwBottom,
      double? cwLeft,
      double? cwRight}) {
    return EdgeInsets.symmetric(
            vertical: UIHelper.setHeight(vertical ?? 0),
            horizontal: UIHelper.setWidth(horizontal ?? 0))
        .copyWith(
            top: cwTop ?? UIHelper.setHeight(vertical ?? 0),
            bottom: cwBottom ?? UIHelper.setHeight(vertical ?? 0),
            right: cwRight ?? UIHelper.setWidth(horizontal ?? 0),
            left: cwLeft ?? UIHelper.setWidth(horizontal ?? 0));
  }

  static EdgeInsetsGeometry padAll(double size,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.all(UIHelper.setHeight(size)).copyWith(
        top: cwTop ?? UIHelper.setHeight(size),
        bottom: cwBottom ?? UIHelper.setHeight(size),
        right: cwRight ?? UIHelper.setHeight(size),
        left: cwLeft ?? UIHelper.setHeight(size));
  }

  static EdgeInsetsGeometry padLTRB(
      double left, double top, double right, double bottom,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.fromLTRB(UIHelper.setWidth(left), UIHelper.setHeight(top),
            UIHelper.setWidth(right), UIHelper.setHeight(bottom))
        .copyWith(
            top: cwTop ?? UIHelper.setHeight(top),
            bottom: cwBottom ?? UIHelper.setHeight(bottom),
            right: cwRight ?? UIHelper.setWidth(right),
            left: cwLeft ?? UIHelper.setWidth(left));
  }

  static Widget loadingWidget(
      {double? height, Color? color, Color? loadingColor}) {
    return Container(
      height: height ?? UIHelper.setHeight(800),
      color: color,
      child: Center(child: UIHelper.loading(color: loadingColor)),
    );
  }

  static Widget emptyCaseWidget(BuildContext context,
      {required String emptyText, double? height}) {
    return Container(
      padding: UIHelper.padSymmetric(vertical: 50, horizontal: 30),
      height: height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              emptyText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            UIHelper.verticalSpace(40),
          ],
        ),
      ),
    );
  }

  static double setFont(double font) {
    return ScreenUtil().setSp(font);
  }

  static double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  static Size size(BuildContext context) => MediaQuery.of(context).size;

  static Size appBarSize(BuildContext context) =>
      Size(size(context).width, 55.0 + statusBarHeight(context));

  static double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: setHeight(height));
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: setWidth(width));
  }

  static Widget divider({Color? color, double? thickness, double? height}) {
    return Divider(
      color: color,
      thickness: thickness ?? 1,
      height: height,
    );
  }

  static Widget pokeballLoading({double? height, double? width}) {
    return Lottie.asset(
      "assets/raw/pokeball_lottie.json",
      height: height ?? 50.sp,
      width: width ?? 50.sp,
    );
  }
}
