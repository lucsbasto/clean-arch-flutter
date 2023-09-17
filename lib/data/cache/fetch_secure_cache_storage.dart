import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class FetchSecureCacheStorage {
  Future<Map<String, dynamic>> fetch();
}
