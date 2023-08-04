import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> getRequest(String url) => http.get(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );
}