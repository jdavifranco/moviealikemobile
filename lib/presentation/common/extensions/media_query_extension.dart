import 'package:flutter/material.dart';

extension IgnorePaddings on MediaQueryData {
  double get shortestSizeIgnoringPaddings {
    var shortestSize = size.shortestSide;

    if (orientation == Orientation.landscape) {
      shortestSize += viewPadding.bottom + viewPadding.top;
    }

    return shortestSize;
  }
}

// coverage:ignore-start
extension ScreenCenterRect on MediaQueryData {
  Rect get centerRect {
    return Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), width: 0, height: 0);
  }
}
// coverage:ignore-end