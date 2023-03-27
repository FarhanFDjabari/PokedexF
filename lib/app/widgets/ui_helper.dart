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
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.green),
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
      height: height ?? setSp(50),
      width: width ?? setSp(50),
    );
  }

  static Image networkImageLoader({
    required String imageUrl,
    double? width,
    double? height,
    double? scale,
    BoxFit? fit,
    bool useLoadingBuilder = false,
  }) {
    try {
      return Image.network(
        imageUrl,
        scale: scale ?? 1.0,
        width: width != null ? setSp(width) : null,
        height: height != null ? setSp(height) : null,
        fit: fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return SizedBox(
            width: width != null ? setSp(width) : null,
            height: height != null ? setSp(height) : null,
            child: child,
          );
        },
        loadingBuilder: useLoadingBuilder
            ? (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return Center(
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 2.5,
                    value: loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1),
                  ),
                );
              }
            : null,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            width: width != null ? setSp(width) : null,
            height: height != null ? setSp(height) : null,
            child: assetImageLoader(
              assetUri: "assets/images/pikachu_placeholder_icon.png",
            ),
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      return assetImageLoader(
        assetUri: "assets/images/pikachu_placeholder_icon.png",
        height: height != null ? setSp(height) : null,
        width: width != null ? setSp(width) : null,
      );
    }
  }

  static Image assetImageLoader({
    required String assetUri,
    Color? color,
    double? width,
    double? height,
    double? scale,
    BoxFit? fit,
    FilterQuality? filterQuality,
    Alignment? alignment,
  }) {
    return Image.asset(
      assetUri,
      scale: scale,
      color: color,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      filterQuality: filterQuality ?? FilterQuality.low,
      width: width != null ? setSp(width) : null,
      height: height != null ? setSp(height) : null,
    );
  }
}
