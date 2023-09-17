abstract class SaveSecureCacheStorage {
  Future<void> save({required String key, required String value});
  Future<String?> get({required String key});
}
