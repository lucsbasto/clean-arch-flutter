import 'package:amigo_fiel/main/factories/pages/login/login_validation_factory.dart';
import 'package:amigo_fiel/main/factories/usecases/authentication/authentication_factory.dart';
import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';

GetxLoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(makeLoginValidation(), makeRemoteAuthentication());
}
