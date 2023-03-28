import 'package:flutter/material.dart';

import '../atoms/simple_app_theme.dart';
import '../atoms/simple_constants.dart';
import 'simple_list_tile.dart';

/// A simple accordion widget with expandable and collapsible content.
///
/// The [SimpleAccordion] widget displays a title and a list of children
/// widgets. The children are initially hidden and can be shown or hidden
/// by tapping on the title.
///
/// The [title] argument is required and represents the text displayed
/// at the top of the accordion. The [children] argument is a list of widgets
/// displayed inside the accordion when it is expanded.
///
/// The [initiallyExpanded] argument is optional and determines whether the
/// accordion should be expanded or collapsed when first built. The default
/// value is false.
///
/// The [maintainState] argument is optional and determines whether the
/// accordion should maintain the state of its children when collapsed. The
/// default value is false.
///
/// See also:
/// * [ExpansionPanel], a Material Design expansion panel with more advanced features.
///
class SimpleAccordion extends StatefulWidget {
  const SimpleAccordion({
    super.key,
    required this.title,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    this.maintainState = false,
  });

  /// The text displayed at the top of the accordion.
  final String title;

  /// The list of widgets displayed inside the accordion when expanded.
  final List<Widget> children;

  /// Whether the accordion should be expanded when first built.
  ///
  /// Defaults to false.
  final bool initiallyExpanded;

  /// Whether the accordion should maintain the state of its children when collapsed.
  ///
  /// Defaults to false.
  final bool maintainState;

  @override
  State<SimpleAccordion> createState() => _SimpleAccordionState();
}

class _SimpleAccordionState extends State<SimpleAccordion>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: const EdgeInsets.all(SimpleConstants.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleListTile(
            onTap: _handleTap,
            title: widget.title,
            trailing: RotationTransition(
              turns: _iconTurns,
              child: Icon(
                Icons.expand_more,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            colorPalette: ColorPalette.primary,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
