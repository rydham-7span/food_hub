import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ui/src/molecule/extensions.dart';
import 'package:food_ui/src/molecule/molecule.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:food_localization/food_localization.dart';
import 'package:food_ui/gen/assets.gen.dart';
import 'package:food_ui/src/atoms/atoms.dart';
import 'package:sprintf/sprintf.dart';

abstract class AppUtils {
  static void showSnackBar(
    BuildContext? context,
    String? text, {
    bool? isError,
  }) {
    if (context != null) {
      final snackBar = SnackBar(
        content: AppText.regular(
          text ?? 'Something went wrong, please try again.',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        backgroundColor: isError ?? false ? Colors.red : Colors.green,
        duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  static String? emptyFieldValidation(String? string) {
    if (string?.isNotEmpty ?? false) {
      return null;
    }
    return 'This field cannot be empty';
  }

  static const String sofiaSansFont = 'SofiaSans';
  static const int maxTicketSelection = 10;
  static const String bulletHelper = '\u2022';

  static List<BottomNavigationBarItem> bottomBarItems({
    required int index,
    required BuildContext context,
    bool isForEventDetails = false,
  }) {
    final colorMap = {
      0: context.colorScheme.m3GreyColor,
      1: context.colorScheme.redSecondaryContainer,
    };
    return isForEventDetails
        ? [
            BottomNavigationBarItem(
              icon: Assets.icons.dashboardTab.svg(
                height: 26,
                width: 26,
                color: index == 0 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.dashboard.tr(),
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.settingTab.svg(
                height: 26,
                width: 26,
                color: index == 1 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.settings.tr(),
            ),
          ]
        : [
            BottomNavigationBarItem(
              icon: Assets.icons.dashboardTab.svg(
                height: 26,
                width: 26,
                color: index == 0 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.dashboard.tr(),
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.guestTab.svg(
                height: 26,
                width: 26,
                color: index == 1 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.guest_list.tr(),
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.scanner.svg(
                height: 24,
                width: 24,
                color: index == 2 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.scanner.tr(),
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.rolesTab.svg(
                height: 26,
                width: 26,
                color: index == 3 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.roles.tr(),
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.settingTab.svg(
                height: 26,
                width: 26,
                color: index == 4 ? colorMap[1] : colorMap[0],
              ),
              label: LocaleKeys.settings.tr(),
            ),
          ];
  }

  static String? emailValidator(String? fieldContent) {
    final content = fieldContent ?? '';
    if (content.isEmpty) {
      return 'Enter an Email';
    } else {
      if (_isEmailValid(content)) {
        return null;
      } else {
        return 'Please enter a valid email';
      }
    }
  }

  static String? confirmPasswordValidator(
    String? fieldContent,
    String? password,
  ) {
    final content = fieldContent ?? '';
    if (content.isEmpty) {
      return 'This field cannot be empty';
    } else if (password?.isEmpty ?? true) {
      return 'Password cannot be empty';
    } else {
      if (fieldContent == password) {
        return null;
      } else {
        return LocaleKeys.confirm_pwd_validation.tr();
      }
    }
  }

  static String? confirmPasswordValidatorForRole(
    String? fieldContent,
    String? password,
  ) {
    final content = fieldContent ?? '';
    if (content.isEmpty && (password?.isNotEmpty ?? false)) {
      return 'This field cannot be empty';
    } else {
      if (fieldContent == password) {
        return null;
      } else {
        return LocaleKeys.confirm_pwd_validation.tr();
      }
    }
  }

  static String? requiredFieldValidator(String? fieldContent) {
    final content = fieldContent ?? '';
    if (content.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static bool _isEmailValid(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  static String? phoneValidator(String? fieldContent) {
    final content = fieldContent ?? '';
    if (content.isEmpty) {
      return 'Enter a Phone number';
    } else {
      if (_isValidPhoneNumber(content)) {
        return 'Enter a valid phone number';
      } else {
        return null;
      }
    }
  }

  static bool _isValidPhoneNumber(String? value) => value?.length != 10;

  static Future<void> errorDialog({
    required BuildContext context,
    VoidCallback? retryCallback,
    String? contentMsg,
    String? title,
    double? maxWidth,
    bool isInformative = false,
    VoidCallback? cancelCallback,
    VoidCallback? informativeCallback,
    bool useRootNavigator = true,
  }) {
    return showAdaptiveDialog(
      useRootNavigator: useRootNavigator,
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: AppText.medium(
          title ?? LocaleKeys.alert.tr(),
          fontSize: 18,
          textAlign: Platform.isIOS ? TextAlign.center : TextAlign.start,
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.8),
          child: AppText.regular(
            contentMsg ?? LocaleKeys.error.tr(),
            fontSize: 16,
            maxLines: 15,
            textAlign: Platform.isIOS ? TextAlign.center : TextAlign.start,
          ),
        ),
        actions: [
          if (!isInformative) ...[
            TextButton(
              onPressed: cancelCallback ??
                  () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
              child: AppText.regular(
                LocaleKeys.cancel.tr(),
                color: Platform.isIOS ? AppColors.actionBlue : null,
              ),
            ),
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (retryCallback != null) {
                  retryCallback();
                }
              },
              child: AppText.bold(
                LocaleKeys.retry.tr(),
                color: Platform.isIOS ? AppColors.actionBlue : null,
              ),
            ),
          ] else
            TextButton(
              onPressed: informativeCallback ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: AppText.bold(
                LocaleKeys.ok.tr(),
                color: Platform.isIOS ? AppColors.actionBlue : null,
              ),
            ),
        ],
      ),
    );
  }

  // static Future<void> consentDialog({
  //   required BuildContext context,
  //   required String agreedCaption,
  //   required String contentMsg,
  //   String? title,
  //   VoidCallback? agreedCallback,
  //   bool useRootNavigator = true,
  // }) {
  //   return showAdaptiveDialog(
  //     useRootNavigator: useRootNavigator,
  //     context: context,
  //     builder: (context) => AlertDialog.adaptive(
  //       title: AppText.medium(
  //         title ?? LocaleKeys.alert.tr(),
  //         fontSize: 18,
  //         textAlign: Platform.isIOS ? TextAlign.center : null,
  //       ),
  //       content: ConstrainedBox(
  //         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.8),
  //         child: AppText.regular(
  //           contentMsg,
  //           fontSize: 16,
  //           maxLines: 4,
  //           textAlign: Platform.isIOS ? TextAlign.center : null,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             FocusScope.of(context).unfocus();
  //             Navigator.of(context).pop();
  //           },
  //           child: AppText.regular(
  //             LocaleKeys.cancel.tr(),
  //             color: Platform.isIOS ? AppColors.actionBlue : null,
  //             fontFamily: AppUtils.sfFont,
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             FocusScope.of(context).unfocus();
  //             if (agreedCallback != null) {
  //               agreedCallback();
  //             }
  //           },
  //           child: AppText.bold(
  //             agreedCaption,
  //             color: Platform.isIOS ? AppColors.actionBlue : null,
  //             fontFamily: AppUtils.sfFont,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Color materialStateColors(
    Set<MaterialState> states, {
    required Color enabledColor,
    required Color disabledColor,
  }) {
    final data = {
      MaterialState.disabled,
    };
    if (states.any(data.contains)) {
      return disabledColor;
    } else {
      return enabledColor;
    }
  }

  // static Future<String?> commonDatePicker(
  //   BuildContext context, {
  //   String? initialDate,
  // }) async {
  //   final result = await showDatePicker(
  //     context: context,
  //     initialDate:
  //         initialDate != null ? DateTimeUtils.stringToDateTime(initialDate) : DateTime.now(),
  //     firstDate: DateTime(1950),
  //     lastDate: DateTime(2100),
  //     builder: (_, Widget? child) {
  //       return Theme(
  //         data: ThemeData.dark().copyWith(
  //           colorScheme: ColorScheme.dark(
  //             primary: context.colorScheme.redSecondaryContainer,
  //           ),
  //         ),
  //         child: child ?? const SizedBox.shrink(),
  //       );
  //     },
  //   );
  //   if (result != null) {
  //     return result.requestFormat();
  //   }
  //   return null;
  // }

  // static Future<DateTimeRange?> commonRangePicker(
  //   BuildContext context, {
  //   String? initialDate,
  //   String? lastDate,
  // }) async {
  //   final result = await showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime(1950),
  //     lastDate: DateTime(2100),
  //     initialDateRange: initialDate != null && lastDate != null
  //         ? DateTimeRange(
  //             start: DateTimeUtils.stringToDateTime(initialDate),
  //             end: DateTimeUtils.stringToDateTime(lastDate),
  //           )
  //         : null,
  //     builder: (_, Widget? child) {
  //       return Theme(
  //         data: ThemeData.dark().copyWith(
  //           colorScheme: ColorScheme.dark(
  //             primary: context.colorScheme.redSecondaryContainer,
  //             secondary: context.colorScheme.redSecondaryContainer.withOpacity(0.4),
  //           ),
  //           textSelectionTheme: TextSelectionThemeData(
  //             cursorColor: context.colorScheme.m3White,
  //           ),
  //         ),
  //         child: child ?? const SizedBox.shrink(),
  //       );
  //     },
  //   );
  //   if (result != null) {
  //     return result;
  //   } else {
  //     return null;
  //   }
  // }

  static (String, String) calculateDateRange(String selectedOption) {
    final now = DateTime.now();
    late String startDateEpoch;
    late String endDateEpoch;
    switch (selectedOption) {
      case 'Today':
        startDateEpoch = DateTime(now.year, now.month, now.day).requestFormat();
        endDateEpoch = startDateEpoch;
      case 'Last 7 days':
        startDateEpoch = now.subtract(const Duration(days: 7)).requestFormat();
        endDateEpoch = now.requestFormat();
      case 'Last 30 days':
        startDateEpoch = now.subtract(const Duration(days: 30)).requestFormat();
        endDateEpoch = now.requestFormat();
      case 'Last 60 days':
        startDateEpoch = now.subtract(const Duration(days: 60)).requestFormat();
        endDateEpoch = now.requestFormat();
      case 'Last 90 days':
        startDateEpoch = now.subtract(const Duration(days: 90)).requestFormat();
        endDateEpoch = now.requestFormat();
      case 'Year to date':
        final oneYearAgo = DateTime(now.year - 1, now.month, now.day);
        startDateEpoch =
            DateTime(oneYearAgo.year, oneYearAgo.month, oneYearAgo.day).requestFormat();
        endDateEpoch = DateTime(now.year, now.month, now.day).requestFormat();
      default:
        startDateEpoch = DateTime(now.year, now.month, now.day).requestFormat();
        endDateEpoch = startDateEpoch;
    }
    return (startDateEpoch, endDateEpoch);
  }

  // static String getStringForRange(String startTime, String endTime) {
  //   return '${DateTimeUtils.stringToDateTime(startTime).eventSearchFormat()} - ${DateTimeUtils.stringToDateTime(endTime).eventSearchFormat()}';
  // }

  static const compTypeData = <int, String>{
    0: 'artist',
    1: 'general',
    2: 'radio',
  };

  static void performHaptics({HapticMode hapticMode = HapticMode.medium}) {
    switch (hapticMode) {
      case HapticMode.low:
        HapticFeedback.lightImpact();
      case HapticMode.medium:
        HapticFeedback.mediumImpact();
      case HapticMode.high:
        HapticFeedback.heavyImpact();
    }
  }

  static bool needToUpdate(String currentAppVersion, String strApiVersion) {
    final versions = currentAppVersion.split('.');
    final apiVersion = strApiVersion.split('.');

    if (apiVersion.length >= 3 && currentAppVersion.length >= 3) {
      final currentMajorVersion = int.parse(versions[0]);
      final currentMinorVersion = int.parse(versions[1]);
      final currentPatchVersion = int.parse(versions[2]);

      final majorVersion = int.parse(apiVersion[0]);
      final minorVersion = int.parse(apiVersion[1]);
      final patchVersion = int.parse(apiVersion[2]);
      if (currentMajorVersion < majorVersion) {
        return true;
      } else if (currentMajorVersion == majorVersion) {
        if (currentMinorVersion < minorVersion) {
          return true;
        } else if (currentMinorVersion == minorVersion) {
          if (currentPatchVersion < patchVersion) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static const List<String> refundedList = [
    'partial_refund_initiated',
    'partially_refunded',
    'refund_failed',
    'refund_initiated',
    'refunded',
  ];
}

enum HapticMode { low, medium, high }
