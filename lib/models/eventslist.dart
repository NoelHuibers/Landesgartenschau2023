import 'happenings.dart';

class HappeningsVersion {
  final int version;
  final List<Happening> happenings;

  const HappeningsVersion({required this.version, required this.happenings});

  factory HappeningsVersion.fromJson(Map<String, dynamic> json) {
    return HappeningsVersion(
        version: json['version'], happenings: json['happening']);
  }

  getHappenings() {
    return happenings;
  }

  getVersion() {
    return version;
  }
}
