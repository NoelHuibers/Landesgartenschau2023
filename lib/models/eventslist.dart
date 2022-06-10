class Happenings {
  final int version;
  final List happening;

  const Happenings({required this.version, required this.happening});

  factory Happenings.fromJson(Map<String, dynamic> json) {
    return Happenings(version: json['version'], happening: json['happening']);
  }
}
