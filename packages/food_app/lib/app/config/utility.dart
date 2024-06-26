import 'package:flutter/material.dart';

class Utility {
  static bool getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);
    return data.size.shortestSide < 550 ? false : true;
  }
}
