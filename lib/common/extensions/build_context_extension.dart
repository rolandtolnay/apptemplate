import 'package:flutter/material.dart';

import '../constants.dart';
import '../nmd_size.dart';

extension BuildContextTheme on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get topSafeArea => MediaQuery.of(this).padding.top;

  double get bottomSafeArea => MediaQuery.of(this).padding.bottom;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get disabledColor => Theme.of(this).disabledColor;

  NmdColor get nmdColor => const NmdColor();

  NmdTypography get nmdTypography => const NmdTypography();

  NmdSize get nmdSize => NmdSize(this);
}

extension BuildContextNavigatorConvenience on BuildContext {
  bool get isTopMostRoute => ModalRoute.of(this)?.isCurrent ?? false;

  bool get canPop => ModalRoute.of(this)?.canPop ?? false;
}

extension ColorFilerConvenience on Color {
  ColorFilter get filter => ColorFilter.mode(this, BlendMode.srcIn);
}
