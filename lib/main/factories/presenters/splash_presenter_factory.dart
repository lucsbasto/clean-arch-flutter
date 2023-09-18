import 'package:amigo_fiel/main/factories/factories.dart';
import 'package:amigo_fiel/main/factories/usecases/feedspots/feedspots.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';

GetxSplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
    loadCurrentAccount: makeLocalLoadCurrentAccount(),
    loadAllFeedspots: makeLoadFeedspots(),
    saveCurrentFeedspots: makeLocalSaveCurrentFeedspots(),
  );
}
