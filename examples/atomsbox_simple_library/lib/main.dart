import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'simple/simple_preview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: SimpleTheme.theme,
      home: const SimplePreviewDarkScreen(),
    );
  }
}
