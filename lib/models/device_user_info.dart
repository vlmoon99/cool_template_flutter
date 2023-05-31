import 'package:package_info_plus/package_info_plus.dart';

class DeviceUserInfo {
  late String version;
  late String buildNumber;

  DeviceUserInfo() {
    setUserDeviceProperties();
  }

  void setUserDeviceProperties() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}
