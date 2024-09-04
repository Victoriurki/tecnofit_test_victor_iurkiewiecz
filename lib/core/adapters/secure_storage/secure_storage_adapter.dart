import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageAdapter {
  Future<void> save({required String key, required String value});
  Future<String?> read({required String key});
  Future<void> delete({required String key});
}

class SecureStorageAdapterImplementation implements SecureStorageAdapter {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(),
  );

  @override
  Future<void> save({required String key, required String value}) async {
    return await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) async {
    return await _secureStorage.read(
      key: key,
    );
  }

  @override
  Future<void> delete({required String key}) async {
    return await _secureStorage.delete(key: key);
  }
}

