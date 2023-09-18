import 'package:amigo_fiel/main/factories/factories.dart';
import 'package:amigo_fiel/main/factories/usecases/feedspots/feedspots.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';

GetxFeedspotPresenter makeGetxFeedspotPresenter() {
  return GetxFeedspotPresenter(
      loadCurrentAccount: makeLocalLoadCurrentAccount(),
      loadFeedspots: makeLoadFeedspots(),
      loadFeedspotsById: makeLoadFeedspotById(),
      saveCurrentFeedspots: makeLocalSaveCurrentFeedspots());
}
