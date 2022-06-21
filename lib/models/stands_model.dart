class StandsModel {
  final List stands;

  const StandsModel({
    required this.stands,
  });

  factory StandsModel.fromJson(Map<String, dynamic> json) {
    return StandsModel(
      stands: json['stands'],
    );
  }
  static const List standsList = [
    {
      "titel": "Horizontbank",
      "subtitle": "Info of Horizontbank",
      "starred": true
    },
    {
      "titel": "Weserstufen",
      "subtitle": "Info of Weserstufen",
      "starred": false
    },
    {
      "titel": "Galeriegärten",
      "subtitle": "Info of Galeriegärten",
      "starred": false
    }
  ];
}
