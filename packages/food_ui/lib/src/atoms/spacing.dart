import 'package:flutter/material.dart';
import 'package:food_ui/src/atoms/atoms.dart';

final class VSpace extends StatelessWidget {
  const VSpace(this.size, {super.key});

  /// size = 4
  factory VSpace.xxsmall() => const VSpace(Insets.xxsmall);

  /// size = 8
  factory VSpace.xsmall() => const VSpace(Insets.xsmall);

  /// size = 12
  factory VSpace.small() => const VSpace(Insets.small);

  /// size = 16
  factory VSpace.medium() => const VSpace(Insets.medium);

  /// size = 24
  factory VSpace.large() => const VSpace(Insets.large);

  /// size = 32
  factory VSpace.xlarge() => const VSpace(Insets.xlarge);

  /// size = 48
  factory VSpace.xxlarge() => const VSpace(Insets.xxlarge);

  /// size = 64
  factory VSpace.xxxlarge() => const VSpace(Insets.xxxlarge);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}

/// This class is used for implementing horizontal spacing inside your Flutter App.
/// Thus instead of writing:
/// ```dart
/// const SizedBox(width: 8)
/// ```
///
/// You can write:
/// ```dart
/// HSpace.xsmall()
/// ```
///
/// This will ensure that whenever user wants to change the spacing throughout the app,
/// they will be able to do by modifying just this class

final class HSpace extends StatelessWidget {
  const HSpace(this.size, {super.key});

  factory HSpace.xxsmall() => const HSpace(Insets.xxsmall);
  factory HSpace.xsmall() => const HSpace(Insets.xsmall);
  factory HSpace.small() => const HSpace(Insets.small);
  factory HSpace.medium() => const HSpace(Insets.medium);
  factory HSpace.large() => const HSpace(Insets.large);
  factory HSpace.xlarge() => const HSpace(Insets.xlarge);
  factory HSpace.xxlarge() => const HSpace(Insets.xxlarge);
  factory HSpace.xxxlarge() => const HSpace(Insets.xxxlarge);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}
