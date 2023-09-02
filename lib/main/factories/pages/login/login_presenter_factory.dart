import 'package:amigo_fiel/main/factories/pages/login/login_validation_factory.dart';
import 'package:amigo_fiel/main/factories/usecases/authentication/authentication_factory.dart';
import 'package:amigo_fiel/presentation/presenters/stream_login_presenter.dart';
import 'package:amigo_fiel/ui/pages/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(makeLoginValidation(), makeRemoteAuthentication());
}
