import 'package:flutter/material.dart';

class AppBreakpoints {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 720;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1295 &&
      MediaQuery.of(context).size.width > 720;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1295;
}
