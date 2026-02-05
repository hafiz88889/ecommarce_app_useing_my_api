import 'package:ecommarce_myapi/app/main/core/services/app_crud_service.dart';
import 'package:ecommarce_myapi/app/main/core/services/custom_http_client.dart';

class HomeService extends AppCrudService{
  final CustomHttpClient http;
  final String url;

  HomeService({required this.http, required this.url}):super(httpClient: http, uri: url);

}