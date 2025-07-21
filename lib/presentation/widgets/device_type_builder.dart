import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/media_query_extension.dart';

class DeviceTypeBuilder extends StatelessWidget {
  const DeviceTypeBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, DeviceType deviceType) builder;

  @override
  Widget build(BuildContext context) => builder(
        context,
        getDeviceType(context),
      );
}

enum DeviceType {
  smallPhone("small"),
  phone("normal"),
  large("large");

  final String deviceString;

  const DeviceType(this.deviceString);
}

DeviceType getDeviceType(context) {
  final data = MediaQuery.of(context);

  if (data.shortestSizeIgnoringPaddings < 360) {
    return DeviceType.smallPhone;
  } else if (data.shortestSizeIgnoringPaddings < 576) {
    return DeviceType.phone;
  }
  return DeviceType.large;
}
