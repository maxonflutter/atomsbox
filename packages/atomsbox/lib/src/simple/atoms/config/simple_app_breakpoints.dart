import 'package:flutter/material.dart';

class SimpleAppBreakpoints {
  static bool isNarrow(BuildContext context) =>
      MediaQuery.of(context).size.width < 1295;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width < 1295;

  // static bool isMobile(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 690;

  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 950 &&
  //     MediaQuery.of(context).size.width >= 690;

  // static bool isWideTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 1295 &&
  //     MediaQuery.of(context).size.width >= 950;

  // static bool isDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 1500 &&
  //     MediaQuery.of(context).size.width >= 1295;

  // static bool isWideDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 1500;
}
