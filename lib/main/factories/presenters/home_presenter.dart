import 'package:amigo_fiel/main/factories/factories.dart';
import 'package:amigo_fiel/main/factories/usecases/feedspots/feedspots.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';

GetxHomePresenter makeGetxHomePresenter() {
  return GetxHomePresenter(
    loadAllFeedspots: makeLoadFeedspots(),
    loadCurrentAccount: makeLocalLoadCurrentAccount(),
  );
}
