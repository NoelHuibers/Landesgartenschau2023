import 'package:shared_preferences/shared_preferences.dart';

import '/models/events/happening.dart';
import '/models/stands/stand.dart';
import '/services/client.dart' as client;
import '/services/provider/database_provider.dart';

class DataFetcher {
  late int currentHappeningsVersion;
  late int currentStandsVersion;
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    currentHappeningsVersion = prefs.getInt('currentHappeningsVersion') ?? 0;
    currentStandsVersion = prefs.getInt('currentStandsVersion') ?? 0;
  }

  Future<bool> writeHappeningsToDatabase() async {
    try {
      final data = await client.fetchHappenings();
      final int version = data.version;
      if (version != currentHappeningsVersion) {
        final List<Happening> happeningsList = data.happenings
            .map((happening) => Happening.fromJsonAPI(happening))
            .toList();
        DatabaseProvider.instance.updateAllHappenings(happeningsList);
        prefs.setInt('Happeningsversion', version);
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> writeStandsToDatabase() async {
    try {
      final data = await client.fetchStands();
      final int version = data.version;
      if (version != currentStandsVersion) {
        final List<Stand> standsList =
            data.stands.map((stand) => Stand.fromJsonAPI(stand)).toList();
        DatabaseProvider.instance.updateAllStands(standsList);
        prefs.setInt('Standsversion', version);
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
