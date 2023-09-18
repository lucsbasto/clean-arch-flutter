import 'package:amigo_fiel/data/usecases/usecases.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';
import 'package:amigo_fiel/main/factories/http/http.dart';

LoadFeedspots makeLoadFeedspots() {
  return RemoteHandleFeedspots(httpClient: makeHttpAdapter(), url: makeApiUrl('feedspots'));
}
