import 'package:verified_seat/services/storage.dart';

class LastEventService {
  static Future<bool> hasLastEvent() async {
    final eventCode =
        await StorageService.get('lastEventCode', throwOnFail: false);
    return eventCode != null;
  }

  static Future<String> getLastEvent() async {
    final eventCode = await StorageService.get('lastEventCode');
    return eventCode!;
  }

  static Future<void> setLastEvent(String eventCode) async {
    await StorageService.set('lastEventCode', eventCode);
  }
}
