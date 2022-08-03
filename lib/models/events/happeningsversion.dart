class HappeningsVersion {
  final int version;
  final List<dynamic> happenings;

  const HappeningsVersion({required this.version, required this.happenings});

  factory HappeningsVersion.fromJson(Map<String, dynamic> json) {
    return HappeningsVersion(
        version: json['version'] as int,
        happenings: json['happening'] as List<dynamic>);
  }
}
