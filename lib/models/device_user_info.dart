import 'package:package_info_plus/package_info_plus.dart';

class DeviceUserInfo {
  late String _version;
  late String _buildNumber;

  DeviceUserInfo() {
    setUserDeviceProperties();
  }

  void setUserDeviceProperties () async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
  }

  String get appBuildNumber => _buildNumber;
  String get appVersion => _version;
}