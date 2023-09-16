import 'package:amigo_fiel/data/usecases/usecases.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';
import 'package:amigo_fiel/main/factories/http/api_url_factory.dart';
import 'package:amigo_fiel/main/factories/http/http_client_factory.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(httpClient: makeHttpAdapter(), url: makeApiUrl('auth/login'));
}
