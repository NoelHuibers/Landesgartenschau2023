const String tableStands = 'Stands';

class StandsFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String openingHours = 'openingHours';
  static const String standCategory = 'standCategory';
  static const String standCategoryId = 'standCategoryId';
}

class Stand {
  final int? id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final openingHours;
  final String standCategory;
  final int standCategoryId;

  const Stand({
    this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.openingHours,
    required this.standCategory,
    required this.standCategoryId,
  });

  factory Stand.fromJsonAPI(Map<String, dynamic> json) {
    return Stand(
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      openingHours: json['opening_hours'],
      standCategory: json['stand_category'] as String,
      standCategoryId: json['stand_category_id'] as int,
    );
  }

  factory Stand.fromJsonDB(Map<String, dynamic> json) {
    return Stand(
      id: json[StandsFields.id] as int,
      name: json[StandsFields.name] as String,
      description: json[StandsFields.description] as String,
      latitude: json[StandsFields.latitude] as double,
      longitude: json[StandsFields.longitude] as double,
      openingHours: json[StandsFields.openingHours],
      standCategory: json[StandsFields.standCategory] as String,
      standCategoryId: json[StandsFields.standCategoryId] as int,
    );
  }

  Map<String, Object?> toJson() => {
        StandsFields.id: id,
        StandsFields.name: name,
        StandsFields.description: description,
        StandsFields.latitude: latitude,
        StandsFields.longitude: longitude,
        StandsFields.openingHours: openingHours,
        StandsFields.standCategory: standCategory,
        StandsFields.standCategoryId: standCategoryId,
      };

  Stand copy({
    int? id,
    String? name,
    String? description,
    double? latitude,
    double? longitude,
    openingHours,
    String? standCategory,
    int? standCategoryId,
  }) =>
      Stand(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        openingHours: openingHours ?? this.openingHours,
        standCategory: standCategory ?? this.standCategory,
        standCategoryId: standCategoryId ?? this.standCategoryId,
      );
}
