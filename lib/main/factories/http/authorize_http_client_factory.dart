import 'package:amigo_fiel/data/http/http.dart';
import 'package:amigo_fiel/main/decorators/decorators.dart';
import 'package:amigo_fiel/main/factories/factories.dart';

HttpClient makeAuthorizeHttpAdapterDecorator() {
  return AuthorizeHttpClientDecorator(
    httpClient: makeHttpAdapter(),
    fetchSecureCacheStorage: makeLocalStorageAdapter(),
  );
}
