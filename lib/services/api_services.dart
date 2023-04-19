import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_client/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  var baseUrl = '';
  static const int TIME_OUT_DURATION = 30;

  //GET
  Future<dynamic> getData() async {
    var uri = Uri.parse(baseUrl);
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Api not responded on time', uri.toString());
    }
  }

  // process Api data //
  dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code: ${response.statusCode}}',
            response.request!.url.toString());
    }
  }
}
