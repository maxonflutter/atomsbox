import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppMouseHover extends StatefulWidget {
  const AppMouseHover({
    super.key,
    required this.onEnter,
    required this.onExit,
    required this.child,
  });

  final Function(PointerEnterEvent event) onEnter;
  final Function(PointerExitEvent event) onExit;
  final Widget child;

  @override
  State<AppMouseHover> createState() => _AppMouseHoverState();
}

class _AppMouseHoverState extends State<AppMouseHover> {
  late bool hovered;

  @override
  void initState() {
    super.initState();
    hovered = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: widget.onEnter,
      onExit: widget.onExit,
      child: widget.child,
    );
  }
}
