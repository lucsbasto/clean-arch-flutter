import 'package:amigo_fiel/data/usecases/local_save_feedspots.dart';
import 'package:amigo_fiel/main/factories/cache/local_storage_adapter_factory.dart';

LocalSaveCurrentFeedspots makeLocalSaveCurrentFeedspots() {
  return LocalSaveCurrentFeedspots(saveSecureCacheStorage: makeLocalStorageAdapter());
}
