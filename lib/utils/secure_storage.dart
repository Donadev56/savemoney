import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:save_money/logger/log.dart';

class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<String?> loadPrivateKey(String userId) async {
    return await _secureStorage.read(key: 'userPrivateKey/$userId');
  }

  Future<void> savePrivateKey(String value, String userId) async {
    return await _secureStorage.write(
        key: 'userPrivateKey/$userId', value: value);
  }

  Future<void> deletePrivateKey(String userId) async {
    await _secureStorage.delete(key: 'userPrivateKey/$userId');
  }

  Future<void> saveDataInFSS(String value, String name) async {
    try {
      await _secureStorage.write(key: name, value: value);
    } catch (e) {
      logError("Error saving $name to FSS: $e");
    }
  }

  Future<String?> loadDataFromFSS(String name) async {
    log("Loading $name from FSS...");
    try {
      final data = await _secureStorage.read(key: name);
      if (data == null) {
        logError("No data found for key: $name");
        return null;
      }
      return data;
    } catch (e) {
      logError("Error loading $name from FSS: $e");
      return null;
    }
  }
}
