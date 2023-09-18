import 'package:amigo_fiel/main/factories/factories.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';

GetxLoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(makeLoginValidation(), makeRemoteAuthentication(), makeLocalSaveCurrentAccount());
}
