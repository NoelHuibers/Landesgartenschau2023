const String tableHappenings = 'Happenings';

class HappeningFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String startdate = 'startdate';
  static const String enddate = 'enddate';
  static const String areaId = 'areaId';
}

class Happening {
  final int? id;
  final String name;
  final String description;
  final String startdate;
  final String enddate;
  final int areaId;

  const Happening({
    this.id,
    required this.name,
    required this.description,
    required this.startdate,
    required this.enddate,
    required this.areaId,
  });

  factory Happening.fromJsonAPI(Map<String, dynamic> json) {
    return Happening(
      name: json['name'] as String,
      description: json['description'] as String,
      startdate: json['startDayTime'] as String,
      enddate: json['endDayTime'] as String,
      areaId: json['area_id'] as int,
    );
  }

  factory Happening.fromJsonDB(Map<String, dynamic> json) {
    return Happening(
      id: json[HappeningFields.id] as int,
      name: json[HappeningFields.name] as String,
      description: json[HappeningFields.description] as String,
      startdate: json[HappeningFields.startdate] as String,
      enddate: json[HappeningFields.enddate] as String,
      areaId: json[HappeningFields.areaId] as int,
    );
  }

  Map<String, Object?> toJson() => {
        HappeningFields.id: id,
        HappeningFields.name: name,
        HappeningFields.description: description,
        HappeningFields.startdate: startdate,
        HappeningFields.enddate: enddate,
        HappeningFields.areaId: areaId,
      };

  Happening copy({
    int? id,
    String? name,
    String? description,
    String? startdate,
    String? enddate,
    int? areaId,
  }) =>
      Happening(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startdate: startdate ?? this.startdate,
        enddate: enddate ?? this.enddate,
        areaId: areaId ?? this.areaId,
      );
}
