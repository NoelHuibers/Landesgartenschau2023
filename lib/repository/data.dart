class Data {
  final int id;

  const Data({
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
    );
  }
}
