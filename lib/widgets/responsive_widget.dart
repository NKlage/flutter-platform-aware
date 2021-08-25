import 'package:flutter/material.dart';

abstract class ResponsiveWidget<MOBILE extends Widget, TABLET extends Widget,
    DESKTOP extends Widget> extends StatelessWidget {

  // Helper Methods

  /// Checks if it is a mobile phone.
  /// The maximum width is <= 850 for this device
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  /// Checks if this is a tablet.
  /// The minimum width is >= 850, the maximum width is < 1100.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  /// Checks whether the device is a desktop device.
  /// The minimum width is >= 1100.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1100) {
      return createDesktopWidget(context);
    } else if (_size.width >= 850) {
      return createTabletWidget(context);
    } else {
      return createMobileWidget(context);
    }
  }

  MOBILE createMobileWidget(BuildContext context);
  TABLET createTabletWidget(BuildContext context);
  DESKTOP createDesktopWidget(BuildContext context);
}
