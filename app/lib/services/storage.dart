import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const storage = FlutterSecureStorage();

  static Future<String?> get(String key, {bool throwOnFail = true}) async {
    final value = await storage.read(key: key);
    if (value == null && throwOnFail) {
      throw Exception('No value found for key: $key');
    }
    return value;
  }

  static Future<void> set(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
