import 'package:shared_preferences/shared_preferences.dart';

import '/models/events/happening.dart';
import '/services/client.dart' as client;
import '/services/provider/database_provider.dart';

class BloC {
  late int version;
  late int currentVersion;
  late List<Happening> happeningsList;

  writeToDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    final currentVersion = prefs.getInt('Happeningsversion') ?? 0;
    try {
      final data = await client.fetchHappenings();
      final version = data.version;
      if (version != currentVersion) {
        final happeningsList = data.happenings
            .map((happening) => Happening.fromJsonAPI(happening))
            .toList();
        DatabaseProvider.instance.updateAllHappenings(happeningsList);
        prefs.setInt('Happeningsversion', version);
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
