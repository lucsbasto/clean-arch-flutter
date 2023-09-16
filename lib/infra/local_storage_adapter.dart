// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:amigo_fiel/data/cache/save_secure_cache_storage.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;
  LocalStorageAdapter({
    required this.secureStorage,
  });
  @override
  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }
}
