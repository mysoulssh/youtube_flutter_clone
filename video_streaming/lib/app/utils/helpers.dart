import 'package:video_streaming/app/utils/uiutils.dart';

class Helpers {
  /// Return device type based on the width of the screen
  static DeviceSizeType getDeviceType(double width) {
    if (width < 600) return DeviceSizeType.phone;
    if (width < 1240) return DeviceSizeType.table;
    return DeviceSizeType.web;
  }
}
