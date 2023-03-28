import 'package:flutter/material.dart';

/// A widget that animates a child widget into view with a fade-in and translate effect.
///
/// The [AnimateInEffectWrapper] widget wraps a child widget and applies a fade-in
/// and translate effect when the widget is first built. The animation is controlled
/// by the [duration], [initialDelay], [initialOffset], and [keepAlive] properties.
///
/// See also:
///
/// * [AnimatedBuilder], which builds the animation for the child.
/// * [FadeTransition], which animates the opacity of the child.
/// * [Transform.translate], which animates the position of the child.
///
class AnimateInEffectWrapper extends StatefulWidget {
  const AnimateInEffectWrapper({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.initialDelay = const Duration(milliseconds: 500),
    this.initialOffset = const Offset(0, 30),
    this.keepAlive = false,
    required this.child,
  }) : super(key: key);

  /// The duration of the animation effect.
  ///
  /// Default value is 500 milliseconds.
  final Duration duration;

  /// The delay before the animation starts.
  ///
  /// Default value is 500 milliseconds.
  final Duration initialDelay;

  /// The initial offset of the child when the animation starts.
  ///
  /// Default value is an [Offset] with 0 in the x-axis and 30 in the y-axis.
  final Offset initialOffset;

  /// Whether to keep the widget alive when it is not visible on the screen.
  ///
  /// Default value is false.
  final bool keepAlive;

  /// The widget below this widget in the tree.
  ///
  /// This child widget will be animated when the [AnimateInEffectWrapper] is built.
  final Widget child;

  @override
  State<AnimateInEffectWrapper> createState() => _AnimateInEffectWrapperState();
}

class _AnimateInEffectWrapperState extends State<AnimateInEffectWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    Future.delayed(
      widget.initialDelay,
      () {
        if (!mounted) return;
        animationController.forward();
      },
    );

    Curve intervalCurve = const Interval(0, 1, curve: Curves.easeOut);

    offsetAnimation = Tween<Offset>(
      begin: widget.initialOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      ),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
