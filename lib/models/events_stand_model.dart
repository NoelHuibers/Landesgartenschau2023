class EventsList {
  final String titel;
  final String subtitle;

  const EventsList({
    required this.titel,
    required this.subtitle,
  });

  factory EventsList.fromJson(Map<String, dynamic> json) {
    return EventsList(
      titel: json['titel'],
      subtitle: json['subtitle'],
    );
  }
}

class StandsList {
  final String titel;
  final String subtitle;

  const StandsList({
    required this.titel,
    required this.subtitle,
  });

  factory StandsList.fromJson(Map<String, dynamic> json) {
    return StandsList(
      titel: json['titel'],
      subtitle: json['subtitle'],
    );
  }
}
