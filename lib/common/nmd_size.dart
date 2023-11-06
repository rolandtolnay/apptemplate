// https://www.ios-resolution.com

// iPhone SE 1st gen
import 'package:flutter/material.dart';

enum ScreenSize { smallest, small, normal }

class NmdSize {
  final BuildContext _context;

  NmdSize(this._context);

  static const kScaffoldHPadding = 16.0;

  ScreenSize get _screenSize {
    final size = MediaQuery.of(_context).size;
    if (size.width <= kScreenWidthSmallest) return ScreenSize.smallest;
    if (size.width <= kScreenWidthSmall) return ScreenSize.small;
    return ScreenSize.normal;
  }

  double get centerImageHeight {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 100;
      case ScreenSize.small:
        return 140;
      case ScreenSize.normal:
        return 180;
    }
  }

  Size get imageCardLargeRectSize {
    switch (_screenSize) {
      case ScreenSize.smallest:
      case ScreenSize.small:
        return const Size(200, 224);
      case ScreenSize.normal:
        return const Size(226, 248);
    }
  }

  double get imageCardWideHeight {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 144;
      case ScreenSize.small:
        return 160;
      case ScreenSize.normal:
        return 168;
    }
  }

  double get plannerCollectionTileHeight {
    switch (_screenSize) {
      case ScreenSize.smallest:
      case ScreenSize.small:
        return 120;
      case ScreenSize.normal:
        return 128;
    }
  }

  double get primaryButtonMinWidth {
    switch (_screenSize) {
      case ScreenSize.smallest:
      case ScreenSize.small:
        return 128;
      case ScreenSize.normal:
        return 152;
    }
  }

  double get choiceChipWidth {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 132;
      case ScreenSize.small:
        return 156;
      case ScreenSize.normal:
        return 164;
    }
  }

  double get choiceChipHorizontalPadding {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 10;
      case ScreenSize.small:
        return 12;
      case ScreenSize.normal:
        return 18;
    }
  }

  int get requestDescriptionLineCount {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 2;
      case ScreenSize.small:
      case ScreenSize.normal:
        return 3;
    }
  }

  double get profileTopPadding {
    switch (_screenSize) {
      case ScreenSize.smallest:
        return 0;
      case ScreenSize.small:
      case ScreenSize.normal:
        return 16;
    }
  }
}

const kPhoneHeightSmallest = 568.0;
// iPhone SE with Larger Text
const kScreenWidthSmallest = 320;

// iPhone 8 Plus and below, iPhone SE
const kPhoneHeightSmall = 736.0;
// iPhone SE or iPhone with Larger Text
const kScreenWidthSmall = 375;

// iPhone 14 Plus
const kPhoneWidth = 428.0;

const kTabletWidth = 768.0;
const kDesktopWidth = 1180.0;

extension BuildContextExtScreenSize on BuildContext {
  bool get isSmallScreen => MediaQuery.of(this).size.width <= kScreenWidthSmall;

  bool get isSmallestScreen =>
      MediaQuery.of(this).size.width <= kScreenWidthSmallest;

  bool get isDesktopScreen => MediaQuery.of(this).size.width >= kDesktopWidth;

  bool get isTabletScreen => MediaQuery.of(this).size.width >= kTabletWidth;
}
