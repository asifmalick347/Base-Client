import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:base_client/models/post_model.dart';
import 'package:base_client/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const int TIME_OUT_DURATION = 30;

  Future<dynamic> getData(String apiUrl) async {
    var uri = Uri.parse(baseUrl + apiUrl);
    try {
      var response = await http
          .get(uri)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded on time', uri.toString());
    }
  }

  dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with status code ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
