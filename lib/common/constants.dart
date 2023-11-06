import 'package:flutter/material.dart';

class NmdColor {
  const NmdColor();

  Color get neutral100 => const Color(0xFFF4F4F5);
  Color get neutral200 => const Color(0xFFE9E9E9);
  Color get neutral400 => const Color(0xFFDDDDDD);
  Color get neutral500 => const Color(0xFFB9B9BB);
  Color get neutral600 => const Color(0xFF7A7A82);
  Color get neutral700 => const Color(0xFF41414D);
  Color get neutral800 => const Color(0xFF25252E);
  Color get neutral900 => const Color(0xFF060610);

  Color get primaryGreen => const Color(0xff264653);
  Color get primaryYellow => const Color(0xffE9C46A);

  Color get primaryDisabled => const Color(0xffabb5ba);

  Color get iconColor => const Color(0xff292D32);
  Color get lightGrey => const Color(0xff707070);

  Gradient get primaryGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff3c5964),
          Color(0xFF264653),
        ],
      );

  Gradient get primaryGradientDisabled => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffabb5ba),
          Color(0xff96a2a8),
        ],
      );
}

class NmdTypography {
  const NmdTypography();

  /// At the top of pages
  TextStyle get headline => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.5,
        color: Color(0xff1f1f1f),
      );

  /// Detail view under image
  TextStyle get titleLarge => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.5,
        color: Color(0xff1f1f1f),
      );

  /// Section title
  TextStyle get titleSmall => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 1.5,
        color: Color(0xff1f1f1f),
      );

  TextStyle get buttonLarge => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 17,
        height: 1.5,
        color: Colors.white,
      );

  /// Used for address beneath title
  TextStyle get subtitleLarge => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15,
        height: 1.5,
        color: Color(0xff707070),
      );

  /// Used for short text like phone number
  TextStyle get subtitleSmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.5,
        color: Color(0xff363636),
      );

  /// Used for long text like activity description
  TextStyle get bodyMedium => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        height: 1.5,
        color: Color(0xff5f5f5f),
      );

  TextStyle get buttonSmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 1.5,
        color: Color(0xff454545),
      );

  /// Used for short title text phone section title
  TextStyle get label => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        height: 1.5,
        color: Color(0xff5f5f5f),
      );

  /// Used for short subtitles like review time ago
  TextStyle get labelSmall => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12,
        height: 1.5,
        color: Color(0xff545454),
      );
}

class NmdAnimation {
  /// Used when elements move from one place to the other, or disappear only temporariliy
  static const curveStandard = Curves.easeInOutCubic;

  /// Used when elements appear on the screen
  static const curveAppear = Curves.easeOutCubic;

  /// Used when elements disappear from the screen
  static const curveDisappear = Curves.easeInCubic;

  /// Used when we want to speed up the animation start.
  ///
  /// Recommended duration normal.
  static const curveSnappy = Curves.fastOutSlowIn;

  /// Used on small buttons
  static const durationFast = Duration(milliseconds: 200);

  /// Used on most interface elements, and travel distances
  static const durationNormal = Duration(milliseconds: 300);

  /// Used on bigger interface elements, or longer distances
  static const durationSlow = Duration(milliseconds: 500);
}
