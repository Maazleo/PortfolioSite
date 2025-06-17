import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppDimensions.tabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.tabletBreakpoint &&
      MediaQuery.of(context).size.width < AppDimensions.desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.desktopBreakpoint;
      
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
      
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
      
  static Widget responsiveWidget({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
  
  static double responsiveValue({
    required BuildContext context,
    required double mobileValue,
    double? tabletValue,
    required double desktopValue,
  }) {
    if (isDesktop(context)) {
      return desktopValue;
    } else if (isTablet(context)) {
      return tabletValue ?? mobileValue;
    } else {
      return mobileValue;
    }
  }
  
  static EdgeInsets responsivePadding({
    required BuildContext context,
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    double padding = responsiveValue(
      context: context,
      mobileValue: mobile ?? AppDimensions.paddingM,
      tabletValue: tablet ?? AppDimensions.paddingL,
      desktopValue: desktop ?? AppDimensions.paddingXL,
    );
    
    return EdgeInsets.symmetric(horizontal: padding);
  }
} 