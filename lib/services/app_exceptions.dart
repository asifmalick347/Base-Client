class AppExceptions implements Exception{
  String? message;
  String? prefix;
  String? url;

  AppExceptions([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppExceptions{
  BadRequestException([message , url]) : super (message, 'Bad Request', url);
}

class FetchDataException extends AppExceptions{
  FetchDataException([message , url]) : super (message, 'Unable to process data', url);
}
class ApiNotRespondingException extends AppExceptions{
  ApiNotRespondingException([message , url]) : super (message, 'Api not responding on time', url);
}
class UnauthorizedException extends AppExceptions{
  UnauthorizedException([message , url]) : super (message, 'Unauthorized Request', url);
}