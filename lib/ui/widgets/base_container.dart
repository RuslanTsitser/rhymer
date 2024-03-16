import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width,
    this.margin,
    this.padding = const EdgeInsets.all(12),
  });
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: width ?? double.infinity,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child);
  }
}
