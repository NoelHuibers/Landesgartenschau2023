class StandsVersion {
  final int version;
  final List<dynamic> stands;

  const StandsVersion({required this.version, required this.stands});

  factory StandsVersion.fromJson(Map<String, dynamic> json) {
    return StandsVersion(
        version: json['version'] as int,
        stands: json['stands'] as List<dynamic>);
  }
}
