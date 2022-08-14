const String tableStands = 'Stands';

class StandsFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String description = 'descrition';
  static const String startdate = 'startdate';
  static const String enddate = 'enddate';
  static const String areaId = 'areaId';
}

class Stand {
  final int? id;
  final String name;
  final String description;
  final String startdate;
  final String enddate;
  final int areaId;

  const Stand({
    this.id,
    required this.name,
    required this.description,
    required this.startdate,
    required this.enddate,
    required this.areaId,
  });

  factory Stand.fromJsonAPI(Map<String, dynamic> json) {
    return Stand(
        name: json['name'] as String,
        description: json['description'] as String,
        startdate: json['startDayTime'] as String,
        enddate: json['endDayTime'] as String,
        areaId: json['area_id'] as int);
  }

  factory Stand.fromJsonDB(Map<String, dynamic> json) {
    return Stand(
        id: json[StandsFields.id] as int,
        name: json[StandsFields.name] as String,
        description: json[StandsFields.description] as String,
        startdate: json[StandsFields.startdate] as String,
        enddate: json[StandsFields.enddate] as String,
        areaId: json[StandsFields.areaId] as int);
  }

  Map<String, Object?> toJson() => {
        StandsFields.id: id,
        StandsFields.name: name,
        StandsFields.description: description,
        StandsFields.startdate: startdate,
        StandsFields.enddate: enddate,
        StandsFields.areaId: areaId,
      };

  Stand copy({
    int? id,
    String? name,
    String? description,
    String? startdate,
    String? enddate,
    int? areaId,
  }) =>
      Stand(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startdate: startdate ?? this.startdate,
        enddate: enddate ?? this.enddate,
        areaId: areaId ?? this.areaId,
      );
}
