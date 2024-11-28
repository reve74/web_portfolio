import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Responsive extends HookWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.desktop,
    super.key,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 900) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
