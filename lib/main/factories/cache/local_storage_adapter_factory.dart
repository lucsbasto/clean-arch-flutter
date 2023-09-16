import 'package:amigo_fiel/infra/local_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

LocalStorageAdapter makeLocalStorageAdapter() {
  const secureStorage = FlutterSecureStorage();
  return LocalStorageAdapter(secureStorage: secureStorage);
}
