import 'package:amigo_fiel/data/http/http.dart';
import 'package:amigo_fiel/infra/http_adapter.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}
