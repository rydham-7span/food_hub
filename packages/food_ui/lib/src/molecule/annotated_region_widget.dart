import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  const AnnotatedRegionWidget({required bool isDark, required this.child, super.key}) : _isDark = isDark;
  final Widget child;
  final bool _isDark;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
