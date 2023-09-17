import 'package:amigo_fiel/data/usecases/usecases.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';
import 'package:amigo_fiel/main/factories/cache/local_storage_adapter_factory.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(fetchSecureCacheStorage: makeLocalStorageAdapter());
}
