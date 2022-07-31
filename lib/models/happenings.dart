class Happening {
  final int id;
  final String name;
  final String description;
  final DateTime date;

  const Happening(
      {required this.id,
      required this.name,
      required this.description,
      required this.date});

  factory Happening.fromJson(Map<String, dynamic> json) {
    return Happening(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        date: json['date']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "date": date,
      };
}
