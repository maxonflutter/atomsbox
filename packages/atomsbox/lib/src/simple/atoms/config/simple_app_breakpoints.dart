import 'package:flutter/material.dart';

class SimpleAppBreakpoints {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 690;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 950 &&
      MediaQuery.of(context).size.width >= 690;

  static bool isWideTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 950;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1500 &&
      MediaQuery.of(context).size.width >= 1200;

  static bool isWideDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1500;
}
