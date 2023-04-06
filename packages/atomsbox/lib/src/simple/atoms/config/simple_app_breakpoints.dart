import 'package:flutter/material.dart';

class SimpleAppBreakpoints {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1295 &&
      MediaQuery.of(context).size.width > 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1295;
}
