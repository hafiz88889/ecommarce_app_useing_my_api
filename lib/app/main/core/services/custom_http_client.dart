import 'dart:convert';
import 'package:http/http.dart' as http;
 class CustomHttpClient {

  Future<Map<String, String>> getHeaders({authToken}) async {
    // Implement logic to get authentication headers or other required headers
    if (authToken != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
        // Add more headers as needed
      };
    } else {
      return {
        'Content-Type': 'application/json',
        // Add more headers as needed
      };
    }
  }

  Future<dynamic> get({required String uri, token}) async {
    final response = await http.get(Uri.parse(uri),
        headers: await getHeaders(authToken: token));
    return _handleResponse(response);
  }

  Future<dynamic> post({required String uri, required dynamic data, token}) async {
    final response = await http.post(
      Uri.parse(uri),
      headers: await getHeaders(authToken: token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }
  Future<dynamic> put({required String uri, required dynamic data, token}) async {
    final response = await http.put(
      Uri.parse(uri),
      headers: await getHeaders(authToken: token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete({required String uri, required dynamic data, token}) async {
    final response = await http.delete(
      Uri.parse(uri),
      headers: await getHeaders(authToken: token),
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) async {
    return json.decode(utf8.decode(response.bodyBytes));
  }
}