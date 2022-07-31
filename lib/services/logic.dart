import '/models/happenings.dart';
import '/services/client.dart' as client;
import './provider/database_provider.dart';

import '/models/eventslist.dart';
import 'internet_check.dart';

class BloC {
  late int version;
  final int currentVersion = 1;
  late List<Happening> happenings;

  writeToDatabase() async {
    try {
      final data = await client.fetchData();
      version = data.version;
      if (version != currentVersion) {
        happenings = data.happenings;
        DatabaseProvider.db.createAllHappenings(happenings);
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
