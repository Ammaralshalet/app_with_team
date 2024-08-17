import 'package:flutter/widgets.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  double getWidthPercentage(double percentage) {
    return screenWidth * percentage / 100;
  }

  double getHeightPercentage(double percentage) {
    return screenHeight * percentage / 100;
  }

  bool isMobile() => screenWidth < 600;

  bool isTablet() => screenWidth >= 600 && screenWidth < 1200;

  bool isDesktop() => screenWidth >= 1200;
}
