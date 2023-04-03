import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleBanner extends StatelessWidget {
  const SimpleBanner({
    Key? key,
    required this.text,
    this.height = 56.0,
    this.onTap,
  }) : super(key: key);

  const SimpleBanner.skinny({
    Key? key,
    required this.text,
    this.height = 56.0,
    this.onTap,
  }) : super(key: key);

  // const SimpleBanner.cookies({
  //   Key? key,
  //   required this.text,
  //   this.height = 56.0,
  //   this.onTap,
  // }) : super(key: key);

  final String text;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SimpleGradientContainer(
        [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.primary,
        ],
        const [0, 1],
        height: height,
        width: double.infinity,
        child: Center(
          child: SimpleText(
            text,
            color: Theme.of(context).colorScheme.onPrimary,
            textStyle: SimpleTextStyle.bodyLarge,
          ),
        ),
      ),
    );
  }
}
