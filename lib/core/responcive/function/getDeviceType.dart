import 'package:flutter/material.dart';
import 'package:quizmopile/core/responcive/enums/diviceType.dart';

DeviceType getDeviceType(MediaQueryData m) {
  Orientation orintation = m.orientation;
  double width = 0;
  if (orintation == Orientation.landscape) {
    width = m.size.height;
  } else {
    width = m.size.width;
  }
  if (width >= 950) {
    return DeviceType.Desktop;
  }
  if (width >= 400) {
    return DeviceType.Tablet;
  }
  print(width);
  print("mobi;eee");
  return DeviceType.Mobile;
}
