// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amigo_fiel/data/cache/cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage, FetchSecureCacheStorage {
  final FlutterSecureStorage secureStorage;
  LocalStorageAdapter({
    required this.secureStorage,
  });
  @override
  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<Map<String, dynamic>> fetch() async {
    final user = await secureStorage.readAll();
    return user;
  }
}
