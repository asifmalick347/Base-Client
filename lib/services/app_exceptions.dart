class AppExceptions implements Exception{
  String? message;
  String? preffix;
  String? url;

  AppExceptions([this.message, this.preffix, this.url]);
}

class BadRequestException extends AppExceptions{
  BadRequestException([String? message, String? url]) : super(message, 'Bad Request', url);
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message, String? url]) : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppExceptions{
  ApiNotRespondingException([String? message, String? url]) : super(message, 'Api not responding', url);
}

class UnAuthorizedRequestException extends AppExceptions{
  UnAuthorizedRequestException([String? message, String? url]) : super(message, 'Unauthorized Request', url);
}