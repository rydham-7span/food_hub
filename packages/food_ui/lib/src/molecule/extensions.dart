import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:food_ui/src/molecule/color_data.dart';
import 'package:food_ui/src/molecule/extension_utils.dart';
import 'package:food_ui/src/molecule/theme.dart';
import 'package:food_ui/src/molecule/typography.dart';
import 'package:timeago/timeago.dart' show format;

extension BuildContextX on BuildContext {
  AppColorsData get colorScheme => AppTheme.maybeOf(this)?.colors ?? AppColorsData.light();

  AppTypographyData? get textTheme => AppTheme.maybeOf(this)?.typography;

  bool get isDarkMode => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;
}

extension DateTimeX on DateTime {
  String defaultFormat() => DateFormat('MMM dd, yyyy').format(this);
  String requestFormat() => DateFormat('yyyy-MM-dd').format(this);
  String dayWithMonthFormat() => DateFormat('dd MMM').format(this);
  String historyFormat() => DateFormat('E MMM d, y h:mm:ss a').format(this);
  String lastValidateFormat() => DateFormat('MMM d, y h:mm:ss a').format(this);
  String storageFormat() => DateFormat('dd MMM yyyy hh:mm a').format(this).toUpperCase();
  String eventFormat() => DateFormat('EEE · MMM dd').format(this).toUpperCase();
  String appBarFormat() => DateFormat('EEE, MMM dd').format(this);
  String eventSearchFormat() => DateFormat('MMM dd').format(this);
  String startTimeFormat() => DateFormat('h:mm a').format(this).toUpperCase();
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;

  String get ago => format(
        DateTime.now().toUtc().subtract(DateTime.now().toUtc().difference(this)),
      );
}

extension DurationDoubleExtension on double {
  ///Usage
  ///```dart
  ///2.milliseconds
  ///```
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  ///Usage
  ///```dart
  ///2.ms
  ///```
  Duration get ms => milliseconds;

  ///Usage
  ///```dart
  ///2.seconds
  ///```
  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  ///Usage
  ///```dart
  ///2.minutes
  ///```
  Duration get minutes => Duration(seconds: (this * Duration.secondsPerMinute).round());

  ///Usage
  ///```dart
  ///2.hours
  ///```
  Duration get hours => Duration(minutes: (this * Duration.minutesPerHour).round());

  ///Usage
  ///```dart
  ///2.days
  ///```
  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());
}

extension DurationIntegerExtension on int {
  Duration get seconds => Duration(seconds: this);

  Duration get days => Duration(days: this);

  Duration get hours => Duration(hours: this);

  Duration get minutes => Duration(minutes: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Duration get microseconds => Duration(microseconds: this);

  Duration get ms => milliseconds;
}

extension AppStringUtils on String {
  /// Discover if the String is a URL file
  bool get isURL => ExtensionUtils.isURL(this);

  /// capitalize the String
  String get capitalize => ExtensionUtils.capitalize(this);

  /// Capitalize the first letter of the String
  String get capitalizeFirst => ExtensionUtils.capitalizeFirst(this);

  /// remove all whitespace from the String
  String get removeAllWhitespace => ExtensionUtils.removeAllWhitespace(this);

  /// converter the String
  String? get camelCase => ExtensionUtils.camelCase(this);

  /// Discover if the String is a valid URL
  String? get paramCase => ExtensionUtils.paramCase(this);
}
