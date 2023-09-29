abstract class FetchSecureCacheStorage {
  Future<String?> fetch(String key);
  Future<Map<String, dynamic>> fetchAll();
}
