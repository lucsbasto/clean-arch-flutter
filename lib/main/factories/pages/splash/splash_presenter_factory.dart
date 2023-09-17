import 'package:amigo_fiel/main/factories/usecases/cache/load_current_account_factory.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';

GetxSplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadCurrentAccount: makeLocalLoadCurrentAccount());
}
