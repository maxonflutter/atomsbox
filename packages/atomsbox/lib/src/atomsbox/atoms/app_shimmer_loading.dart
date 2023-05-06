import 'package:flutter/material.dart';

class AppShimmer extends StatefulWidget {
  const AppShimmer({
    super.key,
    this.linearGradient = const LinearGradient(
      colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    ),
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  static AppShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppShimmerState>();
  }

  @override
  AppShimmerState createState() => AppShimmerState();
}

class AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _appShimmerController;

  @override
  void initState() {
    super.initState();

    _appShimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );
  }

  @override
  void dispose() {
    _appShimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(
            slidePercent: _appShimmerController.value),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final appShimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: appShimmerBox);
  }

  Listenable get appShimmerChanges => _appShimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class AppShimmerLoading extends StatefulWidget {
  const AppShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<AppShimmerLoading> createState() => _AppShimmerLoadingState();
}

class _AppShimmerLoadingState extends State<AppShimmerLoading> {
  Listenable? _appShimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_appShimmerChanges != null) {
      _appShimmerChanges!.removeListener(_onAppShimmerChange);
    }
    _appShimmerChanges = AppShimmer.of(context)?.appShimmerChanges;
    if (_appShimmerChanges != null) {
      _appShimmerChanges!.addListener(_onAppShimmerChange);
    }
  }

  @override
  void dispose() {
    _appShimmerChanges?.removeListener(_onAppShimmerChange);
    super.dispose();
  }

  void _onAppShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the AppShimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor AppShimmer info.
    final appShimmer = AppShimmer.of(context)!;
    if (!appShimmer.isSized) {
      // The ancestor AppShimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final appShimmerSize = appShimmer.size;
    final gradient = appShimmer.gradient;
    final offsetWithinAppShimmer = appShimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinAppShimmer.dx,
            -offsetWithinAppShimmer.dy,
            appShimmerSize.width,
            appShimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
