import 'package:amigo_fiel/data/usecases/usecases.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';
import 'package:amigo_fiel/main/factories/http/authorize_http_client_factory.dart';
import 'package:amigo_fiel/main/factories/http/http.dart';

LoadFeedspots makeLoadFeedspots() {
  return RemoteHandleFeedspots(httpClient: makeAuthorizeHttpAdapterDecorator(), url: makeApiUrl('feedspots'));
}
