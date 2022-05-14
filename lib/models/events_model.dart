class EventsModel {
  final List events;

  const EventsModel({
    required this.events,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      events: json['events'],
    );
  }
  static const List eventsList = [
    {
      "title": "1st January",
      "subtitle": "It's newyear! Time to wish Noel and team-mates!",
    },
    {
      "title": "Cool Event",
      "subtitle": "Short Text",
    },
    {
      "title": "Long Text",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
  ];
}
