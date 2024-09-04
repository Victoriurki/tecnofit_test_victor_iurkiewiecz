import 'package:flutter/foundation.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/app_get_it.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/secure_storage/secure_storage_adapter.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/secure_storage/secure_storage_keys.dart';

class SessionManager {
   final _secureStorage = AppGetIt.instance.get<SecureStorageAdapter>();

  Future<void> saveSession({
    required String token, 
    required String userId,
   required String? password,
  }) async {
    await _secureStorage.save(
        key: SecureStorageKeys.token, value: token);   
    await _secureStorage.save(
        key: SecureStorageKeys.userId,
        value: userId);
    if (password != null) {
      await _secureStorage.save(
          key: SecureStorageKeys.password, value: password);
    }
    return;
  }

  Future<void> clearSession() async {
    try {
      await _secureStorage.delete(key: SecureStorageKeys.token);
      await _secureStorage.delete(key: SecureStorageKeys.userId);
      await _secureStorage.delete(key: SecureStorageKeys.password);      
      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
