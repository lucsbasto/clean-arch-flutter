import 'package:amigo_fiel/data/usecases/usecases.dart';
import 'package:amigo_fiel/main/factories/cache/local_storage_adapter_factory.dart';

LocalSaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(saveSecureCacheStorage: makeLocalStorageAdapter());
}
