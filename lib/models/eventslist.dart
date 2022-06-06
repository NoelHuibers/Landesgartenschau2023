class Happenings {
  final String name;
  final String description;

  const Happenings({required this.name, required this.description});

  factory Happenings.fromJson(Map<String, dynamic> json) {
    return Happenings(
      name: json['name'],
      description: json['description'],
    );
  }
}
