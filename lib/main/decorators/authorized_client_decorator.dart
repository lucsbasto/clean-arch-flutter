import '../../data/cache/cache.dart';
import '../../data/http/http.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final FetchSecureCacheStorage fetchSecureCacheStorage;
  final HttpClient httpClient;

  AuthorizeHttpClientDecorator({
    required this.fetchSecureCacheStorage,
    required this.httpClient,
  });

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    try {
      final token = await fetchSecureCacheStorage.fetch('accessToken');
      final authorizedHeaders = headers ?? {}
        ..addAll({'x-access-token': token});
      return await httpClient.request(url: url, method: method, body: body, headers: authorizedHeaders);
    } catch (error) {
      rethrow;
    }
  }
}
